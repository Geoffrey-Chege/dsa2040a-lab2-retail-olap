# DSA2040A Lab 2 – OLTP & OLAP Integration (XAMPP + phpMyAdmin)

## Overview
Design and implement a two-tier data architecture:
1. **OLTP**: A normalized transactional schema (`retail_oltp`) populated with sample data from Lab 1.
2. **OLAP**: A denormalized star schema (`retail_olap`) for analytical reporting.
3. **ETL Process**: Extract data from the OLTP schema, transform and calculate revenue, and load into the OLAP fact table.
4. **Analytics**: Run two OLAP queries (monthly sales trends and top selling products) and capture the results.

## Files in This Repository
- **`oltp_schema/create_tables.sql`**  
  DDL to create the normalized tables (`customers`, `products`, `stores`, `transactions`) in the `retail_oltp` database.

- **`sample_data/`**  

- **`olap_schema/create_dw_tables.sql`**  
  DDL to create the star‐schema tables (`dim_date`, `dim_product`, `dim_store`, `fact_sales`) in the `retail_olap` database.

- **`etl_scripts/etl_to_dw.sql`**  
  ETL script that extracts from `retail_oltp.transactions`, calculates revenue, and loads into `retail_olap.fact_sales`.

- **`queries/monthly_sales_trends.sql`**  
  OLAP query to display total revenue by month from `fact_sales`.

- **`queries/top_selling_products.sql`**  
  OLAP query to list the top 5 products by units sold.

- **`screenshots/`**  
  - `step1-create-oltp.png`  
  - `step2-load-oltp-data.png`  
  - `step3-create-olap.png`  
  - `step4-load-dimensions.png`  
  - `step5-etl-fact.png`  
  - `step8-queries.png`  

- **`README.md`**  
  This file.

---

## Reproduction Instructions

### 1. Install XAMPP for Windows
Download and install from https://www.apachefriends.org/download.html. Ensure **Apache** and **MySQL (MariaDB)** packages are included.

### 2. Start Services
Open the XAMPP Control Panel and click **Start** for both **Apache** and **MySQL**. Both should display “Running.”

### 3. Open phpMyAdmin
In your browser, navigate to `http://localhost/phpmyadmin/`.

---

### 4. Create & Populate OLTP Schema

1. **Create the `retail_oltp` Database**  
   - In phpMyAdmin, click **Databases**, enter `retail_oltp`, and click **Create**.

2. **Create OLTP Tables**  
   - Select `retail_oltp`, click **SQL**, and import the file `oltp_schema/oltp_schema.sql`.

   ![Creating OLTP Tables](Screenshots/Screenshot-(136)-Lab-2.1.png)
   ![Confirming OLTP Tables](Screenshots/Screenshot-(137)-Lab-2.2.png)

3. **Load Sample Data**  
   - Data is in the class pdf
   ![Loading the data](Screenshots/Screenshot-(138)-Lab-2.3.png)
   ![Confirming the data](Screenshots/Screenshot-(140)-Lab-2.4.png)

4. **Verify Tables**  
   - Use the **Browse** tab on each of `customers`, `products`, `stores`, and `transactions` to confirm 2 rows in each.

---

### 5. Create & Populate OLAP Schema

1. **Create the `retail_olap` Database**  
   - In phpMyAdmin, click **Databases**, enter `retail_olap`, and click **Create**.

2. **Create OLAP Tables**  
   - Select `retail_olap`, click **SQL**, and import `olap_schema/olap_schema.sql`.

   ![Creating OLAP Schema](Screenshots/Screenshot-(141)-Lab-2.5.png)
   ![Confirming OLAP Schema](Screenshots/Screenshot-(142)-Lab-2.6.png)

3. **Load Dimension Data**  
   - Data is from the work in Lab 1

4. **Verify Dimension Tables**  
   - Use **Browse** on `dim_product` (2 rows), `dim_store` (2 rows), and `dim_date` (2 rows).

---

### 6. Run ETL to Populate Fact Table

1. **Execute ETL Script**  
   - In phpMyAdmin (with `retail_olap` selected), click **SQL** and import `etl_scripts/etl.sql`.

   ![ETL into Fact Table](Screenshots/Screenshot-(145)-Lab-2.8.png)

2. **Verify Fact Table**  
   - Use **Browse** on `fact_sales` to confirm 2 rows with computed revenue values.

---

### 7. Execute OLAP Queries

1. **Monthly Sales Trends**  
   - With `retail_olap` selected, click **SQL** and import `queries/monthly_sales_trends.sql`.  
   - Capture the results

2. **Top Selling Products**  
   - Click **SQL** again, import `queries/top_selling_products.sql`.  
   - Capture the results

   ![OLAP Queries](Screenshots/Screenshot-(146)-Lab-2.9.png)
   ![OLAP Queries Monthly Sales](Screenshots/Screenshot-(146)-Lab-2.9.png)
   ![OLAP Queries Top Selling Products](Screenshots/Screenshot-(146)-Lab-2.9.png)

---

## Author
Geoffrey Chege Mwangi

---

## License
This project is licensed under the [MIT License](LICENSE).  
See the [LICENSE](LICENSE) file for details.
