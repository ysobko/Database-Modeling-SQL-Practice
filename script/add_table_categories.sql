CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
ALTER TABLE products
ADD COLUMN category_id INT NOT NULL;
INSERT INTO categories (name)
SELECT DISTINCT category FROM products;

UPDATE products p
JOIN categories c ON p.category = c.name
SET p.category_id = c.category_id;

ALTER TABLE products
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES categories(category_id)
ON DELETE CASCADE;
