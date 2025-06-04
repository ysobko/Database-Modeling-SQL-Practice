CREATE DATABASE ERD;
USE ERD;

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
stock INT NOT NULL CHECK (stock > 0)
);

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE NOT NULL,
customer_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE
);

CREATE TABLE order_items (
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
price_at_time_of_purchase DECIMAL(10,2) NOT NULL CHECK (price_at_time_of_purchase > 0),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (name, email) VALUES
('Bob', 'bobboy@gmail.com'),
('Alina', 'alinaaa@aaa.com'),
('John', 'john@abc.com');

INSERT INTO products (name, category, price, stock) VALUES
('Iphone', 'Electronics', 1200.00, 30),
('Macbook', 'Electronics', 2999.00, 25),
('Caffee Machine', 'Kitchen', 700.00, 15),
('Jeans', 'Clothing', 30.00, 50),
('Wardrobe', 'Bedroom', 1400.00, 22);

INSERT INTO orders (order_date, customer_id) VALUES
(CURRENT_DATE, 1), (CURRENT_DATE, 1), (CURRENT_DATE, 1),
(CURRENT_DATE, 2), (CURRENT_DATE, 2), (CURRENT_DATE, 2),
(CURRENT_DATE, 3), (CURRENT_DATE, 3), (CURRENT_DATE, 3),
(CURRENT_DATE, 1), (CURRENT_DATE, 2), (CURRENT_DATE, 3),
(CURRENT_DATE, 1), (CURRENT_DATE, 2), (CURRENT_DATE, 3);


INSERT INTO order_items (order_id, product_id, quantity, price_at_time_of_purchase) VALUES
(1, 1, 1, 1200.00), (1, 4, 2, 30.00),
(2, 2, 1, 2999.00), (2, 3, 1, 700.00),(2, 4, 1, 30.00),
(3, 5, 1, 1400.00), (3, 4, 3, 30.00),
(4, 1, 2, 1200.00), (4, 3, 1, 700.00),
(5, 2, 1, 2999.00), (5, 5, 1, 1400.00),
(6, 4, 2, 30.00), (6, 1, 1, 1200.00),
(7, 3, 1, 700.00), (7, 5, 1, 1400.00), (7, 4, 2, 30.00),
(8, 2, 1, 2999.00), (8, 1, 1, 1200.00), 
(9, 2, 1, 1400.00), (9, 3, 2, 700.00),
(10, 4, 3, 30.00), (10, 1, 1, 1200.00),
(11, 2, 1, 2999.00), (11, 3, 1, 1400.00),
(12, 3, 2, 700.00), (12, 4, 1, 30.00),
(13, 1, 1, 1200.00), (13, 3, 2, 1400.00),
(14, 4, 1, 30.00), (14, 3, 1, 700.00),
(15, 2, 1, 2999.00), (15, 1, 1, 1200.00), (15, 4, 1, 30.00);
