from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api/health')
def health():
    return jsonify({
        'status': 'healthy',
        'message': 'Backend is working',
        'ergoai_available': False,
        'note': 'Using simple backend - database bypassed'
    })

@app.route('/api/execute', methods=['POST'])
def execute():
    data = request.json
    query = data.get('query', '')
    
    # Simple simulation
    if "1+1" in query:
        result = "2\n\n1 solution found."
    elif "adult(?X)" in query:
        result = "?X = john\n?X = mary\n\n2 solutions found."
    elif "parent(?X, ?Y)" in query:
        result = "?X = john, ?Y = peter\n?X = mary, ?Y = peter\n\n2 solutions found."
    else:
        result = f"Simulated result for: {query}\n\n1 solution found."
    
    return jsonify({'status': 'success', 'result': result})

@app.route('/api/projects')
def projects():
    return jsonify([{'id': 1, 'name': 'Sample Project', 'description': 'Test project'}])

if __name__ == '__main__':
    print("🚀 Starting working backend...")
    app.run(host='0.0.0.0', port=5000, debug=True)
