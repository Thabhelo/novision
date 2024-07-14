from flask import Flask, render_template
from dashboard import create_dashboard

server = Flask(__name__)

# Create the Dash app
dash_app = create_dashboard()
dash_app.server = server  # Attach the Dash app to the Flask server

# Define a route for the main app
@server.route('/')
def index():
    return 'Welcome to the Vision Pro App!'

if __name__ == '__main__':
    # Run the combined Flask and Dash server
    server.run(debug=True)
