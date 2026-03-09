# 📊 SQL Data Warehouse Project  

*A complete end‑to‑end data warehousing pipeline built using the Bronze–Silver–Gold architecture.*

*This project is part of Baraa Khatib Salkini's course The Complete SQL Bootcamp (30 hours): Go from Zero to Hero.*

## ⭐ Overview  
This project demonstrates my ability to design, build, and document a full data‑warehouse solution — from raw data ingestion to analytical data models. It showcases practical skills in:

- Data modeling (Star Schema)
- ETL/ELT pipeline development
- Data cleaning and transformation
- Data integration across multiple source systems (CRM + ERP)
- Documentation and data cataloging
- SQL‑based analytics and reporting

This repository is structured and documented as if it were part of a professional analytics engineering workflow.

---

## 🏗️ Architecture Summary  
The project follows the **Medallion Architecture**:

| Layer | Purpose |
|-------|---------|
| **Bronze** | Raw ingestion of CRM & ERP datasets exactly as received |
| **Silver** | Cleaning, standardization, deduplication, and integration |
| **Gold** | Star schema for analytics (facts & dimensions) |

---

## 📁 Repository Structure

```
sql-data-warehouse-project/
│
├── datasets/                     # Raw CRM & ERP CSV files
│
├── docs/                         # Project documentation & architecture
│   ├── ETL/                      # ETL techniques & transformation logic
│   ├── data_architecture/        # High-level architecture diagrams
│   ├── data_catalog/             # Gold layer metadata & field definitions
│   ├── data_flow/                # Data flow documentation
│   ├── data_integration/         # CRM + ERP integration mapping
│   └── data_model/               # Star schema design
│
├── scripts/                      # ETL pipeline scripts
│   ├── bronze/                   # Raw ingestion scripts
│   ├── silver/                   # Cleaning & transformation scripts
│   └── gold/                     # Analytical model creation
│
├── tests/                       
