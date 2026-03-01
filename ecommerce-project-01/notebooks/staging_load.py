### Loading CSVs for Staging ####

import pandas as pd 
from sqlalchemy import create_engine

### Connecting to PostgreSQL from Docker ###

engine = create_engine('postgresql+psycopg2://admin:admin@localhost:5432/olist_dw')

staging_files = {
    "staging_customers": "data/raw/olist_customers_dataset.csv",
    "staging_geolocation": "data/raw/olist_geolocation_dataset.csv",
    "staging_order_items": "data/raw/olist_order_items_dataset.csv",
    "staging_order_payments": "data/raw/olist_order_payments_dataset.csv",
    "staging_order_reviews": "data/raw/olist_order_reviews_dataset.csv",
    "staging_orders": "data/raw/olist_orders_dataset.csv",
    "staging_products": "data/raw/olist_products_dataset.csv",
    "staging_sellers": "data/raw/olist_sellers_dataset.csv",
    "staging_product_categories": "data/raw/product_category_name_translation.csv"
}

for table, file in staging_files.items():
    df = pd.read_csv(file)
    df.to_sql(table, engine, if_exists='append', index=False)
    print(f"{table} loaded with {len(df)} records.")