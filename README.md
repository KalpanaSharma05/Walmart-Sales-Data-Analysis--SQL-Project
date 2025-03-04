# Walmart-Sales-Data-Analysis--SQL-Project

The main goal of this project is to gain understanding from Walmart's sales data, exploring the various factors that influence sales across different branches.

![Capture Image](https://github.com/KalpanaSharma05/Walmart-Sales-Data-Analysis--SQL-Project/blob/main/download.png)

### Key Features of the Project:
## 1. Data Wrangling
During this initial phase, the data is examined to detect any NULL or missing values, and strategies for data replacement are implemented to address and substitute these values effectively.
Build a database
Create a table and insert the data.
Select columns with null values in them. Null values are not present in our database because, in creating the tables, NOT NULL was specified for each field, effectively filtering out any null values.

## 2. Feature Engineering
This will help use generate some new columns from existing ones.

Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

## 3. Exploratory Data Analysis (EDA)

Conducting exploratory data analysis is essential to address the project's listed questions and objectives.

# Business Questions to Answer
### Generic Questions
1. How many distinct cities are present in the dataset?
2. In which city is each branch situated?
   
### Product Analysis
1. How many distinct product lines are there in the dataset?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. Which month recorded the highest Cost of Goods Sold (COGS)?
6. Which product line generated the highest revenue?
7. Which city has the highest revenue?
8. Which product line incurred the highest VAT?
9. Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales Analysis
1. Number of sales made in each time of the day per weekday
2. Identify the customer type that generates the highest revenue.
3. Which city has the largest tax percent/ VAT (Value Added Tax)?
4. Which customer type pays the most VAT?
   
### Customer Analysis
1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. Which is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day of the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?

