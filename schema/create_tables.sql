CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
city VARCHAR(50),
signup_date DATE
);

CREATE TABLE Categories(
category_id INT PRIMARY KEY,
category_name VARCHAR(50)
);

CREATE TABLE Products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category_id INT,
price DECIMAL(10,2),
stock INT,
FOREIGN KEY(category_id)
REFERENCES Categories(category_id)
);

CREATE TABLE Orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(30),
FOREIGN KEY(customer_id)
REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price DECIMAL(10,2),

FOREIGN KEY(order_id)
REFERENCES Orders(order_id),

FOREIGN KEY(product_id)
REFERENCES Products(product_id)
);

CREATE TABLE Payments(
payment_id INT PRIMARY KEY,
order_id INT,
payment_date DATE,
amount DECIMAL(10,2),
payment_method VARCHAR(50),

FOREIGN KEY(order_id)
REFERENCES Orders(order_id)
);
