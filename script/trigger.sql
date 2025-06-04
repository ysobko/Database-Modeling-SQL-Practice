DELIMITER //

CREATE TRIGGER reduce_stock_after_insert
BEFORE INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;
