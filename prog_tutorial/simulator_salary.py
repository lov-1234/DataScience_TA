import pandas as pd
import numpy as np

# Set the random seed for reproducibility
np.random.seed(42)

# Generate a dataset
n = 1000000  # Number of rows
ages = np.random.randint(22, 65, size=n)  # Age between 22 and 65
heights = np.random.randint(150, 200, size=n)  # Height between 150 and 200 cm
degrees = np.random.choice(
    ['Bachelor', 'Master', 'PhD'], size=n)  # Degree levels
# Years of experience between 1 and 40
experience = np.random.randint(1, 40, size=n)

# Generate salaries as a function of age, height, degree, and experience with some noise
salaries = (ages * 500 + experience * 1000 +
            np.where(degrees == 'PhD', 20000, np.where(degrees == 'Master', 15000, 10000)) +
            np.random.normal(0, 10000, size=n))  # Adding noise to salary

# Add two more columns with NaN values
almost_nan_column = np.array([np.nan if i < 80 else np.random.randint(
    50, 100) for i in range(n)])  # Almost 80% NaNs
some_nan_column = np.array([np.nan if np.random.rand(
) < 0.1 else np.random.randint(30, 80) for i in range(n)])  # 10% NaNs

# Create a DataFrame
data = pd.DataFrame({
    'Age': ages,
    'Height': heights,
    'Degree': degrees,
    'Experience': experience,
    'Salary': salaries,
    'AlmostNaN': almost_nan_column,
    'SomeNaN': some_nan_column
})

# Save the dataset to a CSV file
csv_file_path = './salary_prediction_dataset.csv'
data.to_csv(csv_file_path, index=False)
