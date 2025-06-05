
INSERT INTO fact_sales (product_id, store_id, date_id, quantity_sold, revenue)
SELECT 
    t.product_id,
    t.store_id,
    d.date_id,
    t.quantity,
    t.quantity * p.price AS revenue
FROM 
    transactions t
JOIN 
    products p ON t.product_id = p.product_id
JOIN 
    dim_date d ON t.transaction_date = d.full_date;
