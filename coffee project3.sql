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
