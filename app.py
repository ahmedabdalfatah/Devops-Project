from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello from Docker!</h1><p>My first containerized app.</p>'

@app.route('/health')
def health():
    return {'status': 'healthy'}, 200

@app.route('/about')
def about():
    return jsonify({
        'app': 'my-first-docker-app',
        'version': '1.1.0',
        'description': 'A Flask app containerized with Docker',
        'author': 'Ahmed'
    }), 200



if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
