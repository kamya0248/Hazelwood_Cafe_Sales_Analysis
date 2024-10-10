-- total quantity sold analysis

-- 1. total quantity sold by month
SELECT 
    COUNT(transaction_qty) AS total_qty
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 5; -- for may
    
-- 2. % increase in total quantity sold by month
SELECT
	MONTH(transaction_date) AS month,
    COUNT(transaction_qty) AS total_qty,
    (COUNT(transaction_qty) - LAG(COUNT(transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))
    /
	(LAG(COUNT(transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))*100 
    AS mom_increase_percentage
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- for april, may
GROUP BY MONTH(transaction_date);

-- 3. difference in total quantity sold by month
SELECT
	MONTH(transaction_date) AS month,
    COUNT(transaction_qty) AS total_qty,
    ((COUNT(transaction_qty) - LAG(COUNT(transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))) AS qty_diff
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- for april, may
GROUP BY MONTH(transaction_date);

