# 🚀 End-to-End Azure Data Engineering Pipeline (On-Prem to Cloud)

## 📌 Project Overview
This project demonstrates a complete **end-to-end data engineering pipeline** built using Azure services and Databricks.

The pipeline ingests data from an **on-premise MySQL database**, processes it through a **medallion architecture (Bronze, Silver, Gold)**, and serves it for analytics.

Key highlights:
- 🔌 On-Prem → Azure using Self-Hosted Integration Runtime
- ⚙️ Metadata-driven pipelines using Azure Data Factory
- 🔄 Incremental data loading using watermarking
- 🧱 Medallion architecture using Delta Lake
- 📊 Star schema modeling for analytics

---

## 🏗️ Architecture Overview

**Flow:**
On-Prem MySQL → SHIR → ADF → ADLS (Bronze) → Databricks (Silver & Gold) → Power BI

---

## ⚙️ Tech Stack

- **Azure Data Factory (ADF)** – Orchestration & ingestion
- **Self-Hosted Integration Runtime (SHIR)** – On-prem connectivity
- **Azure Data Lake Storage Gen2 (ADLS)** – Data storage
- **Azure Databricks** – Data processing (PySpark)
- **Delta Lake** – Storage format
- **Azure SQL Database** – Metadata & watermark tracking
- **Power BI** – Reporting layer

---

## 📂 Project Structure

├── adf/
│ ├── pipelines/ # ADF pipelines (metadata-driven ingestion)
│ ├── datasets/ # Source & sink datasets
│ └── linked_services/ # SHIR, ADLS, SQL connections
│
├── databricks/
│ 
│ ├── silver_notebook.ipynb/ # Transformation notebooks (metadata-driven)
│ ├── gold_notebook.ipynb/ # Star schema & final modeling
|
│
├── metadata/
│ ├── watermark_metadata.sql # Tracks incremental loads
│ └── metadata_silver_config.sql # Transformation rules config
│
├── data/
│ ├── bronzelayer/ # Raw data (partitioned by date)
│ ├── silverlayer/ # Cleaned & transformed data
│ └── goldlayer/ # Analytics-ready tables
│
├── architecture/
│ └── architecture.png # Architecture diagram
│
└── README.md


---

## 🥉 Bronze Layer (Raw Data)

- Stores raw ingested data from source systems
- Data is:
  - Append-only
  - Partitioned by date (`yyyy-MM-dd`)
  - Stored in original format (CSV/Delta)

📌 Example Path:
/bronze/ecommerce_db/customers/2026-07-23/*.csv


---

## 🥈 Silver Layer (Cleaned & Transformed)

- Data cleansing and transformation applied
- Handles:
  - Null checks
  - Deduplication
  - Data type conversions
  - Standardization

- Driven by metadata (`metadata_silver_config`)

📌 Example transformations:
- Convert names to lowercase
- Validate phone numbers
- Generate new columns (e.g., full_name)

---

## 🥇 Gold Layer (Business Layer)

- Data modeled into **Star Schema**
- Includes:
  - Fact tables (e.g., orders, order_items)
  - Dimension tables (customers, products)
  - SCD Type 1 & Type 2

- Optimized for analytics & BI tools

---

## 🔄 Incremental Data Loading

Implemented using **watermarking strategy**:

- Watermark table: `watermark_metadata`
- Tracks last processed timestamp per table
- Only new/updated records are processed

### Techniques used:
- Filtering based on watermark column
- `left_anti` joins to identify new records
- Merge logic for updates

---

## 🧠 Metadata-Driven Approach

Instead of hardcoding logic:

- Transformation rules stored in metadata table:
  - `metadata_silver_config`
- Pipeline dynamically:
  - Reads config
  - Applies transformations
  - Processes multiple tables

📌 Benefits:
- Reusable pipelines
- Easy to scale
- Minimal code changes

---

## 🔐 Security & Configuration

- Secrets stored in **Azure Key Vault**
- Access via Databricks secret scope
- Role-based access control (RBAC)

---

## 📊 Data Consumption

- Final data served via:
  - Power BI dashboards
  - SQL Analytics

---

## 🚀 How to Run the Project

1. Setup Self-Hosted Integration Runtime
2. Configure ADF linked services
3. Create metadata tables in Azure SQL
4. Run ADF pipeline for ingestion
5. Execute Databricks notebooks:
   - Bronze → Silver → Gold
6. Connect Power BI to Gold layer

---

## 📈 Key Learnings

- Building scalable pipelines using metadata
- Implementing incremental loads efficiently
- Designing medallion architecture
- Handling real-world data quality issues
- End-to-end orchestration in Azure ecosystem

---

## 🔗 GitHub Repository

👉 Add your repo link here:
[https://github.com//ecommerce-onprem-pipeline](https://github.com/kalyanv-dev/azure-end-to-end-ecommerce-data-pipeline)

---
