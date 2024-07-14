import pandas as pd
import dash
from dash import dcc, html
from dash.dependencies import Input, Output
import plotly.express as px
import pickle

def create_dashboard(server):
    # Load the data
    df = pd.read_csv('synthetic_health_data.csv')

    # Load the trained model and scaler
    with open('model.pkl', 'rb') as f:
        model = pickle.load(f)

    with open('scaler.pkl', 'rb') as f:
        scaler = pickle.load(f)

    # Initialize the Dash app
    app = dash.Dash(__name__, server=server, url_base_pathname='/dashboard/')

    # Layout of the app
    app.layout = html.Div([
        html.H1("Health Metrics Dashboard"),
        dcc.Dropdown(
            id='condition-filter',
            options=[{'label': condition, 'value': condition} for condition in df['Condition'].unique()],
            value='Healthy',
            clearable=False
        ),
        dcc.Graph(id='heart-rate-graph'),
        dcc.Graph(id='oxygen-saturation-graph'),
        dcc.Graph(id='blood-pressure-graph'),
        dcc.Graph(id='temperature-graph'),
        html.H2("Predicted Condition"),
        html.Div(id='prediction-output')
    ])

    # Callbacks to update the graphs and make predictions
    @app.callback(
        [Output('heart-rate-graph', 'figure'),
         Output('oxygen-saturation-graph', 'figure'),
         Output('blood-pressure-graph', 'figure'),
         Output('temperature-graph', 'figure'),
         Output('prediction-output', 'children')],
        [Input('condition-filter', 'value')]
    )
    def update_graphs_and_predict(selected_condition):
        filtered_df = df[df['Condition'] == selected_condition]
        
        heart_rate_fig = px.histogram(filtered_df, x='HeartRate', nbins=20, title='Heart Rate Distribution')
        oxygen_saturation_fig = px.histogram(filtered_df, x='OxygenSaturation', nbins=20, title='Oxygen Saturation Distribution')
        blood_pressure_fig = px.histogram(filtered_df, x='BloodPressure_Systolic', nbins=20, title='Systolic Blood Pressure Distribution')
        temperature_fig = px.histogram(filtered_df, x='Temperature', nbins=20, title='Temperature Distribution')
        
        # Example data point for prediction (mean values)
        example_data = filtered_df[['HeartRate', 'OxygenSaturation', 'BloodPressure_Systolic', 'Temperature']].mean().values.reshape(1, -1)
        
        # Standardize the example data
        example_data = scaler.transform(example_data)
        
        # Make a prediction
        prediction = model.predict(example_data)[0]
        prediction_text = 'Predicted Condition: ' + ['Healthy', 'Minor Issue', 'Critical'][prediction]
        
        return heart_rate_fig, oxygen_saturation_fig, blood_pressure_fig, temperature_fig, prediction_text

    return app

if __name__ == '__main__':
    # For standalone testing
    app = create_dashboard(None)
    app.run_server(debug=True)
