-- ===============================================
-- E.g of checking the description of the tables and columns
-- ===============================================

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'staging_sellers' 


-- ===============================================
-- Checking duplicates in tables
-- ===============================================


-- staging_customers table
SELECT customer_unique_id, COUNT(*)
FROM staging_customers
GROUP BY customer_unique_id
HAVING COUNT(*) >1;

-- all customer_unique_id are returning 3 times, which means the data is messy and we have 3 duplicates

-- staging_geolocation table

SELECT geolocation_zip_code_prefix, COUNT(*)
from staging_geolocation
GROUP BY geolocation_zip_code_prefix
HAVING COUNT(*) > 1;

-- we have duplicates in geolocation_zip_code_prefix, which is expected since multiple cities can share the same zip code prefix

-- staging_orders_items table

SELECT order_id, COUNT(*)
FROM staging_order_items
GROUP BY order_id
HAVING COUNT(*) > 1;

-- we have duplicates in order_id behaving the same way as staging_customer tables, which can be an error in the source of the data

-- staging order_payments table

SELECT order_id, COUNT(*)
FROM staging_order_payments
GROUP BY order_id
HAVING COUNT(*) > 1;

-- there is also 3 duplicates per order_id , same behavior as the other tables

-- staging_order_reviews table

SELECT order_id, COUNT(*)
FROM staging_order_reviews
GROUP BY order_id
HAVING COUNT(*) > 1;

-- staging_orders table

SELECT order_id, COUNT(*)
FROM staging_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- staging_products table

SELECT product_id, COUNT(*)
FROM staging_products
GROUP BY product_id
HAVING COUNT(*) >= 1;

-- staging_sellers table

SELECT seller_id, COUNT(*)
FROM staging_sellers
GROUP BY seller_id
HAVING COUNT(*) >= 1;

SELECT product_category_name, COUNT(*)  
FROM staging_product_categories
GROUP BY product_category_name
HAVING COUNT(*) >= 1;

-- WE HAVE NO DUPLICATES IN:
-- staging_products
-- staging_sellers
-- staging_product_categories
-- ALL OTHER TABLES HAVE DUPLICATES, WHICH CAN BE AN ISSUE IN THE SOURCE OF THE DATA, AND WE SHOULD INVESTIGATE FURTHER TO UNDERSTAND WHY THIS IS HAPPENING AND HOW TO FIX IT.

-- ===============================================
-- Checking missing values (NULLs)
-- ===============================================

-- staging_customers table
SELECT COUNT(*)
FROM staging_customers
WHERE customer_zip_code_prefix IS NULL or customer_city IS NULL or customer_state IS NULL;  

-- staging_geolocation table
SELECT distinct(geolocation_zip_code_prefix), count(*)
FROM staging_geolocation
WHERE geolocation_lat is NULL or geolocation_lng is NULL or geolocation_city is NULL or geolocation_state is NULL
GROUP BY geolocation_zip_code_prefix
ORDER BY 2;


-- order_items_dataset table 
SELECT COUNT(1)
FROM staging_order_items
WHERE shipping_limit_date IS NULL or price IS NULL or freight_value IS NULL;

-- order_payments_dataset_table
SELECT COUNT(1)
FROM staging_order_payments
WHERE payment_type IS NULL or payment_installments IS NULL or payment_value IS NULL;

-- order_reviews_dataset 
SELECT COUNT(*) 
FROM staging_order_reviews
WHERE review_score IS NULL or review_comment_title IS NULL or review_comment_message IS NULL or review_creation_date IS NULL or review_answer_timestamp IS NULL;

-- There is a lot missing values in the order_reviews_dataset, which can be an issue for the analysis
--But is also important taking into consideration that reviews are optional in most ecommerce platforms

-- staging_orders table
SELECT COUNT(*)
FROM staging_orders
WHERE customer_id IS NULL;

-- staging products table
SELECT COUNT(*)
FROM staging_products
where product_category_name is NULL;

-- There is 610 column with missing values in the product_category_name column

-- staging_sellers table
SELECT COUNT(*)
FROM staging_sellers 
WHERE seller_id is null;

-- product_categories table
SELECT COUNT(*)
from staging_product_categories
WHERE product_category_name IS NULL;

--- Theres only 2 tables with missing values, which are:
--- staging_order_reviews
-- staging_products

