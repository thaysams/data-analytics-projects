# Ecommerce Data Analytics Project

A complete **ETL pipeline** for Brazilian e-commerce data (Olist dataset), from raw CSVs to staging tables, cleaning, and preparation for analysis or BI dashboards.

---

## 🛠 Tools & Technologies
- **Docker** - for database criation
- **Python 3.13** – for scripting ETL and data cleaning
- **Pandas** – for CSV ingestion and preprocessing
- **SQL / PostgreSQL** – for staging tables, deduplication, missing value handling, and cleaning
- **SQLAlchemy** – Python ORM for database interaction
- **Git & GitHub** – version control and project sharing

---

## 🗂 Project Structure

```text
notebooks/
├─ staging_load.py       # Load raw CSVs into staging tables
sql/                     # SQL scripts organized per table
├─ check_duplicates.sql
├─ check_missing.sql
├─ staging_tables.sql
└─ clean_tables.sql
data/
├─ raw/                  # Original CSV datasets
