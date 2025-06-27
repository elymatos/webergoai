# ErgoAI Web Interface Backend API
# This provides a REST API to interface with ErgoAI engine and manage knowledge bases

from flask import Flask, request, jsonify, session
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from datetime import datetime
import subprocess
import tempfile
import os
import uuid
import json
import logging
from pathlib import Path

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def create_app():
    """Application factory pattern"""
    app = Flask(__name__)

    # Configuration
    app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'postgresql://ergoai_user:ergoai_password@localhost:5432/ergoai_db')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {
        'pool_timeout': 20,
        'pool_recycle': -1,
        'pool_pre_ping': True
    }

    return app

# Create Flask app
app = create_app()

# Initialize extensions
db = SQLAlchemy(app)
migrate = Migrate(app, db)
CORS(app)

# Database Models
class Project(db.Model):
    """Knowledge base project model"""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    user_id = db.Column(db.Integer, nullable=False)  # Add user management later

    # Relationships
    files = db.relationship('ErgoFile', backref='project', lazy=True, cascade='all, delete-orphan')
    queries = db.relationship('QueryHistory', backref='project', lazy=True)

class ErgoFile(db.Model):
    """ErgoAI file model for persistent storage"""
    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(255), nullable=False)
    content = db.Column(db.Text, nullable=False)
    file_type = db.Column(db.String(50), default='ergo')  # ergo, ergotext, query
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # Foreign keys
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'), nullable=False)

class QueryHistory(db.Model):
    """Query execution history"""
    id = db.Column(db.Integer, primary_key=True)
    query = db.Column(db.Text, nullable=False)
    result = db.Column(db.Text)
    execution_time = db.Column(db.Float)  # seconds
    status = db.Column(db.String(20))  # success, error, timeout
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    # Foreign keys
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'), nullable=False)

class ErgoAIEngine:
    """Interface to ErgoAI engine"""

    def __init__(self, ergoai_path="/path/to/ergoai"):
        self.ergoai_path = Path(ergoai_path)
        self.temp_dir = Path(tempfile.gettempdir()) / "ergoai_web"
        self.temp_dir.mkdir(exist_ok=True)

    def execute_query(self, query, knowledge_base_files=None, timeout=30):
        """Execute an ErgoAI query"""
        try:
            session_id = str(uuid.uuid4())
            session_dir = self.temp_dir / session_id
            session_dir.mkdir(exist_ok=True)

            # Write knowledge base files
            if knowledge_base_files:
                for filename, content in knowledge_base_files.items():
                    file_path = session_dir / filename
                    file_path.write_text(content)

            # Create query file
            query_file = session_dir / "query.ergo"
            query_file.write_text(query)

            # Execute ErgoAI
            result = self._run_ergoai(session_dir, query_file, timeout)

            # Cleanup
            self._cleanup_session(session_dir)

            return result

        except Exception as e:
            logger.error(f"Query execution failed: {str(e)}")
            return {
                'status': 'error',
                'message': str(e),
                'result': None
            }

    def _run_ergoai(self, session_dir, query_file, timeout):
        """Run ErgoAI command line interface"""
        cmd = [
            str(self.ergoai_path / "runErgoAI.sh"),
            "--batch",
            "--file", str(query_file)
        ]

        start_time = datetime.now()

        try:
            process = subprocess.run(
                cmd,
                cwd=session_dir,
                capture_output=True,
                text=True,
                timeout=timeout
            )

            execution_time = (datetime.now() - start_time).total_seconds()

            if process.returncode == 0:
                return {
                    'status': 'success',
                    'result': process.stdout,
                    'execution_time': execution_time
                }
            else:
                return {
                    'status': 'error',
                    'message': process.stderr,
                    'execution_time': execution_time
                }

        except subprocess.TimeoutExpired:
            return {
                'status': 'timeout',
                'message': f'Query execution timed out after {timeout} seconds',
                'execution_time': timeout
            }

    def _cleanup_session(self, session_dir):
        """Clean up temporary session files"""
        try:
            import shutil
            shutil.rmtree(session_dir)
        except Exception as e:
            logger.warning(f"Failed to cleanup session {session_dir}: {str(e)}")

    def validate_syntax(self, content, file_type='ergo'):
        """Validate ErgoAI syntax"""
        try:
            temp_file = self.temp_dir / f"syntax_check_{uuid.uuid4()}.{file_type}"
            temp_file.write_text(content)

            cmd = [
                str(self.ergoai_path / "runErgoAI.sh"),
                "--syntax-check",
                str(temp_file)
            ]

            process = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
            temp_file.unlink()

            return {
                'valid': process.returncode == 0,
                'errors': process.stderr if process.returncode != 0 else None
            }

        except Exception as e:
            return {
                'valid': False,
                'errors': str(e)
            }

# Initialize ErgoAI engine
ergo_engine = ErgoAIEngine()

# API Routes

@app.route('/api/projects', methods=['GET'])
def get_projects():
    """Get all projects for the current user"""
    projects = Project.query.all()  # Add user filtering later
    return jsonify([{
        'id': p.id,
        'name': p.name,
        'description': p.description,
        'created_at': p.created_at.isoformat(),
        'updated_at': p.updated_at.isoformat(),
        'file_count': len(p.files)
    } for p in projects])

