CREATE INDEX idx_orders_customer_id ON orders(customer_id);

/*Zobrazenie*/
SELECT *
FROM orders
WHERE customer_id = 'C001';
