WITH RECURSIVE monthly_revenue AS (
SELECT DATE_TRUNC('month', sale_date) AS month,
SUM(total_amount) AS revenue
FROM flourmills_sales
GROUP BY DATE_TRUNC('month', sale_date)
),
ordered_months AS (
SELECT ROW_NUMBER() OVER (ORDER BY month) AS rn,
month,
revenue
FROM monthly_revenue
),
cumulative_target AS (
SELECT rn,
month,
revenue,
revenue AS cumulative_revenue
FROM ordered_months
WHERE rn = 1
UNION ALL
SELECT om.rn,
om.month,
om.revenue,
ct.cumulative_revenue + om.revenue AS cumulative_revenue
FROM ordered_months om
JOIN cumulative_target ct ON om.rn = ct.rn + 1
WHERE ct.cumulative_revenue < 500000000
)
SELECT rn,
month,
revenue,
cumulative_revenue
FROM cumulative_target
ORDER BY rn;