# Walmart sales Analysis

![1388601](https://github.com/user-attachments/assets/ebca7d75-2857-43e0-9fb1-430742197afd)


- ## 💻 Table of Contents
- [Introduction](#introduction)
- [Dataset Overview](#dataset-overview)
- [Project Objectives](#project-objectives)
- [Data Cleaning](#data-cleaning)
- [Data Exploration and Insight](#data-exploration-and-insight)
- [Recommendation](#recommendation)
- [Conclusion](#conclusion)


### 📌 Introduction
Retail giants like Walmart generate large amounts of transactional data every day. Analyzing this data helps in understanding customer behavior, product performance, and sales trends — leading to data-driven decisions that can improve revenue and customer satisfaction.
This project focuses on using SQL to clean, transform, and analyze Walmart's sales data. The goal is to uncover insights that can assist in improving store operations, marketing strategies, and customer experience.

### 📊 Dataset Overview
The dataset contains transactional data from a Walmart store. It includes customer, sales, and product information over a period of time. Below are some of the key features present in the dataset:
- **City** and **Branch** of purchase
- **Customer Type**, **Gender**
- **Product Line** and **Quantity**
- **Pricing**, **Tax**, **Total Revenue**
- **Date** and **Time** of purchase
- **Payment Method**
- **Customer Ratings**
## 📋 Table Description: `walmart_sales_data`
The dataset used in the analysis consisits of 1000 rows and 17 columns.
![Screenshot 2025-04-25 walmart](https://github.com/user-attachments/assets/a5231583-434d-457b-9bd6-4233a08934e8).

###  Project Objectives
- Create and set up a relational database for the dataset.
- Clean and transform raw data for clarity and accuracy.
- Perform detailed SQL analysis to answer key business questions.
- Extract actionable insights about sales, customers, and product lines.
- Deliver recommendations based on data findings.
  
You are tasked with analyzing this Walmart Sales dataset using SQL. Here are the business questions for which you will write SQL queries to gain insights.

Generic Question

1. How many unique cities does the data have?
2. In which city is each branch?
   
Product

1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?
    
Sales

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (Value Added Tax)?
4. Which customer type pays the most in VAT?
   
Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day of the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?

### 🧹 Data Cleaning
To ensure accurate analysis, several data cleaning steps were taken:

I started by remaning my table and columns to ensure consistency

I renamed table name from `walmartsalesdata.csv` to walmart_sales_data
```sql
rename table `walmartsalesdata.csv` to walmart_sales_data;
```
- Renamed ambiguous column names (e.g., `Invoice ID` ➝ `Invoice_ID`).
- Changed monetary columns to the correct `DECIMAL` format.
- Converted `Date` and `Time` columns to their respective data types.
- Standardized column naming conventions (e.g., snake_case).
- Removed potential formatting inconsistencies in spacing and case.

### 🔍 Data Exploration and Insights

## 📍 City & Branch Insights
- There are **3 unique cities**, each assigned a branch (A, B, C).
- **City B** (and its corresponding branch) generated the **highest revenue**.

## 🛒 Product Performance
- The dataset contains **6 unique product lines**.
- **"Food and Beverages"** was the **top-selling product line** by quantity.
- The product line that contributed the **most VAT** was **"Health and Beauty"**.

### 💳 Sales & Revenue
- **January** recorded the **highest revenue**.
- The branch with the **highest average number of products sold** was **Branch C**.
- The **most common payment method** was **Ewallet**.

## 👥 Customer Insights
- Customers were categorized as **Members** or **Normal**.
- **Member customers** generated the most revenue.
- **Male customers** were slightly more frequent across all branches.
- The highest number of ratings was given during the **Evening**.

## ⭐ Ratings & Feedback
- **Friday** was the day with the **highest average ratings**.
- The **"Electronic Accessories"** product line received the **highest average rating**.
- Ratings were more frequently given in the **Evening**, across all branches.

---

### ✅ Recommendations

1. **Focus Marketing Efforts on High-Performing Cities**  
   Cities like **City B** with the highest revenue should receive targeted campaigns and customer retention programs.

2. **Enhance Inventory for Best-Selling Products**  
   Ensure optimal stock levels for **Food and Beverages** and **Electronic Accessories** across branches.

3. **Expand Digital Payment Options**  
   Since **Ewallet** is the most used payment method, consider offering promotions or discounts for digital wallet users.

4. **Improve Services in Lower-Rated Time Periods**  
   Consider staff shifts or promotions in the **Morning and Afternoon** slots where ratings are lower.

5. **Explore Loyalty Programs for Normal Customers**  
   Since **Members** bring in more revenue, incentivizing normal customers to join loyalty programs could boost sales.

---

### 🧾 Conclusion

This project successfully demonstrates the power of SQL in analyzing real-world retail data. Through structured querying and data transformation, we uncovered insights into customer behavior, product popularity, and sales performance. These insights can guide data-backed strategies to boost revenue, enhance customer satisfaction, and streamline business operations.

---

## 🛠 Tech Stack

- SQL (MySQL)
- Git & GitHub
- MySQL Workbench

---

> 💡 *Feel free to fork the repo, raise issues, or submit pull requests if you want to contribute or suggest improvements!*
