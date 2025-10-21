# %% [markdown]
# # Introduction to Data Science in Python
# 
# Data science involves the analysis and interpretation of large datasets to uncover patterns, make predictions, and gain insights. Python is one of the most popular programming languages used in data science due to its rich ecosystem of libraries, simplicity, and flexibility.
# 
# In this tutorial, we will begin by importing the essential libraries that are commonly used for data analysis in Python: **Pandas** and **NumPy**.
# 
# ## Why These Libraries?
# 
# - **Pandas**: This library is highly efficient for data manipulation and analysis. It provides data structures like DataFrames, which are essential for handling and analyzing structured data.
#   
# - **NumPy**: It stands for "Numerical Python" and provides support for large multi-dimensional arrays and matrices, along with a wide range of mathematical functions to operate on these arrays.
# 
# ### Steps to Install the Libraries
# Before we start, ensure that these libraries are installed in your environment. If not, you can install them using `pip`:
# 
# ```bash
# pip install pandas numpy
# ```
# Alternatively, if you have a conda environment, you can install them using `conda`:
# ```bash
# conda install pandas numpy
# 

# %%
# Import necessary libraries
import pandas as pd
import numpy as np

# pd is a conventional alias for pandas
# np is a conventional alias for numpy

# %% [markdown]
# ## Introduction to DataFrames
# 
# A **DataFrame** is one of the most important data structures in the Pandas library. It is a two-dimensional, size-mutable, and heterogeneous tabular data structure with labeled axes (rows and columns). You can think of it as a spreadsheet or SQL table in Python, but much more powerful for handling and manipulating data.
# 
# DataFrames are primarily used to:
# - Store and manipulate structured data
# - Perform operations such as filtering, grouping, merging, and aggregating data
# - Handle missing or incomplete data
# 
# In this section, we will learn how to create a toy DataFrame from scratch and perform basic manipulations to understand the fundamental concepts of working with DataFrames in Pandas.
# 
# ### Creating a Toy DataFrame
# 
# Let's create a simple DataFrame to get started. We will use the **pd.DataFrame()** constructor and provide some sample data in the form of a dictionary, where the keys are column names and the values are lists representing data for each column.
# 

# %%
# Creating a toy DataFrame using a dictionary
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 28],
    'City': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'],
    'Salary': [70000, 80000, 120000, 90000, 85000]
}

df = pd.DataFrame(data)

# Display the DataFrame
df

# %% [markdown]
# ### Understanding the Structure of a DataFrame
# Once we have created the DataFrame, it is crucial to understand its structure. A DataFrame consists of:
# 
# - Rows: Represent individual records (in our case, people)
# - Columns: Represent attributes or features (like Name, Age, City, and Salary)
# 
# In this DataFrame, each row contains data about a person, and each column holds a specific type of information.

# %%
df.head()    # Checking first few rows of a dataframe.

# %% [markdown]
# ### Accessing Data in a DataFrame
# One of the key features of Pandas is its ability to allow easy access to data in a DataFrame. You can access columns or rows using various methods. Let's see some examples:

# %%
# Accessing the 'Name' column
df['Name']

# %%
# Accessing multiple columns
df[['Name', 'City']]

# %%
# Accessing the first row using iloc (index-based)
df.iloc[0]


# %%
# Accessing a row by its index using loc (label-based)
df.loc[2]

# %% [markdown]
# ## Basic Manipulations of DataFrames
# Once the DataFrame is created, we can perform several manipulations to explore or clean the data. Here are a few common operations:
# 
# 1. **Adding a New Column:**
# We can easily add new columns to a DataFrame by assigning values to a new column label. Let's calculate the annual bonus as 10% of the salary.

# %%
# Adding a new column 'Bonus' that is 10% of the salary
df['Bonus'] = df['Salary'] * 0.1
df

# %% [markdown]
# 2. **Filtering Rows Based on Conditions:**
# You can filter data based on specific conditions. For example, let's filter out all employees who earn more than $80,000.

# %%
# Filtering rows where Salary > 80000
high_salary = df[df['Salary'] > 80000]
high_salary

# %% [markdown]
# 3. ***Updating Values:***
# You can also modify values in a DataFrame. Let's say David has moved to San Francisco, and we want to update his city in the DataFrame.

