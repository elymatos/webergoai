-- ErgoAI Web Interface Database Schema
-- PostgreSQL database setup

-- Create database
CREATE DATABASE ergoai_db;

-- Connect to the database
\c ergoai_db;

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users table (for future multi-user support)
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password_hash VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       is_active BOOLEAN DEFAULT TRUE
);

-- Projects table
CREATE TABLE projects (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          description TEXT,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

-- ErgoAI files table
CREATE TABLE ergo_files (
                            id SERIAL PRIMARY KEY,
                            filename VARCHAR(255) NOT NULL,
                            content TEXT NOT NULL,
                            file_type VARCHAR(50) DEFAULT 'ergo',
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
                            UNIQUE(project_id, filename)
);

-- Query history table
CREATE TABLE query_history (
                               id SERIAL PRIMARY KEY,
                               query TEXT NOT NULL,
                               result TEXT,
                               execution_time FLOAT,
                               status VARCHAR(20) NOT NULL,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE
);

-- Session management table
CREATE TABLE user_sessions (
                               id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                               user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
                               session_data JSONB,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               expires_at TIMESTAMP NOT NULL,
                               is_active BOOLEAN DEFAULT TRUE
);

-- File versions table (for version control)
CREATE TABLE file_versions (
                               id SERIAL PRIMARY KEY,
                               file_id INTEGER NOT NULL REFERENCES ergo_files(id) ON DELETE CASCADE,
                               content TEXT NOT NULL,
                               version_number INTEGER NOT NULL,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               created_by INTEGER REFERENCES users(id),
                               commit_message TEXT
);

-- Knowledge base metadata
CREATE TABLE kb_metadata (
                             id SERIAL PRIMARY KEY,
                             project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
                             metadata_key VARCHAR(100) NOT NULL,
                             metadata_value TEXT,
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             UNIQUE(project_id, metadata_key)
);

-- Indexes for performance
CREATE INDEX idx_projects_user_id ON projects(user_id);
CREATE INDEX idx_ergo_files_project_id ON ergo_files(project_id);
CREATE INDEX idx_query_history_project_id ON query_history(project_id);
CREATE INDEX idx_query_history_created_at ON query_history(created_at);
CREATE INDEX idx_user_sessions_user_id ON user_sessions(user_id);
CREATE INDEX idx_user_sessions_expires_at ON user_sessions(expires_at);
CREATE INDEX idx_file_versions_file_id ON file_versions(file_id);

-- Functions for automatic timestamp updates
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers for automatic timestamp updates
CREATE TRIGGER update_projects_updated_at BEFORE UPDATE ON projects
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_ergo_files_updated_at BEFORE UPDATE ON ergo_files
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Function to clean up expired sessions
CREATE OR REPLACE FUNCTION cleanup_expired_sessions()
RETURNS INTEGER AS $$
DECLARE
deleted_count INTEGER;
BEGIN
DELETE FROM user_sessions WHERE expires_at < CURRENT_TIMESTAMP;
GET DIAGNOSTICS deleted_count = ROW_COUNT;
RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

-- Sample data for development
INSERT INTO users (username, email, password_hash) VALUES
                                                       ('demo', 'demo@example.com', '$2b$12$demo_hash_here'),
                                                       ('admin', 'admin@example.com', '$2b$12$admin_hash_here');

-- Sample project
INSERT INTO projects (name, description, user_id) VALUES
                                                      ('Family Knowledge Base', 'Sample family relationships knowledge base', 1),
                                                      ('Business Rules', 'Corporate business rules and policies', 1);

-- Sample files
INSERT INTO ergo_files (filename, content, file_type, project_id) VALUES
                                                                      ('family.ergo', '% Family relationships knowledge base
% Facts about family members

john[age->30, profession->teacher, spouse->mary] @ family.
mary[age->25, profession->doctor, spouse->john] @ family.
peter[age->5, parents->{john, mary}] @ family.

% Rules for parent relationships
parent(?X, ?Y) :- ?Y[parents->?Parents]@family, ?X in ?Parents.

% Rules for grandparent relationships
grandparent(?X, ?Z) :- parent(?X, ?Y), parent(?Y, ?Z).

% Rules for sibling relationships
sibling(?X, ?Y) :-
    ?X[parents->?Parents1]@family,
    ?Y[parents->?Parents2]@family,
    ?Parents1 = ?Parents2,
    ?X \\= ?Y.

% Age-related rules
adult(?X) :- ?X[age->?Age]@family, ?Age >= 18.
child(?X) :- ?X[age->?Age]@family, ?Age < 18.', 'ergo', 1),

                                                                      ('queries.ergo', '% Sample queries for the family knowledge base

% Query 1: Find all adults
?- adult(?X).

% Query 2: Find all parent-child relationships
?- parent(?X, ?Y).

% Query 3: Find people older than 20
?- ?X[age->?Age]@family, ?Age > 20.

% Query 4: Find spouses
?- ?X[spouse->?Y]@family.', 'ergo', 1),

                                                                      ('business_rules.ergo', '% Business rules knowledge base

% Employee hierarchy
employee(john)[department->engineering, level->senior, salary->75000] @ company.
employee(mary)[department->hr, level->manager, salary->80000] @ company.
employee(bob)[department->engineering, level->junior, salary->50000] @ company.

% Department rules
manager(?X, ?Y) :-
    employee(?X)[level->manager, department->?Dept] @ company,
    employee(?Y)[department->?Dept] @ company,
    ?X \\= ?Y.

% Salary rules
high_earner(?X) :- employee(?X)[salary->?S] @ company, ?S > 70000.
promotion_eligible(?X) :-
    employee(?X)[level->junior] @ company,
    employee(?X)[department->?Dept] @ company,
    tenure(?X, ?Years),
    ?Years >= 2.', 'ergo', 2);

-- Sample metadata
INSERT INTO kb_metadata (project_id, metadata_key, metadata_value) VALUES
                                                                       (1, 'description', 'Family relationships and genealogy tracking'),
                                                                       (1, 'version', '1.0'),
                                                                       (1, 'author', 'Demo User'),
                                                                       (2, 'description', 'Corporate business rules and employee management'),
                                                                       (2, 'version', '1.0'),
                                                                       (2, 'compliance_level', 'enterprise');

-- Views for easier data access
CREATE VIEW project_summary AS
SELECT
    p.id,
    p.name,
    p.description,
    p.created_at,
    p.updated_at,
    u.username as owner,
    COUNT(ef.id) as file_count,
    COUNT(qh.id) as query_count,
    MAX(ef.updated_at) as last_file_update
FROM projects p
         LEFT JOIN users u ON p.user_id = u.id
         LEFT JOIN ergo_files ef ON p.id = ef.project_id
         LEFT JOIN query_history qh ON p.id = qh.project_id
GROUP BY p.id, p.name, p.description, p.created_at, p.updated_at, u.username;

CREATE VIEW file_summary AS
SELECT
    ef.id,
    ef.filename,
    ef.file_type,
    ef.created_at,
    ef.updated_at,
    p.name as project_name,
    LENGTH(ef.content) as content_size,
    (SELECT COUNT(*) FROM file_versions fv WHERE fv.file_id = ef.id) as version_count
FROM ergo_files ef
         JOIN projects p ON ef.project_id = p.id;

-- Grant permissions (adjust as needed for your setup)
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ergoai_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ergoai_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO ergoai_user;
