// src/services/api.js
// API service for ErgoAI Web Interface

class ErgoAIAPI {
    constructor() {
        this.baseURL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';
        this.wsURL = process.env.REACT_APP_WS_URL || 'ws://localhost:5000/ws';
        this.token = localStorage.getItem('auth_token');
        this.ws = null;
    }

    // HTTP request helper
    async request(endpoint, options = {}) {
        const url = `${this.baseURL}${endpoint}`;
        const config = {
            headers: {
                'Content-Type': 'application/json',
                ...(this.token && { 'Authorization': `Bearer ${this.token}` }),
                ...options.headers,
            },
            ...options,
        };

        try {
            const response = await fetch(url, config);

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.message || 'API request failed');
            }

            return await response.json();
        } catch (error) {
            console.error('API Error:', error);
            throw error;
        }
    }

    // Project Management
    async getProjects() {
        return this.request('/projects');
    }

    async createProject(name, description) {
        return this.request('/projects', {
            method: 'POST',
            body: JSON.stringify({ name, description }),
        });
    }

    async deleteProject(projectId) {
        return this.request(`/projects/${projectId}`, {
            method: 'DELETE',
        });
    }

    // File Management
    async getProjectFiles(projectId) {
        return this.request(`/projects/${projectId}/files`);
    }

    async getFile(fileId) {
        return this.request(`/files/${fileId}`);
    }

    async createFile(projectId, filename, content, fileType = 'ergo') {
        return this.request(`/projects/${projectId}/files`, {
            method: 'POST',
            body: JSON.stringify({ filename, content, file_type: fileType }),
        });
    }

    async updateFile(fileId, content) {
        return this.request(`/files/${fileId}`, {
            method: 'PUT',
            body: JSON.stringify({ content }),
        });
    }

    async deleteFile(fileId) {
        return this.request(`/files/${fileId}`, {
            method: 'DELETE',
        });
    }

    // Query Execution
    async executeQuery(query, projectId = null) {
        return this.request('/execute', {
            method: 'POST',
            body: JSON.stringify({ query, project_id: projectId }),
        });
    }

    async explainQuery(query, projectId = null) {
        return this.request('/explain', {
            method: 'POST',
            body: JSON.stringify({ query, project_id: projectId }),
        });
    }

    async validateSyntax(content, fileType = 'ergo') {
        return this.request('/validate', {
            method: 'POST',
            body: JSON.stringify({ content, file_type: fileType }),
        });
    }

    // Query History
    async getQueryHistory(projectId) {
        return this.request(`/projects/${projectId}/history`);
    }

    // Health Check
    async healthCheck() {
        return this.request('/health');
    }

    // WebSocket Connection for Real-time Updates
    connectWebSocket(onMessage, onError = null) {
        if (this.ws) {
            this.ws.close();
        }

        this.ws = new WebSocket(this.wsURL);

        this.ws.onopen = () => {
            console.log('WebSocket connected');
            if (this.token) {
                this.ws.send(JSON.stringify({ type: 'auth', token: this.token }));
            }
        };

        this.ws.onmessage = (event) => {
            try {
                const data = JSON.parse(event.data);
                onMessage(data);
            } catch (error) {
                console.error('WebSocket message parse error:', error);
            }
        };

        this.ws.onerror = (error) => {
            console.error('WebSocket error:', error);
            if (onError) onError(error);
        };

        this.ws.onclose = () => {
            console.log('WebSocket disconnected');
            // Attempt to reconnect after 5 seconds
            setTimeout(() => this.connectWebSocket(onMessage, onError), 5000);
        };
    }

    disconnectWebSocket() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
    }

    // Authentication
    setToken(token) {
        this.token = token;
        localStorage.setItem('auth_token', token);
    }

    clearToken() {
        this.token = null;
        localStorage.removeItem('auth_token');
    }
}

// Create and export singleton instance
export const api = new ErgoAIAPI();

// React hooks for API integration
import { useState, useEffect, useCallback } from 'react';

