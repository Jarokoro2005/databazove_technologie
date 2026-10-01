SELECT
    s.product_name,
    s.region,
    s.total_amount,
    (
        SELECT MIN(s2.total_amount)
        FROM flourmills_sales AS s2
        WHERE s2.region = s.region
    ) AS region_min_amount
FROM flourmills_sales AS s;