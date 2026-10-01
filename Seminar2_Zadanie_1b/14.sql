SELECT DISTINCT s.product_category
FROM flourmills_sales AS s
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS s2
    WHERE s2.product_category = s.product_category
      AND s2.total_amount > 500000
);