CREATE TABLE states(
State_id int Primary key,
Restaurant_state Text NOT NULL);

CREATE TABLE restaurants(
Restaurant_id int Primary key,
Restaurant_name Text NOT NULL,
Restaurant_address_line1 VARCHAR NOT NULL,
State_id int NOT NULL,
Restaurant_zip_code int NOT NULL,
FOREIGN KEY (State_id) references states(State_id));

CREATE TABLE customers(
Customer_id int Primary key,
Customer_name VARCHAR (50) NOT NULL,
Customer_address VARCHAR(50) NOT NULL,
Customer_email VARCHAR(50) NOT NULL,
Restaurant_id int NOT NULL,
FOREIGN KEY (Restaurant_id) references restaurants(Restaurant_id)); 

CREATE TABLE items(
Item_id int Primary key,
Restaurant_id int NOT NULL,
Item_type Text NOT NULL,
Item_description Text NOT NULL,
FOREIGN KEY (Restaurant_id) references restaurants(Restaurant_id));

CREATE TABLE orders(
Order_id VARCHAR (10) Primary key,
Customer_id int NOT NULL,
Order_date DATE NOT NULL,
Order_quantity int NOT NULL,
Price numeric (5,2) NOT NULL,
FOREIGN KEY (Customer_id) references customers(Customer_id));

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;