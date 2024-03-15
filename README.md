# Nairobi Traffic Analysis Project

## Project Overview

The Nairobi Traffic Analysis Project is a comprehensive initiative aimed at understanding and addressing the traffic congestion issues in Nairobi. By leveraging a rich dataset of ride details, the project seeks to uncover patterns and insights that can guide operational improvements, enhance customer experience, and inform future decision-making processes. The insights derived from this project hold significant value for urban planners, traffic management authorities, and transportation service providers. The project underscores the potential of data-driven decision making in transforming urban transportation and contributing to a more sustainable and efficient future for Nairobi.

## Prerequisites

Before you begin, ensure you have the following installed:

1. Python
2. MySQL

## Installation

Follow these steps to set up your environment:

1. Import the provided SQL script into your MySQL database to establish the database schema.

2. Install the required Python libraries using pip:

```bash
pip install pandas matplotlib seaborn scikit-learn ipywidgets
```

## Usage

To analyze the dataset and extract insights, execute the Python script included in this project. 

1. Run the Python script in your preferred Python environment.
2. Use the "File select" button to choose the dataset file.
3. The script will load the dataset and display a preview of the first few rows once the file is selected.

## MySQL Integration

The project includes an SQL script (`traffic_analysis.sql`) for creating the database schema in MySQL. Import this script into your MySQL database to generate the necessary tables for storing and managing the dataset.

## Libraries Utilized

- pandas: For data manipulation and analysis.
- matplotlib & seaborn: For data visualization.
- scikit-learn: For predictive modeling.
- ipywidgets: For creating interactive GUI elements like the file selection widget.

## Data Insights

The project offers various insights into the dataset:

- Understanding the data types and structure of the dataset.
- Summary statistics of numerical columns.
- Distribution of travel time and payment methods.
- Visualization of travel routes and car types.

## Additional Features

- Analysis of booking trends over time.
- Calculation of average travel time.
- Aggregation of tickets to determine the passenger count for each ride_id.

## Note

Ensure that you have the necessary permissions to access the dataset file and MySQL database. Depending on the structure and format of your dataset, the script may require modifications.

## Acknowledgments

I extend my deepest gratitude to the online Data Science community. Your invaluable contributions and unwavering support have been instrumental in the success of this project.

The resources shared by this community have not only enriched the project but also significantly expedited its progress. Your collective wisdom has been instrumental in shaping this endeavor, and for that, I am profoundly grateful.

This project is a testament to the power of collective knowledge and the spirit of open-source collaboration. Thank you for making this journey an enlightening and rewarding experience.
