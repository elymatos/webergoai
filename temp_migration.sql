ALTER TABLE projects ADD COLUMN IF NOT EXISTS classes TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS facts TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS rules TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS queries TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS is_loaded BOOLEAN DEFAULT FALSE;
ALTER TABLE projects ADD COLUMN IF NOT EXISTS loaded_at TIMESTAMP;
ALTER TABLE projects ADD COLUMN IF NOT EXISTS temp_filename VARCHAR(255);
ALTER TABLE projects ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
CREATE TABLE IF NOT EXISTS query_history (
    id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    query TEXT NOT NULL,
    result TEXT,
    status VARCHAR(20) NOT NULL,
    execution_time FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_query_history_project_id ON query_history(project_id);
CREATE INDEX IF NOT EXISTS idx_query_history_created_at ON query_history(created_at);
CREATE INDEX IF NOT EXISTS idx_projects_updated_at ON projects(updated_at);
