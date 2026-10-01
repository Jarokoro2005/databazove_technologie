SELECT DISTINCT s.product_category
FROM flourmills_sales AS s
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS s2
    WHERE s2.product_category = s.product_category
    GROUP BY s2.product_category
    HAVING COUNT(DISTINCT s2.region) > 3
);