WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.customer_name,
        o.order_date,
        MAX(o.order_date) OVER (PARTITION BY c.customer_id) AS last_order_date,
        MAX(o.order_date) OVER () AS latest_order_date
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
),
distinct_customer_last_order AS (
    SELECT DISTINCT
        customer_id,
        customer_name,
        last_order_date,
        latest_order_date
    FROM customer_orders
)
SELECT
    customer_id,
    customer_name,
    last_order_date
FROM distinct_customer_last_order
WHERE last_order_date < latest_order_date - INTERVAL '90 days'
ORDER BY last_order_date ASC;
