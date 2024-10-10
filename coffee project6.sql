-- analyse sales data by different store locations
SELECT
	store_location, 
    CONCAT(ROUND(SUM(unit_price * transaction_qty)/1000, 1), 'K') AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY store_location
ORDER BY total_sales DESC; 

-- avg sales per day in a month
SELECT CONCAT(ROUND(AVG(total_sales)/1000, 1), 'K') AS avg_sales
FROM 
	(
    SELECT SUM(unit_price * transaction_qty) AS total_sales
    FROM coffee_shop_sales
    WHERE MONTH(transaction_date) = 5
    GROUP BY transaction_date
    ) AS daily_sales_in_a_month;
    
-- daily sales in a month
SELECT DAY(transaction_date) AS day_of_month, SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY day_of_month;

-- classifying daily sales in a month to above or below avg
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
    WHERE MONTH(transaction_date) = 5 -- filter for may
    GROUP BY day_of_month
) AS sales_data



    
