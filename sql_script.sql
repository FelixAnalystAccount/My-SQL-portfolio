CREATE TABLE Customers (
	customer_id int PRIMARY KEY,
	customer_name VARCHAR (50) NOT NULL,
	customer_email VARCHAR (50) NOT NULL,
	customer_phone VARCHAR (50) NOT NULL);

CREATE TABLE Products (
	product_id int PRIMARY KEY,
	product_name VARCHAR (100) NOT NULL,
	product_description VARCHAR (500) NOT NULL,
	product_category text NOT NULL,
	unit_price numeric (10,2) NOT NULL);
	
CREATE TABLE Orders (
	order_id int PRIMARY KEY,
	customer_id int NOT NULL,
	order_date DATE NOT NULL,
	product_id int NOT NULL,
	order_quantity int NOT NULL,
	delivery_status TEXT NOT NULL,
	FOREIGN KEY (customer_id) references Customers(customer_id),
	FOREIGN KEY (product_id) references Products(product_id));
	
CREATE TABLE Payments (
	payment_id int PRIMARY KEY,
	order_id int NOT NULL,
	payment_date Date NOT NULL,
	FOREIGN KEY (order_id) references Orders(order_id));