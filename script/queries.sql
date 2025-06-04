SELECT 
    o.order_id,
    c.name AS customer_name,
    SUM(oi.quantity * oi.price_at_time_of_purchase) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.name
ORDER BY o.order_id;

SELECT 
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC
LIMIT 1;

SELECT
    p.product_id,
    p.name,
    p.stock - COALESCE(SUM(oi.quantity), 0) AS stock_left
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name, p.stock;

SELECT 
    c.customer_id,
    c.name,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
