-- cleaning the dataset (correcting the datatypes)
-- change format and datatype of transaction_date column from varchar to date
UPDATE coffee_shop_sales
SET transaction_date = DATE_FORMAT(STR_TO_DATE(transaction_date, '%m/%d/%Y'), '%d/%m/%Y');

UPDATE coffee_shop_sales
SET transaction_date = DATE_FORMAT(STR_TO_DATE(transaction_date, '%d/%m/%Y'), '%Y-%m-%d');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

-- change format and datatype of transaction_time column from varchar to time
UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;




