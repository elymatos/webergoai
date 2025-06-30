-- Migration to add Knowledge Base fields to existing projects table
-- Run this manually if you have existing data

-- Add the new knowledge base columns
ALTER TABLE projects ADD COLUMN IF NOT EXISTS classes TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS facts TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS rules TEXT DEFAULT '';
ALTER TABLE projects ADD COLUMN IF NOT EXISTS queries TEXT DEFAULT '';

-- Add metadata columns for KB management
ALTER TABLE projects ADD COLUMN IF NOT EXISTS is_loaded BOOLEAN DEFAULT FALSE;
ALTER TABLE projects ADD COLUMN IF NOT EXISTS loaded_at TIMESTAMP;
ALTER TABLE projects ADD COLUMN IF NOT EXISTS temp_filename VARCHAR(255);
ALTER TABLE projects ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Create query history table
CREATE TABLE IF NOT EXISTS query_history (
                                             id SERIAL PRIMARY KEY,
                                             project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    query TEXT NOT NULL,
    result TEXT,
    status VARCHAR(20) NOT NULL,
    execution_time FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_query_history_project_id ON query_history(project_id);
CREATE INDEX IF NOT EXISTS idx_query_history_created_at ON query_history(created_at);
CREATE INDEX IF NOT EXISTS idx_projects_updated_at ON projects(updated_at);

-- Update existing projects with sample KB content (optional)
UPDATE projects SET
                    classes = '% Add your classes here
person :: object.
student :: person.',
                    facts = '% Add your facts here
john:student[age->20, major->computer_science].',
                    rules = '% Add your rules here
adult(?X) :- ?X[age->?Age], ?Age >= 18.',
                    queries = '% Add your test queries here
?- ?X:student.
?- adult(?X).'
WHERE classes = '' OR classes IS NULL;

COMMIT;
