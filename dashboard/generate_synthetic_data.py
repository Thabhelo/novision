import pandas as pd
import numpy as np

# Number of samples
num_samples = 1000

# Generate synthetic data
data = {
    'PersonID': np.arange(1, num_samples + 1),
    'HeartRate': np.random.randint(60, 100, num_samples),
    'OxygenSaturation': np.random.uniform(90, 100, num_samples),
    'BloodPressure_Systolic': np.random.randint(100, 140, num_samples),
    'BloodPressure_Diastolic': np.random.randint(60, 90, num_samples),
    'Temperature': np.random.uniform(36.0, 37.5, num_samples),
    'Condition': np.random.choice(['Healthy', 'Minor Issue', 'Critical'], num_samples, p=[0.7, 0.2, 0.1])
}

# Create DataFrame
df = pd.DataFrame(data)

# Save to CSV
df.to_csv('data/synthetic_health_data.csv', index=False)

# Display first few rows
print(df.head())
