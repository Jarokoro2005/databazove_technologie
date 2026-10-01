SELECT DISTINCT s.region
FROM flourmills_sales AS s
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS s2
    WHERE s2.region = s.region
      AND s2.product_category = 'Flour'
);