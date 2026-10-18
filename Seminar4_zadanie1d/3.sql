WITH customer_total_sales AS (
    SELECT 
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
),
quartile_ranking AS (
    SELECT 
        customer_name,
        total_sales,
        NTILE(4) OVER (ORDER BY total_sales DESC) AS quartile
    FROM customer_total_sales
)
SELECT 
    customer_name,
    total_sales,
    quartile
FROM quartile_ranking
WHERE customer_name LIKE '%Customer_26%'
   OR customer_name = 'Customer_26';