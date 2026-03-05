-- ========================================================================================================
-- Removing duplicates from the tables mapped in the data_validation.sql file ans inserting into a new table 
-- ==========================================================================================================

-- WE HAVE NO DUPLICATES IN:
-- staging_customers
-- staging_orders    
-- staging_products
-- staging_sellers
-- staging_product_categories


WITH duplicates AS (
    SELECT seller_id,
           ROW_NUMBER() OVER (
               PARTITION BY seller_id
               ORDER BY seller_id
           ) AS rn
    FROM staging_sellers
) 
DELETE FROM staging_sellers s
USING duplicates d
WHERE s.seller_id = d.seller_id
AND d.rn > 1;

