-- total sales analysis

-- 1. total sales by month
SELECT 
    CONCAT((ROUND(SUM(unit_price * transaction_qty))) / 1000,
            'K') AS total_sales
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 3; -- may

-- 2. % increase in total sales by month
SELECT
	MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))
    /
	(LAG(SUM(unit_price * transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))*100 
    AS mom_increase_percentage
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- for april, may
GROUP BY MONTH(transaction_date);

-- 3. difference in total sales by month
SELECT
	MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    ((SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) OVER(ORDER BY MONTH(transaction_date)))) AS sales_diff
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5) -- for april, may
GROUP BY MONTH(transaction_date);





