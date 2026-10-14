WITH numbered_purchases AS (
    SELECT
        customer_id,
        invoice_no,
        invoice_date,
        stock_code,
        description,
        quantity,
        unit_price,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY invoice_date ASC
        ) AS row_num
    FROM retail_sales
    WHERE customer_id IS NOT NULL
)
SELECT
    customer_id,
    invoice_no,
    invoice_date,
    stock_code,
    description,
    quantity,
    unit_price
FROM numbered_purchases
WHERE row_num = 1
ORDER BY customer_id ASC;
