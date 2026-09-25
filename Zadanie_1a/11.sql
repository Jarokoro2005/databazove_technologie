SELECT 
    c.region,
    SUM(o.sales) AS celkova_hodnota_predaja,
    AVG(o.discount) AS priemerna_zlava,
    COUNT(o.order_id) AS pocet_objednavok
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region;