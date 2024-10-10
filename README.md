# Hazelwood_Cafe_Sales_Analysis
This project analyzes sales data for Hazelwood Cafe, including transaction volumes, revenue, and product performance. Using MySQL queries for analysis and Power BI for creating an interactive dashboard for visualization, the project uncovers insights into monthly sales trends and customer preferences.

** Dataset Overview**:  
This dataset contains transaction-level sales data from Hazelwood Cafe in 2023. It includes detailed records of product purchases, transaction timestamps, quantities, and store locations. The dataset is structured to support various data analysis tasks, such as exploring sales trends, product performance, and store analytics.

**Columns**:
- **transaction_id**: Unique identifier for each transaction.
- **transaction_date**: Date of the transaction (format: MM/DD/YYYY).
- **transaction_time**: Time of the transaction (format: HH:MM:SS).
- **transaction_qty**: Quantity of items purchased in each transaction.
- **store_id**: Identifier for the store where the transaction occurred.
- **store_location**: Location of the store.
- **product_id**: Identifier for the product sold.
- **unit_price**: Price per unit of the product (in dollars).
- **product_category**: Category of the product (e.g., Coffee, Tea, Drinking Chocolate).
- **product_type**: Specific type within the product category (e.g., Gourmet brewed coffee, Brewed Chai tea).
- **product_detail**: Further description of the product (e.g., Ethiopia Rg, Spicy Eye Opener Chai Lg, Dark chocolate Lg).


## Problem Statement

### KPI Requirements

1. **Total Sales Analysis**
   - Calculate the total sales for each respective month.
   - Determine the month-on-month increase or decrease in sales.
   - Calculate the difference in sales between the selected month and the previous month.

2. **Total Orders Analysis**
   - Calculate the total number of orders for each respective month.
   - Determine the month-on-month increase or decrease in the number of orders.
   - Calculate the difference in the number of orders between the selected month and the previous month.

3. **Total Quantity Sold Analysis**
   - Calculate the total quantity sold for each respective month.
   - Determine the month-on-month increase or decrease in the total quantity sold.
   - Calculate the difference in the total quantity sold between the selected month and the previous month.

### Chart Requirements

1. **Calendar Heatmap**
   - Implement a calendar heatmap that dynamically adjusts based on the second month from a slicer.
   - Each day on the calendar will be color-coded to represent sales volume with darker shades indicating higher sales.
   - Implement tooltips to display detailed metrics like sales, orders, and quantity when hovering over a specific date.

2. **Sales Analysis by Weekdays and Weekends**
   - Segment sales data into weekdays and weekends to analyze performance variations.
   - Provide insights into whether sales patterns differ significantly between weekdays and weekends.

3. **Sales Analysis by Store Location**
   - Visualize sales data by different store locations.
   - Include month-over-month difference metrics based on the selected month in the slicer.
   - Highlight month-over-month sales increase or decrease for each store location to identify trends.

4. **Daily Sales Analysis with Average Line**
   - Create a grid for the selected month, region, and line, with a chart that includes an average sales line.
   - Highlight days exceeding or falling below the average to identify patterns.

5. **Sales Analysis by Product Category**
   - Analyze sales performance across different product categories.
   - Provide insights into which product categories contribute the most to overall sales.

6. **Top 10 Products**
   - Identify and rank the top 10 products based on sales volume.
   - Allow users to quickly visualize the best performing products in terms of sales.

7. **Sales Analysis by Days and Hours**
   - Utilize a heatmap to visualize sales patterns for different days and hours.
   - Implement tooltips to visualize detailed metrics like sales, orders, and quantity when hovering over a specific day or hour.

### SQL Queries
Below are the SQL queries used for data analysis.

-- Creating a new database for the coffee shop sales
CREATE DATABASE coffee_shop_sales_db;

-- Using the newly created database
USE coffee_shop_sales_db;

-- Importing the required table
CREATE TABLE coffee_shop_sales (
    transaction_id INT,
    transaction_date VARCHAR(100),
    transaction_time VARCHAR(100),
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(100),
    product_id INT,
    unit_price DOUBLE,
    product_category VARCHAR(100),
    product_type VARCHAR(100),
    product_detail VARCHAR(100)
);

-- Loading data from the CSV file into the coffee_shop_sales table
LOAD DATA INFILE 'coffee_shop_sales.csv' 
INTO TABLE coffee_shop_sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

-- Total Sales Analysis

