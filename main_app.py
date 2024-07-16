from flask import Flask, render_template
from dashboard.health_dashboard import create_dashboard

server = Flask(__name__)

# Create the Dash app with the Flask server
dash_app = create_dashboard(server=None)

# Define a route for the main app
@server.route('/')
def index():
    return 'Welcome to the Vision Pro App!'

if __name__ == '__main__':
    # Run the combined Flask and Dash server
    server.run(debug=True)