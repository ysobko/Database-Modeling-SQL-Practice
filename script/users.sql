CREATE USER 'store_manager'@'localhost' IDENTIFIED BY 'secure_password';
CREATE USER 'sales_clerk'@'localhost' IDENTIFIED BY 'secure_password';
CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'secure_password';

GRANT ALL PRIVILEGES ON ERD.* TO 'store_manager'@'localhost';
GRANT SELECT ON ERD.products TO 'sales_clerk'@'localhost';
GRANT SELECT, INSERT ON ERD.orders TO 'sales_clerk'@'localhost';
GRANT SELECT, INSERT ON ERD.order_items TO 'sales_clerk'@'localhost';
GRANT SELECT ON ERD.* TO 'analyst'@'localhost';
