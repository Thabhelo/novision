# main_app.py

from flask import Flask, render_template
from dashboard.health_dashboard import create_dashboard

app = Flask(__name__)

# Initialize the Dash app
dashboard = create_dashboard(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/dashboard')
def dashboard_route():
    return dashboard.index()

if __name__ == '__main__':
    app.run(debug=True)
