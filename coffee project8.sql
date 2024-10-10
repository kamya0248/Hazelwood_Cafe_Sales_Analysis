-- total sales by day and hour
SELECT SUM(unit_price * transaction_qty) AS total_sales, SUM(transaction_qty) AS total_qty_sold, COUNT(transaction_id) AS total_orders
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 -- for may
	AND dayofweek(transaction_date) = 2 -- for monday
    AND hour(transaction_time) = 8; -- for hour number 8 (8 am??)
    
-- total sales w.r.t. hour in the whole month (which hour has the most sales?)
SELECT HOUR(transaction_time) AS hour_no, SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY hour_no
ORDER BY hour_no;

-- total sales w.r.t. days in the week
SELECT dayname(transaction_date) AS day_name, ROUND(SUM(unit_price * transaction_qty)) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY day_name


    
