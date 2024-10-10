-- total sales by product category
SELECT product_category, SUM(unit_price * transaction_qty) AS total_sales 
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 -- for may
GROUP BY product_category
ORDER BY total_sales DESC;

-- top 10 products by sales
SELECT product_type, SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 AND product_category = 'Coffee'
GROUP BY product_type
ORDER BY total_sales DESC
LIMIT 10;