@app.route('/api/projects', methods=['POST'])
def create_project():
    """Create a new project"""
    data = request.get_json()

    project = Project(
        name=data['name'],
        description=data.get('description', ''),
        user_id=1  # TODO: Get from session/auth
    )

    db.session.add(project)
    db.session.commit()

    return jsonify({
        'id': project.id,
        'name': project.name,
        'description': project.description,
        'created_at': project.created_at.isoformat()
    }), 201

@app.route('/api/projects/<int:project_id>/files', methods=['GET'])
def get_project_files(project_id):
    """Get all files in a project"""
    project = Project.query.get_or_404(project_id)
    return jsonify([{
        'id': f.id,
        'filename': f.filename,
        'file_type': f.file_type,
        'created_at': f.created_at.isoformat(),
        'updated_at': f.updated_at.isoformat()
    } for f in project.files])

@app.route('/api/projects/<int:project_id>/files', methods=['POST'])
def create_file(project_id):
    """Create a new file in a project"""
    project = Project.query.get_or_404(project_id)
    data = request.get_json()

    file = ErgoFile(
        filename=data['filename'],
        content=data.get('content', ''),
        file_type=data.get('file_type', 'ergo'),
        project_id=project_id
    )

    db.session.add(file)
    db.session.commit()

    return jsonify({
        'id': file.id,
        'filename': file.filename,
        'content': file.content,
        'file_type': file.file_type
    }), 201

@app.route('/api/files/<int:file_id>', methods=['GET'])
def get_file(file_id):
    """Get a specific file"""
    file = ErgoFile.query.get_or_404(file_id)
    return jsonify({
        'id': file.id,
        'filename': file.filename,
        'content': file.content,
        'file_type': file.file_type,
        'updated_at': file.updated_at.isoformat()
    })

@app.route('/api/files/<int:file_id>', methods=['PUT'])
def update_file(file_id):
    """Update a file"""
    file = ErgoFile.query.get_or_404(file_id)
    data = request.get_json()

    file.content = data['content']
    file.updated_at = datetime.utcnow()

    db.session.commit()

    return jsonify({
        'id': file.id,
        'filename': file.filename,
        'updated_at': file.updated_at.isoformat()
    })

@app.route('/api/execute', methods=['POST'])
def execute_query():
    """Execute an ErgoAI query"""
    data = request.get_json()
    query = data['query']
    project_id = data.get('project_id')

    # Get knowledge base files if project specified
    knowledge_base_files = {}
    if project_id:
        project = Project.query.get_or_404(project_id)
        knowledge_base_files = {
            f.filename: f.content
            for f in project.files
            if f.file_type in ['ergo', 'ergotext']
        }

    # Execute query
    result = ergo_engine.execute_query(query, knowledge_base_files)

    # Save to history
    if project_id:
        history = QueryHistory(
            query=query,
            result=result.get('result', ''),
            execution_time=result.get('execution_time', 0),
            status=result['status'],
            project_id=project_id
        )
        db.session.add(history)
        db.session.commit()

    return jsonify(result)

@app.route('/api/validate', methods=['POST'])
def validate_syntax():
    """Validate ErgoAI syntax"""
    data = request.get_json()
    content = data['content']
    file_type = data.get('file_type', 'ergo')

    result = ergo_engine.validate_syntax(content, file_type)
    return jsonify(result)

@app.route('/api/explain', methods=['POST'])
def explain_query():
    """Generate explanation for a query result"""
    data = request.get_json()
    query = data['query']
    project_id = data.get('project_id')

    # Get knowledge base files
    knowledge_base_files = {}
    if project_id:
        project = Project.query.get_or_404(project_id)
        knowledge_base_files = {
            f.filename: f.content
            for f in project.files
            if f.file_type in ['ergo', 'ergotext']
        }

    # Add explanation directive to query
    explain_query = f"why{{{query}}}."

    result = ergo_engine.execute_query(explain_query, knowledge_base_files)
    return jsonify(result)

@app.route('/api/projects/<int:project_id>/history', methods=['GET'])
def get_query_history(project_id):
    """Get query history for a project"""
    project = Project.query.get_or_404(project_id)
    queries = QueryHistory.query.filter_by(project_id=project_id).order_by(
        QueryHistory.created_at.desc()
    ).limit(50).all()

    return jsonify([{
        'id': q.id,
        'query': q.query,
        'status': q.status,
        'execution_time': q.execution_time,
        'created_at': q.created_at.isoformat()
    } for q in queries])

@app.route('/api/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'ergoai_available': True,  # TODO: Actually check ErgoAI availability
        'database_connected': True
    })

# Error handlers
@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Resource not found'}), 404

@app.errorhandler(500)
def internal_error(error):
    db.session.rollback()
    return jsonify({'error': 'Internal server error'}), 500

# Database initialization
def create_tables():
    """Initialize database tables"""
    with app.app_context():
        db.create_all()
        logger.info("Database tables created successfully")

# Initialize database when app starts
def init_app():
    """Initialize the application"""
    create_tables()
    logger.info("ErgoAI Web Interface started successfully")

if __name__ == '__main__':
    init_app()
    app.run(debug=True, host='0.0.0.0', port=5000)
else:
    # For production deployment (gunicorn, etc.)
    init_app()
