# backend/app_simple.py
# Simplified Flask app - no Celery, no complexity!

from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import subprocess
import tempfile
import os
from pathlib import Path
import uuid

# Simple Flask app
app = Flask(__name__)
app.config['SECRET_KEY'] = 'simple-dev-key'
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv(
    'DATABASE_URL',
    'postgresql://ergoai_user:simple_password@postgres:5432/ergoai_db'
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
CORS(app)

# Simple database models
class Project(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    files = db.relationship('ErgoFile', backref='project', lazy=True)

class ErgoFile(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(255), nullable=False)
    content = db.Column(db.Text, nullable=False)
    project_id = db.Column(db.Integer, db.ForeignKey('project.id'), nullable=False)

# Simple ErgoAI interface
class SimpleErgoAI:
    def __init__(self):
        self.ergoai_path = Path(os.getenv('ERGOAI_PATH', '/opt/ergoai'))
        self.temp_dir = Path(tempfile.gettempdir()) / "ergoai_simple"
        self.temp_dir.mkdir(exist_ok=True)

    def execute_query(self, query, files=None):
        """Execute ErgoAI query - simple version"""
        try:
            session_dir = self.temp_dir / str(uuid.uuid4())
            session_dir.mkdir(exist_ok=True)

            # Write files
            if files:
                for filename, content in files.items():
                    (session_dir / filename).write_text(content)

            # Write query
            query_file = session_dir / "query.ergo"
            query_file.write_text(query)

            # Run ErgoAI (simplified)
            cmd = [str(self.ergoai_path / "runErgoAI.sh"), "--batch", "--file", str(query_file)]
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)

            # Cleanup
            import shutil
            shutil.rmtree(session_dir)

            if result.returncode == 0:
                return {'status': 'success', 'result': result.stdout}
            else:
                return {'status': 'error', 'message': result.stderr}

        except Exception as e:
            return {'status': 'error', 'message': str(e)}

ergo = SimpleErgoAI()

# Simple API routes
@app.route('/api/health')
def health():
    return jsonify({'status': 'healthy', 'message': 'Simple ErgoAI API running'})

@app.route('/api/projects')
def get_projects():
    projects = Project.query.all()
    return jsonify([{
        'id': p.id,
        'name': p.name,
        'description': p.description
    } for p in projects])

@app.route('/api/projects', methods=['POST'])
def create_project():
    data = request.json
    project = Project(name=data['name'], description=data.get('description', ''))
    db.session.add(project)
    db.session.commit()
    return jsonify({'id': project.id, 'name': project.name})

@app.route('/api/projects/<int:project_id>/files')
def get_files(project_id):
    files = ErgoFile.query.filter_by(project_id=project_id).all()
    return jsonify([{
        'id': f.id,
        'filename': f.filename,
        'content': f.content
    } for f in files])

@app.route('/api/projects/<int:project_id>/files', methods=['POST'])
def create_file(project_id):
    data = request.json
    file = ErgoFile(
        filename=data['filename'],
        content=data['content'],
        project_id=project_id
    )
    db.session.add(file)
    db.session.commit()
    return jsonify({'id': file.id, 'filename': file.filename})

@app.route('/api/execute', methods=['POST'])
def execute_query():
    """Execute ErgoAI query - simple version"""
    data = request.json
    query = data['query']
    project_id = data.get('project_id')

    # Get project files if specified
    files = {}
    if project_id:
        project_files = ErgoFile.query.filter_by(project_id=project_id).all()
        files = {f.filename: f.content for f in project_files}

    # Execute query
    result = ergo.execute_query(query, files)
    return jsonify(result)

# Initialize database
with app.app_context():
    db.create_all()

    # Add sample data if empty
    if Project.query.count() == 0:
        sample_project = Project(name="Family Example", description="Sample family relationships")
        db.session.add(sample_project)
        db.session.commit()

        sample_file = ErgoFile(
            filename="family.ergo",
            content="""% Family relationships
john[age->30, spouse->mary] @ family.
mary[age->25, spouse->john] @ family.
peter[age->5, parents->{john, mary}] @ family.

parent(?X, ?Y) :- ?Y[parents->?P]@family, ?X in ?P.
adult(?X) :- ?X[age->?A]@family, ?A >= 18.""",
            project_id=sample_project.id
        )
        db.session.add(sample_file)
        db.session.commit()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
