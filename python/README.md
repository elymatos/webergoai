# ErgoAI Web Interface - Complete Installation & Setup Guide

## Overview

This guide will help you set up a complete web-based user interface for ErgoAI that addresses the main limitations of the desktop ErgoAI Studio:

- **Modern Web UI**: Professional interface with syntax highlighting and Monaco Editor
- **Persistent Storage**: PostgreSQL database for knowledge bases and query history
- **Multi-user Support**: User authentication and project management
- **Real-time Collaboration**: WebSocket integration for live updates
- **API Integration**: RESTful API for programmatic access

## Prerequisites

### System Requirements
- **Operating System**: Linux, macOS, or Windows with WSL2
- **Memory**: Minimum 4GB RAM (8GB recommended)
- **Storage**: At least 10GB free space
- **Network**: Internet connection for initial setup

### Software Dependencies
- **ErgoAI**: Version 3.0 or later installed and working
- **Docker**: Version 20.10+ and Docker Compose v2
- **Node.js**: Version 18+ (for frontend development)
- **Python**: Version 3.11+ (for backend development)
- **PostgreSQL**: Version 15+ (or use Docker container)

## Quick Start with Docker

### 1. Clone and Setup

```bash
# Create project directory
mkdir ergoai-web-interface
cd ergoai-web-interface

# Create directory structure
mkdir -p {backend,frontend,nginx,database,logs}

# Copy the provided configuration files into respective directories
# (Use the Docker deployment configuration from the artifacts)
```

### 2. Environment Configuration

```bash
# Copy environment template
cp .env.example .env

# Edit environment variables
nano .env
```

**Key environment variables to configure:**

```bash
# Database
POSTGRES_PASSWORD=your_secure_password_here
DATABASE_URL=postgresql://ergoai_user:your_secure_password_here@postgres:5432/ergoai_db

# Security
SECRET_KEY=your_very_secure_secret_key_here_minimum_32_chars
JWT_SECRET_KEY=another_secure_key_for_jwt_tokens

# ErgoAI Path
ERGOAI_PATH=/path/to/your/ergoai/installation

# Frontend
REACT_APP_API_URL=http://localhost:5000/api
```

### 3. ErgoAI Integration Setup

```bash
# Create ErgoAI volume directory
mkdir -p ./volumes/ergoai

# Copy your ErgoAI installation to the volume
# or create a symbolic link
ln -s /path/to/ergoai ./volumes/ergoai

# Ensure ErgoAI scripts are executable
chmod +x ./volumes/ergoai/runErgoAI.sh
```

### 4. Build and Launch

```bash
# Build all containers
docker-compose build

# Start all services
docker-compose up -d

# Check service status
docker-compose ps

# View logs
docker-compose logs -f
```

### 5. Access the Application

- **Web Interface**: http://localhost:3000
- **API Documentation**: http://localhost:5000/api/health
- **Database**: localhost:5432 (external access)

## Manual Installation (Development)

### Backend Setup

```bash
# Create backend directory
mkdir backend && cd backend

# Create Python virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Setup database
export DATABASE_URL="postgresql://username:password@localhost/ergoai_db"
flask db init
flask db migrate -m "Initial migration"
flask db upgrade

# Run development server
python app.py
```

### Frontend Setup

```bash
# Create React application
npx create-react-app frontend
cd frontend

# Install additional dependencies
npm install monaco-editor @monaco-editor/react axios

# Copy the provided HTML interface or create React components
# Replace src/App.js with your interface

# Start development server
npm start
```

### Database Setup (PostgreSQL)

```bash
# Install PostgreSQL
sudo apt-get install postgresql postgresql-contrib  # Ubuntu/Debian
brew install postgresql                             # macOS

# Create database and user
sudo -u postgres psql
CREATE DATABASE ergoai_db;
CREATE USER ergoai_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE ergoai_db TO ergoai_user;
\q

# Run database schema
psql -U ergoai_user -d ergoai_db -f database/init.sql
```

## Configuration Details

### ErgoAI Backend Integration

The backend communicates with ErgoAI through the command-line interface. Ensure your ErgoAI installation includes:

```bash
# Verify ErgoAI installation
/path/to/ergoai/runErgoAI.sh --version

# Test basic functionality
echo "?- 1+1." | /path/to/ergoai/runErgoAI.sh --batch
```

### API Configuration

Update `backend/app.py` with your ErgoAI path:

```python
# ErgoAI Configuration
ERGOAI_PATH = "/path/to/your/ergoai/installation"
ERGOAI_TIMEOUT = 30  # seconds

# Initialize ErgoAI engine
ergo_engine = ErgoAIEngine(ERGOAI_PATH)
```

### Frontend Configuration

Update the API service in your frontend:

```javascript
// src/services/api.js
const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';
const WS_URL = process.env.REACT_APP_WS_URL || 'ws://localhost:5000/ws';
```

## Usage Guide

### Creating Your First Project

1. **Access the Web Interface**
    - Open http://localhost:3000 in your browser
    - The interface loads with sample projects

2. **Create a New Knowledge Base**
    - Click "New" button in the toolbar
    - Enter project name and description
    - Click "Create"