// Hook for managing projects
export function useProjects() {
    const [projects, setProjects] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const loadProjects = useCallback(async () => {
        try {
            setLoading(true);
            const data = await api.getProjects();
            setProjects(data);
            setError(null);
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    }, []);

    const createProject = useCallback(async (name, description) => {
        try {
            const newProject = await api.createProject(name, description);
            setProjects(prev => [...prev, newProject]);
            return newProject;
        } catch (err) {
            setError(err.message);
            throw err;
        }
    }, []);

    useEffect(() => {
        loadProjects();
    }, [loadProjects]);

    return {
        projects,
        loading,
        error,
        loadProjects,
        createProject,
    };
}

// Hook for managing files
export function useFiles(projectId) {
    const [files, setFiles] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const loadFiles = useCallback(async () => {
        if (!projectId) return;

        try {
            setLoading(true);
            const data = await api.getProjectFiles(projectId);
            setFiles(data);
            setError(null);
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    }, [projectId]);

    const createFile = useCallback(async (filename, content, fileType) => {
        try {
            const newFile = await api.createFile(projectId, filename, content, fileType);
            setFiles(prev => [...prev, newFile]);
            return newFile;
        } catch (err) {
            setError(err.message);
            throw err;
        }
    }, [projectId]);

    const updateFile = useCallback(async (fileId, content) => {
        try {
            await api.updateFile(fileId, content);
            // Update local state
            setFiles(prev => prev.map(file =>
                file.id === fileId
                    ? { ...file, content, updated_at: new Date().toISOString() }
                    : file
            ));
        } catch (err) {
            setError(err.message);
            throw err;
        }
    }, []);

    useEffect(() => {
        loadFiles();
    }, [loadFiles]);

    return {
        files,
        loading,
        error,
        loadFiles,
        createFile,
        updateFile,
    };
}

// Hook for query execution
export function useQueryExecution() {
    const [executing, setExecuting] = useState(false);
    const [results, setResults] = useState([]);
    const [error, setError] = useState(null);

    const executeQuery = useCallback(async (query, projectId) => {
        try {
            setExecuting(true);
            setError(null);

            const result = await api.executeQuery(query, projectId);

            const newResult = {
                id: Date.now(),
                query,
                result: result.result,
                status: result.status,
                execution_time: result.execution_time,
                timestamp: new Date().toISOString(),
            };

            setResults(prev => [newResult, ...prev]);
            return newResult;
        } catch (err) {
            setError(err.message);
            throw err;
        } finally {
            setExecuting(false);
        }
    }, []);

    const explainQuery = useCallback(async (query, projectId) => {
        try {
            setExecuting(true);
            setError(null);

            const result = await api.explainQuery(query, projectId);

            const newResult = {
                id: Date.now(),
                query: `Explanation: ${query}`,
                result: result.result,
                status: result.status,
                execution_time: result.execution_time,
                timestamp: new Date().toISOString(),
                isExplanation: true,
            };

            setResults(prev => [newResult, ...prev]);
            return newResult;
        } catch (err) {
            setError(err.message);
            throw err;
        } finally {
            setExecuting(false);
        }
    }, []);

    const clearResults = useCallback(() => {
        setResults([]);
        setError(null);
    }, []);

    return {
        executing,
        results,
        error,
        executeQuery,
        explainQuery,
        clearResults,
    };
}

// Hook for real-time updates
export function useWebSocket() {
    const [connected, setConnected] = useState(false);
    const [messages, setMessages] = useState([]);

    useEffect(() => {
        const handleMessage = (data) => {
            setMessages(prev => [...prev, data]);

            // Handle different message types
            switch (data.type) {
                case 'query_complete':
                    // Handle query completion notification
                    break;
                case 'file_updated':
                    // Handle file update notification
                    break;
                case 'project_shared':
                    // Handle project sharing notification
                    break;
                default:
                    console.log('Unknown message type:', data.type);
            }
        };

        const handleError = (error) => {
            console.error('WebSocket error:', error);
            setConnected(false);
        };

        api.connectWebSocket(handleMessage, handleError);
        setConnected(true);

        return () => {
            api.disconnectWebSocket();
            setConnected(false);
        };
    }, []);

    return {
        connected,
        messages,
    };
}

// Hook for syntax validation
export function useSyntaxValidation() {
    const [validating, setValidating] = useState(false);
    const [validationResult, setValidationResult] = useState(null);

    const validateSyntax = useCallback(async (content, fileType = 'ergo') => {
        try {
            setValidating(true);
            const result = await api.validateSyntax(content, fileType);
            setValidationResult(result);
            return result;
        } catch (err) {
            console.error('Syntax validation error:', err);
            return { valid: false, errors: err.message };
        } finally {
            setValidating(false);
        }
    }, []);

    return {
        validating,
        validationResult,
        validateSyntax,
    };
}

// Utility function to format query results
export function formatQueryResult(result) {
    if (!result) return '';

    if (typeof result === 'string') {
        return result;
    }

    if (typeof result === 'object') {
        return JSON.stringify(result, null, 2);
    }

    return String(result);
}

// Error boundary for API errors
export class APIErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, error: null };
    }

    static getDerivedStateFromError(error) {
        return { hasError: true, error };
    }

    componentDidCatch(error, errorInfo) {
        console.error('API Error Boundary caught an error:', error, errorInfo);
    }

    render() {
        if (this.state.hasError) {
            return (
                <div className="error-boundary">
                    <h2>Something went wrong with the API connection.</h2>
                    <details style={{ whiteSpace: 'pre-wrap' }}>
                        <summary>Error details</summary>
                        {this.state.error && this.state.error.toString()}
                    </details>
                    <button onClick={() => this.setState({ hasError: false, error: null })}>
                        Try again
                    </button>
                </div>
            );
        }

        return this.props.children;
    }
}

