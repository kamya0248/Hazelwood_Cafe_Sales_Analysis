CREATE DATABASE coffee_shop_sales_db;

USE coffee_shop_sales_db;

-- importing the required table: 

CREATE TABLE coffee_shop_sales
(
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

LOAD DATA INFILE 'coffee_shop_sales.csv' INTO TABLE coffee_shop_sales
FIELDS TERMINATED BY ','
IGNORE 1 LINES;















