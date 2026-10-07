SELECT
    c.customer_name,
    SUM(o.sales) AS celkovy_predaj,
    AVG(o.discount) AS priemerna_zlava,
    COUNT(o.order_id) AS pocet_objednavok,
    
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY celkovy_predaj DESC;
--