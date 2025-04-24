create database walmart_salesdb;
use walmart_salesdb;

select * from `walmartsalesdata.csv`;
-- rename table name from `walmartsalesdata.csv` to walmart_sales_data;
rename table `walmartsalesdata.csv` to walmart_sales_data;
select * from walmart_sales_data;
describe walmart_sales_data;

-- rename column `Invoice ID` to Invoice_ID
alter table walmart_sales_data
rename column `Invoice ID` to Invoice_ID;

-- rename column `Customer type` to Customer_type
alter table walmart_sales_data
rename column `Customer type` to Customer_type;

-- rename column `Product line` to Product_line
alter table walmart_sales_data
rename column `Product line` to Product_line;
select * from walmart_sales_data;

-- rename column `Unit price` to Unit_price
alter table walmart_sales_data
rename column `Unit price` to Unit_price;

-- change monetary datatype to decimal
alter table walmart_sales_data
modify column Unit_price decimal(10,2);

select * from walmart_sales_data;

-- rename column `Tax 5%` to Tax;
alter table walmart_sales_data
rename column `Tax 5%` to Tax;

-- rename column `cogs` to cost_of_good_sold
alter table walmart_sales_data
rename column `cogs` to cost_of_good_sold;

-- rename column `Gross margin percentage` to Gross_margin
alter table walmart_sales_data
rename column `Gross margin percentage` to Gross_margin;

-- rename column `Gross income ` to Gross_income
alter table walmart_sales_data
rename column `Gross income` to Gross_income;

-- change date datatype
alter table walmart_sales_data
modify column Date Date;

-- Generic Question
-- 1. How many unique cities does the data have?
select * from walmart_sales_data;
select count(distinct City) as unique_cities from walmart_sales_data;

-- 2. In which city is each branch?
select city,branch from walmart_sales_data group by branch, city order by Branch;


-- Product
-- 1. How many unique product lines does the data have?
select * from walmartsalesdata;
select count(distinct product_line) as product_line_count from walmart_sales_data;

-- 2. What is the most common payment method?
select payment, count(payment) as common_payment_methaod from walmart_sales_data group by payment order by 2 desc limit 1;

-- 3. What is the most selling product line?
select product_line,sum(Quantity) AS total_qty FROM walmart_sales_data group by Product_line;
select product_line,sum(Quantity) AS total_qty FROM walmart_sales_data group by Product_line order by 2 DESC LIMIT 1;

-- 4. What is the total revenue by month?
select monthname(Date)as monthname, month(Date) as month_no, round(sum(total),2) as total_revenue from walmart_sales_data group by 1,2 order by 2, 3 desc;

-- 5. What month that has the largest COGS?
select monthname(date) as monthname, round(sum(cost_of_good_sold),2) as largest_cosg from walmart_sales_data group by monthname order by 2 desc limit 1;

-- 6. What product line had the largest revenue?
select product_line, round(sum(total),2) as largest_revenue from walmart_sales_data group by 1 order by 2 desc limit 1;

-- 7. What is the city with the largest revenue?
select * from walmart_sales_data;
select city, round(sum(total),2)  as largest_revenue from walmart_sales_data group by 1 order by 2 desc limit 1;

-- 8. What product line had the largest VAT?
select product_line, round(sum(tax),2) as largest_vat from walmart_sales_data group by 1 order by 2 desc limit 1;

-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
select product_line, round(avg(cost_of_good_sold),2) as avg_sales from walmart_sales_data group by Product_line;
select round(avg(cost_of_good_sold),2) as avg_sales from walmart_sales_data; 
select product_line, round(avg(cost_of_good_sold),2) as avg_sales, case when avg(cost_of_good_sold) > 307.59 then "Good" else "Bad" end as class 
from walmart_sales_data group by Product_line;

-- 10. Which branch sold more products than average product sold?
select round(avg(Quantity),2) as qty from walmart_sales_data;
 select Branch, round(avg(quantity),2) as more_sales from walmart_sales_data group by Branch having more_sales  > 5.51;

-- 11. What is the most common product line by gender?
select product_line, gender, count(product_line) as product_count from walmart_sales_data group by Product_line, Gender order by 2,3 desc limit 1;

-- 12. What is the average rating of each product line?
select product_line, round(avg(rating),2) as avg_rate from walmart_sales_data group by 1;


-- Sales
-- 1. Number of sales made in each time of the day per weekday
select case when hour(Time) between 0 and 11 then 'Morning' when hour(Time) between 12 and 16 then 'Afternoon' else 'Evening' end as time_of_day,
    count(Quantity) as no_sales from walmart_sales_data where dayname(date) <> 'Saturday' and dayname(date) <> 'Sunday'  group by time_of_day order by 2;


-- 2. Which of the customer types brings the most revenue?
select customer_type, round(sum(total),2) as most_revenue from walmart_sales_data group by 1 order by 2 desc limit 1;

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)?
select city, round(sum(tax),2) as largest_tax from walmart_sales_data group by 1 order by 2 desc limit 1;

-- 4. Which customer type pays the most in VAT?
select customer_type, round(sum(tax),2) as most_tax from walmart_sales_data group by Customer_type order by 2 desc limit 1;


-- Customer
-- 1. How many unique customer types does the data have?
select count(distinct customer_type) as unique_customer_type from walmart_sales_data;

-- 2. How many unique payment methods does the data have?
select count(distinct payment) as unique_payment_method from walmart_sales_data;

-- 3. What is the most common customer type?
select Customer_type, count(customer_type) as common_customer_type_count from walmart_sales_data group by Customer_type order by 2 desc limit 1;

-- 4. Which customer type buys the most?
select Customer_type, sum(Quantity) as total_quantity from walmart_sales_data group by Customer_type  order by 2 desc limit 1;

-- 5. What is the gender of most of the customers?
select gender, count(gender) as gender_count from walmart_sales_data group by Gender order by 2 desc limit 1;

-- 6. What is the gender distribution per branch?
select Branch, Gender, count(gender) as count  from walmart_sales_data group by Branch, Gender order by Branch;

-- 7. Which time of the day do customers give most ratings?,
select case when hour(Time) between 0 and 11 then 'Morning' when hour(Time) between 12 and 16 then 'Afternoon' else 'Evening' end as time_of_day, 
count(Rating) as rate_no from walmart_sales_data group by time_of_day order by rate_no;

-- 8. Which time of the day do customers give most ratings per branch?
select Branch,  case when hour(Time) between 0 and 11 then 'Morning' when hour(Time) between 12 and 16 then 'Afternoon' else 'Evening' end as time_of_day, 
round(avg(Rating),1) as rate_no from walmart_sales_data group by Branch, time_of_day order by Branch, time_of_day desc;

-- 9. Which day of the week has the best avg ratings?
select dayname(Date) as  weekday, avg(Rating) as avg_rating from walmart_sales_data group by weekday order by avg_rating desc limit 1;

-- 10. Which day of the week has the best average ratings per branch?
select Branch, dayname(Date) as  weekday, avg(Rating) as avg_rating from walmart_sales_data group by Branch, weekday order by Branch, avg_rating desc;