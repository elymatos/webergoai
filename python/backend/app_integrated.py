# backend/app_integrated.py
# Flask app integrated with ErgoAI Docker service

from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import requests
import os
from datetime import datetime
import json

print("🚀 Starting Integrated ErgoAI Backend...")

# Flask app setup
app = Flask(__name__)
app.config['SECRET_KEY'] = 'simple-dev-key'
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv(
    'DATABASE_URL',
    'postgresql://ergoai_user:simple_password@postgres:5432/ergoai_db'
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
CORS(app)

# ErgoAI service configuration
ERGOAI_SERVICE_URL = os.getenv('ERGOAI_SERVICE_URL', 'http://ergoai:80')

# Database models (same as before)
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

# ErgoAI Service Interface
class ErgoAIService:
    def __init__(self):
        self.service_url = ERGOAI_SERVICE_URL
        self.query_endpoint = f"{self.service_url}/query/"
        self.command_endpoint = f"{self.service_url}/command/"
        print(f"🔗 ErgoAI Service URL: {self.service_url}")

    def check_connection(self):
        """Check if ErgoAI service is available"""
        try:
            response = requests.get(f"{self.service_url}/docs", timeout=5)
            return response.status_code == 200
        except:
            return False

    def load_knowledge_base(self, files):
        """Load knowledge base files into ErgoAI"""
        try:
            # Clear previous knowledge base
            self.execute_command("erasemodule(main).")

            # Load each file
            for filename, content in files.items():
                if filename.endswith('.ergo'):
                    # For .ergo files, load them as modules
                    load_command = f"['{filename}']."
                    self.execute_command(load_command)
                    print(f"📝 Loaded knowledge base file: {filename}")

            return True
        except Exception as e:
            print(f"❌ Error loading knowledge base: {e}")
            return False

    def execute_command(self, command):
        """Execute ErgoAI command"""
        try:
            response = requests.post(
                self.command_endpoint,
                json={"param": command},
                timeout=30
            )
            response.raise_for_status()
            return response.json()
        except Exception as e:
            print(f"❌ Command execution error: {e}")
            return {"result": "error", "message": str(e)}

    def execute_query(self, query, files=None):
        """Execute ErgoAI query using the service"""
        try:
            print(f"🔍 Executing query via service: {query[:50]}...")

            # Load knowledge base files if provided
            if files:
                success = self.load_knowledge_base(files)
                if not success:
                    return {'status': 'error', 'message': 'Failed to load knowledge base'}

            # Execute the query
            response = requests.post(
                self.query_endpoint,
                json={"param": query},
                timeout=30
            )
            response.raise_for_status()
            result = response.json()

            print(f"✅ Query executed successfully")

            # Format the response
            if result.get("result"):
                # Convert PyErgo result to readable format
                formatted_result = self._format_ergo_result(result["result"])
                return {'status': 'success', 'result': formatted_result}
            else:
                return {'status': 'success', 'result': 'No results found'}

        except requests.RequestException as e:
            print(f"❌ Service request error: {e}")
            return {'status': 'error', 'message': f'ErgoAI service error: {str(e)}'}
        except Exception as e:
            print(f"❌ Query execution error: {e}")
            return {'status': 'error', 'message': str(e)}

    def _format_ergo_result(self, result):
        """Format ErgoAI result for display"""
        if isinstance(result, list):
            if not result:
                return "No solutions found."

            # Format solutions
            solutions = []
            for i, solution in enumerate(result, 1):
                if isinstance(solution, dict):
                    # Format variable bindings
                    bindings = []
                    for var, value in solution.items():
                        bindings.append(f"{var} = {value}")
                    solutions.append(", ".join(bindings))
                else:
                    solutions.append(str(solution))

            formatted = "\n".join(solutions)
            count = len(result)
            return f"{formatted}\n\n{count} solution{'s' if count != 1 else ''} found."
        else:
            return str(result)

# Initialize ErgoAI service
ergo_service = ErgoAIService()

# API Routes
@app.route('/api/health')
def health():
    ergo_available = ergo_service.check_connection()
    return jsonify({
        'status': 'healthy',
        'message': 'Integrated ErgoAI API running',
        'ergoai_service_url': ergo_service.service_url,
        'ergoai_available': ergo_available,
        'database_connected': True
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
    """Execute ErgoAI query via service"""
    data = request.json
    query = data['query']
    project_id = data.get('project_id')

    print(f"🔍 Execute request via service - Query: {query[:50]}..., Project: {project_id}")

    # Get project files if specified
    files = {}
    if project_id:
        project_files = ErgoFile.query.filter_by(project_id=project_id).all()
        files = {f.filename: f.content for f in project_files}
        print(f"📂 Found {len(files)} files in project")

    # Execute query via ErgoAI service
    result = ergo_service.execute_query(query, files)
    return jsonify(result)

@app.route('/api/ergoai/command', methods=['POST'])
def execute_command():
    """Execute ErgoAI command directly"""
    data = request.json
    command = data['command']

    result = ergo_service.execute_command(command)
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
    print(f"🔗 Connecting to ErgoAI service at: {ERGOAI_SERVICE_URL}")
    app.run(host='0.0.0.0', port=5000, debug=True)
