
-- Monthly Sales Trends
SELECT d.month, SUM(fs.revenue) AS total_revenue
FROM fact_sales fs
JOIN dim_date d ON fs.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

-- Top Selling Products
SELECT dp.name, SUM(fs.quantity_sold) AS total_units
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.name
ORDER BY total_units DESC
LIMIT 5;
