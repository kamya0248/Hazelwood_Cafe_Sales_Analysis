# Hazelwood_Cafe_Sales_Analysis
This project analyzes sales data for Hazelwood Cafe, including transaction volumes, revenue, and product performance. Using MySQL queries for analysis and Power BI for creating an interactive dashboard for visualization, the project uncovers insights into monthly sales trends and customer preferences.

**Dataset Overview**:  
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

**Potential Use Cases**:
- Analyzing customer purchase patterns.
- Investigating sales trends by hour, day, or month.
- Assessing product and pricing strategies.
- Applying data analysis techniques using SQL, Python, Excel, or Power BI for business insights.

Here’s a description you can add to your README file for the Power BI dashboard:

---

### Power BI Dashboard

In addition to SQL queries and analysis, I created an **interactive Power BI dashboard** to visualize and explore the coffee shop sales data. This dashboard provides a user-friendly interface to deep-dive into the sales performance, enabling a dynamic view of the key metrics. 

**Key Features:**
- **Total Sales Overview:** Displays total sales, quantities sold, and number of transactions across different timeframes.
- **Sales Breakdown by Product Category and Type:** Allows users to filter and view sales data by product categories (e.g., Coffee, Tea, Snacks) and further by product types.
- **Date-Based Analysis:** Users can filter by specific dates, months, or even drill down into daily sales figures to get detailed insights on sales trends over time.
- **Sales by Location:** The dashboard provides insights into how sales are performing at different store locations.
- **Time-Based Analysis:** Analyzes the sales patterns across different hours of the day and days of the week, identifying peak times for customer transactions.
- **Comparison of Weekday vs. Weekend Sales:** Highlights how sales differ between weekdays and weekends.

This dashboard allows for **dynamic filtering and interaction**, meaning that users can click on different elements (like product categories or dates) to adjust the data being displayed, making it a versatile tool for uncovering actionable insights from the sales data.

You can download the **Power BI file** included in this repository to further explore the data.