# %%
# Updating the city of 'David' to 'San Francisco'
df.loc[df['Name'] == 'David', 'City'] = 'San Francisco'
df

# %% [markdown]
# 4. ***Sorting the DataFrame:***
# Sorting is often required to organize data. We can sort the DataFrame based on values in a specific column. For example, let's sort the DataFrame by salary in descending order.

# %%
# Sorting the DataFrame by 'Salary' in descending order
df_sorted = df.sort_values(by='Salary', ascending=False)
df_sorted

# %% [markdown]
# 5. ***Dealing with Missing Data:***
# In real-world scenarios, data is often incomplete. Pandas provides tools to handle missing data. For demonstration purposes, let’s add some missing values to the DataFrame.

# %%
# Introducing some missing data
df.loc[2, 'Salary'] = np.nan  # Set Charlie's salary to NaN (missing)
df

# %% [markdown]
# You can handle missing data by filling them with specific values or by removing the rows/columns with missing data.

# %%
# Filling missing values with a default value (e.g., 0)
df_filled = df.fillna(0)
df_filled


# %%
# Alternatively, you can drop rows with missing data
df_dropped = df.dropna()
df_dropped

# %% [markdown]
# # Tutorial
# 
# Now, we will get started with the tutorial.

# %% [markdown]
# ## Exercise 1: Astronomical Statistical Unit
# 
# The **Astronomical Unit (AU)** is a fundamental concept in astronomy used to describe the distance between the Earth and the Sun. In this exercise, we are given data collected from various studies aiming to estimate the AU, provided in a CSV file named `AU.csv`.
# 
# ### a. Identifying the Statistical Units and Features
# 
# The statistical units in this dataset are the individual studies conducted to estimate the distance from the Earth to the Sun. The features for each statistical unit are:
# - **Study name**: Name of the scientist or organization that conducted the study.
# - **Year**: The year when the study was conducted.
# - **Distance**: The distance from Earth to the Sun in millions of miles as estimated by the study.
# 
# ### b. Using the Data to Determine an AU in 1961
# 
# If you had lived in 1961, the available data up to that year would help you approximate the value of the AU by analyzing trends in the estimates. By reviewing and averaging the measurements provided by studies conducted before 1961, you could derive an estimate close to the actual distance.
# 
# ### c. Loading the Data and Determining the AU
# 
# Let's load the data from the file `AU.csv` and compute the average distance from Earth to the Sun based on the data provided. Then, we will compare our result to the modern AU value of **92,955,807.2730 miles**.
# 

# %%
# Loading the data from AU.csv
au_data = pd.read_csv('./AU.csv')

# Displaying the first few rows of the dataset
au_data.head()


# %%
# Calculating the mean distance
mean_distance = au_data['mmiles'].mean()
mean_distance

# %%
# Modern value of AU in millions of miles
modern_au = 92_955_807.2730 / 1_000_000

# Difference between the modern AU and calculated mean
difference = modern_au - mean_distance
difference

# %% [markdown]
# ## Exercise 2: Standard Soldier
# 
# In this exercise, we examine historical height standards for soldiers in the French army over time. The dataset `soldier.csv` contains information about the minimum required height of soldiers from different years.
# 
# ### a. Difference Between the Two Datasets
# 
# Both datasets deal with standards, but the key difference is the nature of what is being measured. The first dataset (AU) measured an astronomical unit, which is a physical constant, while the second dataset (soldier heights) deals with a human standard that changes over time, possibly due to societal, medical, or technological advancements.
# 
# ### b. What Can We Conclude from the Data?
# 
# By looking at the data, we can observe a decrease in the minimum height required for soldiers over time. This may be explained by changes in the population's average height, the needs of the army, or changes in military recruitment strategies.
# 
# Let's load the soldier data and visualize the trend.
# 

# %%
# Loading the soldier height data from soldier.csv
import matplotlib.pyplot as plt
soldier_data = pd.read_csv('./soldier.csv')

# Displaying the data
soldier_data


# %%
plt.plot(soldier_data['year'], soldier_data['height'], marker='o')
plt.title('Minimum Height Requirements for Soldiers (French Army)')
plt.xlabel('Year')
plt.ylabel('Height (cm)')
plt.grid(True)
plt.show()