3. **Add ErgoAI Files**
    - Click "Open" to add existing .ergo files
    - Or create new files using the editor
    - Save files using Ctrl+S

4. **Execute Queries**
    - Type or select a query in the editor
    - Press F5 or click "Run Query"
    - View results in the results panel

### Example F-Logic Knowledge Base

```prolog
% family.ergo - Family relationships example

% Facts about family members
john[age->30, profession->teacher, spouse->mary] @ family.
mary[age->25, profession->doctor, spouse->john] @ family.
peter[age->5, parents->{john, mary}] @ family.

% Rules for relationships
parent(?X, ?Y) :- ?Y[parents->?Parents]@family, ?X in ?Parents.
grandparent(?X, ?Z) :- parent(?X, ?Y), parent(?Y, ?Z).
sibling(?X, ?Y) :- 
    ?X[parents->?P]@family,
    ?Y[parents->?P]@family,
    ?X \= ?Y.

% Age-related rules
adult(?X) :- ?X[age->?Age]@family, ?Age >= 18.
child(?X) :- ?X[age->?Age]@family, ?Age < 18.
```

### Example Queries

```prolog
% Find all adults
?- adult(?X).

% Find parent-child relationships
?- parent(?X, ?Y).

% Find people with specific professions
?- ?X[profession->teacher]@family.

% Complex query with explanations
?- adult(?X), parent(?X, ?Y), child(?Y).
```

## Advanced Features

### Real-time Collaboration

The interface supports real-time updates when multiple users work on the same project:

```javascript
// Enable WebSocket for real-time updates
window.integrateWithHTMLInterface();

// Real-time notifications for:
// - Query completions
// - File updates by other users
// - Project sharing events
```

### Query Explanations

Generate "Why?" explanations for query results:

```javascript
// Use the explain functionality
window.explainAnswer();  // Explains selected query

// Or use API directly
const explanation = await api.explainQuery(query, projectId);
```

### Syntax Validation

Real-time syntax checking as you type:

```javascript
// Automatic validation
editor.onDidChangeModelContent(() => {
    // Validates syntax in background
    validateSyntax(content);
});
```

## Troubleshooting

### Common Issues

1. **ErgoAI Not Found**
   ```bash
   # Check ErgoAI path
   which runErgoAI.sh
   
   # Update ERGOAI_PATH in environment
   export ERGOAI_PATH="/correct/path/to/ergoai"
   ```

2. **Database Connection Errors**
   ```bash
   # Check PostgreSQL status
   sudo systemctl status postgresql
   
   # Test connection
   psql -U ergoai_user -d ergoai_db -h localhost
   ```

3. **Permission Errors**
   ```bash
   # Fix file permissions
   chmod +x ./volumes/ergoai/runErgoAI.sh
   chown -R $USER:$USER ./volumes/
   ```

4. **Port Conflicts**
   ```bash
   # Check port usage
   netstat -tulpn | grep :3000
   netstat -tulpn | grep :5000
   
   # Update ports in docker-compose.yml if needed
   ```

### Performance Optimization

1. **Database Indexing**
   ```sql
   -- Add indexes for better query performance
   CREATE INDEX idx_query_history_project_created 
   ON query_history(project_id, created_at);
   ```

2. **Memory Configuration**
   ```yaml
   # docker-compose.yml
   services:
     backend:
       deploy:
         resources:
           limits:
             memory: 2G
           reservations:
             memory: 1G
   ```

3. **ErgoAI Timeout Settings**
   ```python
   # Adjust timeout for complex queries
   ERGOAI_TIMEOUT = 60  # seconds
   ```

## Security Considerations

### Production Deployment

1. **Environment Variables**
   ```bash
   # Use secure random keys
   SECRET_KEY=$(openssl rand -hex 32)
   JWT_SECRET_KEY=$(openssl rand -hex 32)
   ```

2. **Database Security**
   ```sql
   -- Create restricted database user
   CREATE USER ergoai_app WITH PASSWORD 'secure_password';
   GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO ergoai_app;
   ```

3. **HTTPS Configuration**
   ```nginx
   # nginx/nginx.conf
   server {
       listen 443 ssl http2;
       ssl_certificate /path/to/cert.pem;
       ssl_certificate_key /path/to/key.pem;
   }
   ```

## Support and Contributing

### Getting Help

- **Issues**: Create GitHub issues for bugs or feature requests
- **Documentation**: Check the project wiki for detailed documentation
- **Community**: Join discussions in the project forums

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

### Development Setup

```bash
# Clone repository
git clone https://github.com/your-username/ergoai-web-interface.git

# Setup development environment
make dev-setup

# Run tests
make test

# Start development servers
make dev-up
```

## Conclusion

This ErgoAI Web Interface provides a modern, web-based alternative to the desktop ErgoAI Studio with enhanced features for persistent storage, collaboration, and API access. The system is designed to be scalable and can be deployed in various environments from development to production.

The interface maintains full compatibility with ErgoAI's F-Logic syntax while providing a more user-friendly experience for knowledge base development and query execution.
