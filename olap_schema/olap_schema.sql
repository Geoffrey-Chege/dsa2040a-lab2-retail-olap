
-- dim_date
CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

-- dim_product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50)
);

-- dim_store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50)
);

-- fact_sales
CREATE TABLE fact_sales (
    product_id INT,
    store_id INT,
    date_id INT,
    quantity_sold INT,
    revenue DECIMAL(10,2)
);
