SELECT * 
FROM 
(
    SELECT product_category,
        SUM(total_amount) AS total_sales_per_category
    FROM flourmills_sales
    GROUP BY product_category
) AS sales_by_category
WHERE total_sales_per_category > 50000000
ORDER BY total_sales_per_category DESC;