// Integration with the existing HTML interface
export function integrateWithHTMLInterface() {
    // Replace the existing functions in the HTML interface with API calls

    // Override the executeQuery function
    window.executeQuery = async function() {
        const query = getSelectedTextOrCurrentLine();
        if (!query.trim()) {
            showNotification('No query selected or cursor not on a query line', 'error');
            return;
        }

        updateStatus('Executing query...');
        addLoadingToResults();

        try {
            const result = await api.executeQuery(query, getCurrentProjectId());
            addQueryResult(query, formatQueryResult(result.result));
            updateStatus('Query executed successfully');
            showNotification('Query executed successfully');
        } catch (error) {
            updateStatus('Query execution failed');
            showNotification('Query execution failed: ' + error.message, 'error');
            addQueryResult(query, 'Error: ' + error.message);
        }
    };

    // Override the saveFile function
    window.saveFile = async function() {
        const fileId = getCurrentFileId();
        const content = editor.getValue();

        updateStatus('Saving file...');

        try {
            if (fileId) {
                await api.updateFile(fileId, content);
            } else {
                // Create new file
                const filename = getCurrentFileName();
                const projectId = getCurrentProjectId();
                await api.createFile(projectId, filename, content);
            }

            showNotification('File saved successfully: ' + currentFile);
            updateStatus('File saved');
            unmarkFileAsModified(currentFile);
        } catch (error) {
            showNotification('Save failed: ' + error.message, 'error');
            updateStatus('Save failed');
        }
    };

    // Override the loadKnowledgeBase function
    window.loadKnowledgeBase = async function() {
        const projectId = getCurrentProjectId();
        if (!projectId) {
            showNotification('No project selected', 'error');
            return;
        }

        updateStatus('Loading knowledge base...');

        try {
            const files = await api.getProjectFiles(projectId);
            // Update the file list in the UI
            updateFileList(files);
            showNotification('Knowledge base loaded successfully');
            updateStatus('Knowledge base loaded');
        } catch (error) {
            showNotification('Failed to load knowledge base: ' + error.message, 'error');
            updateStatus('Load failed');
        }
    };

    // Override the explainAnswer function
    window.explainAnswer = async function() {
        const query = getSelectedTextOrCurrentLine();
        if (!query.trim()) {
            showNotification('No query selected for explanation', 'error');
            return;
        }

        updateStatus('Generating explanation...');

        try {
            const result = await api.explainQuery(query, getCurrentProjectId());
            addQueryResult(`Explanation for: ${query}`, formatQueryResult(result.result));
            showNotification('Explanation generated');
            updateStatus('Explanation complete');
        } catch (error) {
            showNotification('Explanation failed: ' + error.message, 'error');
            updateStatus('Explanation failed');
        }
    };

    // Add real-time syntax validation
    if (window.editor) {
        let validationTimeout;

        editor.onDidChangeModelContent(() => {
            clearTimeout(validationTimeout);
            validationTimeout = setTimeout(async () => {
                const content = editor.getValue();
                if (content.trim()) {
                    try {
                        const result = await api.validateSyntax(content);
                        updateSyntaxValidation(result);
                    } catch (error) {
                        console.error('Syntax validation failed:', error);
                    }
                }
            }, 1000);
        });
    }

    // Setup WebSocket for real-time updates
    api.connectWebSocket((message) => {
        switch (message.type) {
            case 'query_complete':
                showNotification(`Query completed: ${message.query}`);
                break;
            case 'file_updated':
                showNotification(`File updated: ${message.filename}`);
                if (message.filename === currentFile) {
                    // Optionally reload the file content
                    loadFileContent(message.file_id);
                }
                break;
            case 'project_shared':
                showNotification(`Project shared: ${message.project_name}`);
                break;
            default:
                console.log('Unknown WebSocket message:', message);
        }
    });
}

