
SELECT CONCAT(ROUND(SUM(unit_price * transaction_qty)/1000, 1), 'K') AS total_sales, 
CONCAT(ROUND(SUM(transaction_qty)/1000, 1), 'K') AS total_qty_sold, 
CONCAT(ROUND(COUNT(transaction_id)/1000, 1), 'K') AS total_orders
FROM coffee_shop_sales
WHERE transaction_date = '2023-05-18'; -- for may 18, 2023

-- total sales by weekdays and weekends:
-- weekend includes sat and sun
-- sun to sat are numbered as 1-7

SELECT 
    CASE
        WHEN DAYOFWEEK(transaction_date) IN (1 , 7) THEN 'weekends'
        ELSE 'weekdays'
    END AS day_type,
    CONCAT(ROUND(SUM(unit_price * transaction_qty)/1000, 1), 'K') AS total_sales
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 5 -- for may
GROUP BY day_type; 
	

    