WITH RECURSIVE date_bounds AS (
SELECT MIN(sale_date) AS min_date,
MAX(sale_date) AS max_date
FROM flourmills_sales
),
date_sequence AS (
SELECT min_date AS sale_date
FROM date_bounds
UNION ALL
SELECT (sale_date + INTERVAL '1 day')::DATE
FROM date_sequence
WHERE sale_date < (SELECT max_date FROM date_bounds)
)
SELECT sale_date
FROM date_sequence
ORDER BY sale_date ASC;