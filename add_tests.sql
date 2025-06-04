Додала тести для перевірки коду.
Також кейси де quantity = 0, product_id неіснуючий, negative price, щоб виводило помилки.

INSERT INTO customers (name, email) VALUES
('Anna', 'annaaa@abc.com');
SELECT c.customer_id, c.name FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

INSERT INTO categories (name) VALUES ('Sports'), ('Books'), ('Toys'), ('Health');

INSERT INTO products (name, category, price, stock, category_id) VALUES
('Basketball', 'Sports', 50.00, 20, (SELECT category_id FROM categories WHERE name = 'Sports' LIMIT 1));
SELECT p.product_id, p.name, p.stock - COALESCE(SUM(oi.quantity), 0) AS stock_left
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name, p.stock;

INSERT INTO order_items (order_id, product_id, quantity, price_at_time_of_purchase) VALUES
(16, 1, 1, 1000.00);
INSERT INTO order_items (order_id, product_id, quantity, price_at_time_of_purchase) VALUES
(17, 2, 1, 2999.00),  (17, 2, 1, 2799.00);
INSERT INTO order_items (order_id, product_id, quantity, price_at_time_of_purchase) VALUES
(1, 1, 0, 1200.00);
INSERT INTO order_items (order_id, product_id, quantity, price_at_time_of_purchase) VALUES
(1, 999, 1, 100.00);
INSERT INTO products (name, category, price, stock, category_id) VALUES
('Teddy', 'Toys', -10.00, 10, (SELECT category_id FROM categories WHERE name = 'Toys' LIMIT 1));

DELETE FROM orders WHERE order_id = 1;
SELECT * FROM order_items WHERE order_id = 1;
