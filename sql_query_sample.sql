SELECT * FROM customers

SELECT COUNT(*) From customers
WHERE customer_id > 20

SELECT COUNT(*) From customers
WHERE customer_name like 'E%'

SELECT * From customers
WHERE customer_name like 'E%'

SELECT product_category,COUNT(product_name) from products
group by product_category

SELECT product_description,COUNT(product_name) from products
group by product_description

SELECT unit_price,COUNT(product_name) from products
group by unit_price

--what is the sum of the product_category
SELECT product_category,SUM(unit_price) from products
group by product_category

SELECT product_category,SUM(unit_price) from products
group by product_category
Having sum(unit_price)>90000

SELECT product_category,SUM(unit_price),min(unit_price) from products
group by product_category

SELECT product_category,SUM(unit_price),min(unit_price),avg(unit_price) 
from products
group by product_category

SELECT product_category,SUM(unit_price),min(unit_price),round(avg(unit_price)) 
from products
group by product_category

SELECT product_category,SUM(unit_price),min(unit_price),round(avg(unit_price),2) 
from products
group by product_category