-- 1. Total sales by month
SELECT 
    CONCAT((ROUND(SUM(unit_price * transaction_qty))) / 1000,
            'K') AS total_sales
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 3; -- May

-- 2. % increase in total sales by month
SELECT
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))
    /
    (LAG(SUM(unit_price * transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date))) * 100 AS mom_increase_percentage
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- For April, May
GROUP BY MONTH(transaction_date);

-- 3. Difference in total sales by month
SELECT
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date))) AS sales_diff
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- For April, May
GROUP BY MONTH(transaction_date);

-- total orders analysis

-- 1. total orders by month
SELECT 
    COUNT(transaction_id) AS total_orders
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 5;
    
-- 2. % increase in total orders by month
SELECT
	MONTH(transaction_date) AS month,
    COUNT(transaction_id) AS total_orders,
    (COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) OVER(ORDER BY MONTH(transaction_date)))
    /
	(LAG(COUNT(transaction_id), 1) OVER(ORDER BY MONTH(transaction_date)))*100 
    AS mom_increase_percentage
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- for april, may
GROUP BY MONTH(transaction_date);

-- 3. difference in total orders by month
SELECT
	MONTH(transaction_date) AS month,
    COUNT(transaction_id) AS total_orders,
    ((COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) OVER(ORDER BY MONTH(transaction_date)))) AS orders_diff
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- for april, may
GROUP BY MONTH(transaction_date);

-- Total Sales Analysis for a specific date
SELECT 
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000, 1), 'K') AS total_sales, 
    CONCAT(ROUND(SUM(transaction_qty) / 1000, 1), 'K') AS total_qty_sold, 
    CONCAT(ROUND(COUNT(transaction_id) / 1000, 1), 'K') AS total_orders
FROM coffee_shop_sales
WHERE transaction_date = '2023-05-18'; -- For May 18, 2023

-- Total sales by weekdays and weekends:
-- Weekend includes Saturday and Sunday
-- Sunday to Saturday are numbered as 1-7
SELECT 
    CASE
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'weekends'
        ELSE 'weekdays'
    END AS day_type,
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000, 1), 'K') AS total_sales
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 5 -- For May
GROUP BY day_type; 

-- Analyze sales data by different store locations
SELECT
    store_location, 
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000, 1), 'K') AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY store_location
ORDER BY total_sales DESC; 

-- Average sales per day in a month
SELECT CONCAT(ROUND(AVG(total_sales) / 1000, 1), 'K') AS avg_sales
FROM 
    (
        SELECT SUM(unit_price * transaction_qty) AS total_sales
        FROM coffee_shop_sales
        WHERE MONTH(transaction_date) = 5
        GROUP BY transaction_date
    ) AS daily_sales_in_a_month;

-- Daily sales in a month
SELECT DAY(transaction_date) AS day_of_month, SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY day_of_month;

-- Classifying daily sales in a month as above or below average
SELECT 
    day_of_month,
    total_sales,
    CASE 
        WHEN total_sales > avg_sales THEN 'above average'
        WHEN total_sales < avg_sales THEN 'below average'
        ELSE 'equal to average'
    END AS sales_status
FROM (
    SELECT
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM coffee_shop_sales
    WHERE MONTH(transaction_date) = 5 -- Filter for May
    GROUP BY day_of_month
) AS sales_data;

-- Total sales by product category
SELECT product_category, SUM(unit_price * transaction_qty) AS total_sales 
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 -- For May
GROUP BY product_category
ORDER BY total_sales DESC;

-- Top 10 products by sales
SELECT product_type, SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 AND product_category = 'Coffee'
GROUP BY product_type
ORDER BY total_sales DESC
LIMIT 10;

-- Total sales by day and hour
SELECT SUM(unit_price * transaction_qty) AS total_sales, SUM(transaction_qty) AS total_qty_sold, COUNT(transaction_id) AS total_orders
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 -- For May
    AND DAYOFWEEK(transaction_date) = 2 -- For Monday
    AND HOUR(transaction_time) = 8; -- For hour number 8 (8 AM)

-- Total sales w.r.t. hour in the whole month (which hour has the most sales?)
SELECT HOUR(transaction_time) AS hour_no, SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY hour_no
ORDER BY hour_no;

-- Total sales w.r.t. days in the week
SELECT DAYNAME(transaction_date) AS day_name, ROUND(SUM(unit_price * transaction_qty)) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY day_name;

