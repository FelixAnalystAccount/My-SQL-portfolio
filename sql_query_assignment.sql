Select * from products;

--1. Find the highest and lowest priced products along with their prices
Select product_name, unit_price
from products
where unit_price = (select max(unit_price) from products)
UNION ALL
Select product_name, unit_price
from products
where unit_price = (select min(unit_price) from products);

select * from orders;
--2. Find the total number of orders in each month in year 2022
SELECT DATE_TRUNC('month', DATE(order_date)) AS Order_month,
       COUNT(order_id) AS count
       FROM orders
       WHERE order_date >= '2022-01-01' AND order_date <= '2022-12-31'
       GROUP BY DATE_TRUNC('month', DATE(order_date));


Select * from products;
--3. Find the AVG unit_price and Unit_cost (2 decimal) for each product category

SELECT product_category,
       ROUND(AVG(unit_price), 2) as AVG_UNIT_PRICE,
	   ROUND(AVG(Unit_cost), 2)  as AVG_UNIT_COST
	   FROM products
	   GROUP BY product_category;


Select * from orders;
--4. Find all orders placed on or after August 1, 2022
SELECT *
       FROM orders
       WHERE order_date >= '2022-08-01'
       ORDER BY order_date;


Select * from payments
order by payment_date;
-- 5. Count the number of payments made on April 14, 2023

SELECT *
       FROM payments
	   WHERE payment_date = '2023-04-14';
	   
	   
Select * from orders;
-- 6. Which Customer_id had the highest order placed in the orders table

SELECT customer_id, COUNT(*) as total
       FROM orders
	   GROUP BY customer_id
	   ORDER BY total DESC
	   Limit 1;
	   
	   
-- 7. What is the total number of orders by each customer_id

SELECT customer_id, COUNT(*) as total
       FROM orders
	   GROUP BY customer_id
	   ORDER BY total DESC;
	  
--8. How many orders were delivered between Jan and Feb 2023

SELECT COUNT(*)
	   FROM orders
	   WHERE order_date BETWEEN '2023-01-01' AND '2023-02-28'
	   AND delivery_status ='Delivered';
	   
--9. Add a credit card table to exercise1 DB and populate the data for all customers

CREATE TABLE credit_card(
Card_number int Primary key,
Customer_id int NOT NULL,
card_expiry_date DATE NOT NULL,
bank_name VARCHAR (20) NOT NULL,
FOREIGN KEY (Customer_id) references customers(Customer_id));

--10a. Retrieve all the information associated with the credit card that is next to expire  from the credit card table 
SELECT * FROM credit_card

--10a. Next to expire.
SELECT *
	   FROM credit_card
	   WHERE card_expiry_date > '2023-03-28'
	   order by card_expiry_date
	   LIMIT 1;
	   
	
--10b. How many cards have expired.
SELECT *
	   FROM credit_card
	   WHERE card_expiry_date < NOW();
	   

