SELECT 
    c.customer_name,
    COUNT(o.order_id) AS pocet_objednavok
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;