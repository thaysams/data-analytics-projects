--- CREATING STAGING CUSTOMERS TABLE ---

--DROP TABLE IF EXISTS staging_products;

CREATE TABLE IF NOT EXISTS staging_customers (
    customer_id VARCHAR (100),
    customer_unique_id VARCHAR (100),
    customer_zip_code_prefix INT,
    customer_city VARCHAR (50),
    customer_state VARCHAR (50)
);

--- CREATING STAGING GEOLOCATION TABLE ---

CREATE TABLE IF NOT EXISTS staging_geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat VARCHAR(100),
    geolocation_lng VARCHAR(100),
    geolocation_city VARCHAR(50),
    geolocation_state VARCHAR(50)
);

--- CREATING STAGING ORDERS TABLE ---
CREATE TABLE IF NOT EXISTS staging_orders_items (
    order_id VARCHAR(100),
    order_item_id INT,
    product_id VARCHAR(100),
    seller_id VARCHAR(100),
    shipping_limit_date TIMESTAMP,
    price FLOAT, 
    freight_value FLOAT
);

--- CREATING STAGING ORDER PAYMENTS TABLE ---

CREATE TABLE IF NOT EXISTS staging_order_payments (
    order_id VARCHAR (100),
    payment_sequential INT,
    payment_type VARCHAR (50),
    payment_installments INT,
    payment_value FLOAT
);

--- CREATING STAGING ORDER REVIEWS TABLE ---

CREATE TABLE IF NOT EXISTS staging_order_reviews (
    review_id VARCHAR(100),
    order_id VARCHAR(100),
    review_score INT,
    review_comment_title VARCHAR(100),
    review_comment_message VARCHAR(500),
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);


--- CREATING STAGING TABLE ORDERS ---

CREATE TABLE IF NOT EXISTS staging_orders (
    order_id VARCHAR (100),
    customer_id VARCHAR (100),
    order_status VARCHAR (50),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

--- CREATING STAGING PRODUCTS TABLE ---


CREATE TABLE IF NOT EXISTS staging_products (
    product_id VARCHAR (100),
    product_category_name VARCHAR (100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

--- CREATING STAGING SELLERS TABLE ---

CREATE TABLE IF NOT EXISTS staging_sellers (
    seller_id VARCHAR (100),
    seller_zip_code_prefix INT,
    seller_city VARCHAR (50),
    seller_state VARCHAR (50)
);  

--- CREATING STAGING PRODUCT CATEGORIES TABLE ---

CREATE TABLE IF NOT EXISTS staging_product_categories (
    product_category_name VARCHAR (100),
    product_category_name_english VARCHAR (100)
);


