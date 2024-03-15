import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.dates as mdates
from collections import Counter
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
import ipywidgets as widgets
from IPython.display import display, clear_output
from tkinter import Tk, filedialog

# Function to select file
def select_file(b):
    clear_output()
    root = Tk()
    root.withdraw()  # Hide the main window
    root.call('wm', 'attributes', '.', '-topmost', True)  # Raise the root to the top of all windows
    b.files = filedialog.askopenfilename(multiple=False)  # List of selected files
    path = b.files
    global df
    df = pd.read_csv(path)  # Changed from pd.read_excel to pd.read_csv
    print(f'Loaded dataframe from {path}')

# Button for file selection
fileselect = widgets.Button(description="File select")
fileselect.on_click(select_file)
display(fileselect)

# Displaying dataframe
display(df.head())

# Understanding the Data
print("Data Types:")
print(df.dtypes)
print("\nShape of the Data:")
print(df.shape)
print("\nSummary Statistics:")
print(df.describe())

# Visualizations
plt.figure(figsize=(12, 6))

# Distribution of travel time
plt.subplot(2, 2, 1)
sns.histplot(df['travel_time'], bins=20, kde=True)
plt.title('Travel Time Distribution')

# Payment method distribution
plt.subplot(2, 2, 2)
sns.countplot(x='payment_method', data=df)
plt.title('Payment Method Distribution')

# Travel routes
plt.subplot(2, 2, 3)
sns.countplot(y='travel_from', hue='travel_to', data=df)
plt.title('Travel Routes')

# Scatter plot of car type vs. max capacity
plt.subplot(2, 2, 4)
sns.scatterplot(x='car_type', y='max_capacity', data=df)
plt.title('Car Type vs Max Capacity')

plt.tight_layout()
plt.show()

# Extracting date and year
df['booking_date'] = pd.to_datetime(df['travel_date']).dt.date
df['booking_year'] = pd.DatetimeIndex(df['booking_date']).year

# Plot year-wise booking trends
plt.figure(figsize=(8, 5))
df['booking_year'].value_counts().sort_index().plot(kind='line')
plt.xlabel('Year')
plt.ylabel('Number of Bookings')
plt.title('Year-wise Booking Trends')
plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y'))
plt.gca().xaxis.set_major_locator(mdates.YearLocator())
plt.show()

# Extracting hour and minute from travel time
df['hour'] = pd.to_datetime(df['travel_time']).dt.hour
df['minute'] = pd.to_datetime(df['travel_time']).dt.minute

# Average travel time
avg_travel_time = df['travel_time'].mean()
print(f'Average Travel Time: {avg_travel_time}')

# Aggregating tickets to know how many passengers are for a given ride_id
ride_id_dict = Counter(df["ride_id"])

# Preprocessing data
df_processed = df.drop(['seat_number', 'payment_method', 'payment_receipt', 'travel_to', 'booking_date', 'hour', 'minute'], axis=1)
df_processed.drop_duplicates(inplace=True)
df_processed.reset_index(drop=True, inplace=True)

# Adding a new column "number_of_tickets" and initializing with zeros
df_processed["number_of_tickets"] = np.zeros(len(df_processed))

# For each row in df_processed
for i in range(len(df_processed)):
    ride_id = df_processed.loc[i]["ride_id"]
    df_processed.at[i, "number_of_tickets"] = ride_id_dict[ride_id]

display(df_processed.head())