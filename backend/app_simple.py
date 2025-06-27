# Simple Flask app for ErgoAI - NO complexity!

from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import subprocess
import tempfile
import os
from pathlib import Path
import uuid
import shutil
from datetime import datetime

print("🚀 Starting Simple ErgoAI Backend...")

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
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
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
        print(f"📂 ErgoAI path: {self.ergoai_path}")
        print(f"📂 Temp directory: {self.temp_dir}")
    
    def execute_query(self, query, files=None):
        """Execute ErgoAI query - simple version"""
        print(f"🔍 Executing query: {query[:50]}...")
        
        try:
            session_dir = self.temp_dir / str(uuid.uuid4())
            session_dir.mkdir(exist_ok=True)
            print(f"📁 Session directory: {session_dir}")
            
            # Write knowledge base files
            if files:
                for filename, content in files.items():
                    file_path = session_dir / filename
                    file_path.write_text(content)
                    print(f"📝 Created file: {filename}")
            
            # Write query file
            query_file = session_dir / "query.ergo"
            query_file.write_text(query)
            print(f"📝 Created query file")
            
            # Check if ErgoAI exists (for now, simulate if missing)
            ergoai_script = self.ergoai_path / "runErgoAI.sh"
            if not ergoai_script.exists():
                print(f"⚠️  ErgoAI not found at {ergoai_script}, simulating response")
                result = self._simulate_ergoai(query)
            else:
                # Run real ErgoAI
                cmd = [str(ergoai_script), "--batch", "--file", str(query_file)]
                print(f"🏃 Running: {' '.join(cmd)}")
                process = subprocess.run(cmd, capture_output=True, text=True, timeout=30, cwd=session_dir)
                
                if process.returncode == 0:
                    result = {'status': 'success', 'result': process.stdout}
                else:
                    result = {'status': 'error', 'message': process.stderr}
            
            # Cleanup
            shutil.rmtree(session_dir)
            print(f"✅ Query completed with status: {result['status']}")
            return result
                
        except subprocess.TimeoutExpired:
            print("⏰ Query timed out")
            return {'status': 'error', 'message': 'Query timed out after 30 seconds'}
        except Exception as e:
            print(f"❌ Error executing query: {str(e)}")
            return {'status': 'error', 'message': str(e)}
    
    def _simulate_ergoai(self, query):
        """Simulate ErgoAI responses for testing when ErgoAI is not available"""
        print("🎭 Simulating ErgoAI response")
        
        # Simple simulation based on query patterns
        if "adult(?X)" in query:
            return {'status': 'success', 'result': '?X = john\n?X = mary\n\n2 solutions found.'}
        elif "parent(?X, ?Y)" in query:
            return {'status': 'success', 'result': '?X = john, ?Y = peter\n?X = mary, ?Y = peter\n\n2 solutions found.'}
        elif "1+1" in query:
            return {'status': 'success', 'result': '2\n\n1 solution found.'}
        else:
            return {'status': 'success', 'result': f'Query processed: {query}\n\nSimulated response - ErgoAI not available.'}

ergo = SimpleErgoAI()

# Simple API routes
@app.route('/api/health')
def health():
    return jsonify({
        'status': 'healthy', 
        'message': 'Simple ErgoAI API running',
        'ergoai_path': str(ergo.ergoai_path),
        'ergoai_available': (ergo.ergoai_path / "runErgoAI.sh").exists()
    })

@app.route('/api/projects')
def get_projects():
    projects = Project.query.all()
    return jsonify([{
        'id': p.id,
        'name': p.name,
        'description': p.description,
        'created_at': p.created_at.isoformat()
    } for p in projects])

@app.route('/api/projects', methods=['POST'])
def create_project():
    data = request.json
    project = Project(name=data['name'], description=data.get('description', ''))
    db.session.add(project)
    db.session.commit()
    print(f"📁 Created project: {project.name}")
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
    print(f"📝 Created file: {file.filename}")
    return jsonify({'id': file.id, 'filename': file.filename})

@app.route('/api/execute', methods=['POST'])
def execute_query():
    """Execute ErgoAI query - simple version"""
    data = request.json
    query = data['query']
    project_id = data.get('project_id')
    
    print(f"🔍 Execute request - Query: {query[:50]}..., Project: {project_id}")
    
    # Get project files if specified
    files = {}
    if project_id:
        project_files = ErgoFile.query.filter_by(project_id=project_id).all()
        files = {f.filename: f.content for f in project_files}
        print(f"📂 Found {len(files)} files in project")
    
    # Execute query
    result = ergo.execute_query(query, files)
    return jsonify(result)

# Initialize database
def init_db():
    """Initialize database with sample data"""
    print("🗄️  Initializing database...")
    
    with app.app_context():
        db.create_all()
        print("✅ Database tables created")
        
        # Add sample data if empty
        if Project.query.count() == 0:
            print("📝 Adding sample data...")
            
            sample_project = Project(
                name="Family Example", 
                description="Sample family relationships knowledge base"
            )
            db.session.add(sample_project)
            db.session.commit()
            
            sample_file = ErgoFile(
                filename="family.ergo",
                content="""% Family relationships knowledge base
john[age->30, spouse->mary] @ family.
mary[age->25, spouse->john] @ family.
peter[age->5, parents->{john, mary}] @ family.

% Rules
parent(?X, ?Y) :- ?Y[parents->?P]@family, ?X in ?P.
adult(?X) :- ?X[age->?A]@family, ?A >= 18.
child(?X) :- ?X[age->?A]@family, ?A < 18.""",
                project_id=sample_project.id
            )
            db.session.add(sample_file)
            db.session.commit()
            print("✅ Sample data added")

if __name__ == '__main__':
    init_db()
    print("🌟 Starting Flask server on http://0.0.0.0:5000")
    app.run(host='0.0.0.0', port=5000, debug=True)