// Helper functions for integration
function getCurrentProjectId() {
    // Extract project ID from current UI state
    const activeProject = document.querySelector('.project-item.active');
    return activeProject ? activeProject.dataset.projectId : null;
}

function getCurrentFileId() {
    // Extract file ID from current tab
    const activeTab = document.querySelector('.tab.active');
    return activeTab ? activeTab.dataset.fileId : null;
}

function getCurrentFileName() {
    return currentFile;
}

function updateFileList(files) {
    const recentFilesList = document.getElementById('recentFiles');
    recentFilesList.innerHTML = '';

    files.forEach(file => {
        const li = document.createElement('li');
        li.className = 'project-item';
        li.dataset.fileId = file.id;
        li.onclick = () => openFileById(file.id);
        li.innerHTML = `
            <div class="file-type-icon">${file.file_type.charAt(0).toUpperCase()}</div>
            <span>${file.filename}</span>
        `;
        recentFilesList.appendChild(li);
    });
}

async function openFileById(fileId) {
    try {
        const file = await api.getFile(fileId);
        files[file.filename] = file.content;
        addTab(file.filename);
        selectTab(file.filename);

        // Store file ID for future saves
        const tab = document.querySelector(`[onclick="selectTab('${file.filename}')"]`);
        if (tab) {
            tab.dataset.fileId = fileId;
        }
    } catch (error) {
        showNotification('Failed to open file: ' + error.message, 'error');
    }
}

async function loadFileContent(fileId) {
    try {
        const file = await api.getFile(fileId);
        if (file.filename === currentFile) {
            editor.setValue(file.content);
            files[currentFile] = file.content;
        }
    } catch (error) {
        console.error('Failed to reload file content:', error);
    }
}

function updateSyntaxValidation(result) {
    // Update UI to show syntax validation results
    const statusMessage = document.getElementById('statusMessage');

    if (result.valid) {
        statusMessage.style.color = '#90EE90';
        statusMessage.textContent = 'Syntax OK';
    } else {
        statusMessage.style.color = '#FF6B6B';
        statusMessage.textContent = 'Syntax Error';

        // Show errors in notification
        if (result.errors) {
            console.error('Syntax errors:', result.errors);
        }
    }
}

// Authentication helper functions
export function setupAuthentication() {
    // Add login/logout functionality
    window.login = async function(username, password) {
        try {
            const response = await fetch(`${api.baseURL}/auth/login`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password }),
            });

            if (!response.ok) {
                throw new Error('Login failed');
            }

            const data = await response.json();
            api.setToken(data.token);
            showNotification('Login successful');

            // Reload projects and files
            loadProjects();

        } catch (error) {
            showNotification('Login failed: ' + error.message, 'error');
        }
    };

    window.logout = function() {
        api.clearToken();
        showNotification('Logged out successfully');

        // Clear UI state
        clearProjects();
        clearFiles();
    };
}

// Performance monitoring
export function setupPerformanceMonitoring() {
    // Monitor API response times
    const originalRequest = api.request;

    api.request = async function(endpoint, options = {}) {
        const startTime = performance.now();

        try {
            const result = await originalRequest.call(this, endpoint, options);
            const endTime = performance.now();
            const duration = endTime - startTime;

            // Log slow requests
            if (duration > 2000) {
                console.warn(`Slow API request: ${endpoint} took ${duration.toFixed(2)}ms`);
            }

            return result;
        } catch (error) {
            const endTime = performance.now();
            const duration = endTime - startTime;

            console.error(`API request failed: ${endpoint} (${duration.toFixed(2)}ms)`, error);
            throw error;
        }
    };
}

// Export for direct use in HTML
if (typeof window !== 'undefined') {
    window.ErgoAIAPI = api;
    window.integrateWithHTMLInterface = integrateWithHTMLInterface;
    window.setupAuthentication = setupAuthentication;
    window.setupPerformanceMonitoring = setupPerformanceMonitoring;
}
