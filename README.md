# 📊 SQL Data Warehouse Project  
*A complete end‑to‑end data warehousing pipeline built using the Bronze–Silver–Gold architecture.*

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
├── tests/                        # Data quality checks & validation
│
├── README.md                     # Project overview (this file)
└── LICENSE                       # License information
```

---

## 🧩 Key Features

### 🔹 **1. End‑to‑End ETL Pipeline**
- Extracts raw CRM and ERP data  
- Cleans and standardises fields  
- Resolves duplicates and missing values  
- Integrates datasets into a unified model  

### 🔹 **2. Star Schema for Analytics**
Includes:

- **Fact tables** (e.g., sales, transactions)  
- **Dimension tables** (e.g., customers, products, dates)  
- Surrogate keys, conformed dimensions, and slowly changing attributes where appropriate  

### 🔹 **3. Data Catalog**
Every Gold‑layer field is documented with:

- Description  
- Data type  
- Source system  
- Business logic  

### 🔹 **4. Data Quality Testing**
Covers:

- Null checks  
- Referential integrity  
- Duplicate detection  
- Schema validation  

---

## 🛠️ Skills Demonstrated

### **Data Engineering**
- ETL/ELT pipeline design  
- Data modeling (Star Schema, Medallion Architecture)  
- Data integration across systems  

### **SQL**
- Joins, aggregations, window functions  
- Data cleaning and transformation  
- Analytical query design  

### **Documentation**
- Architecture diagrams  
- Data flow mapping  
- Data cataloging  
- Clear, professional repository structure  

---

## 🎯 Purpose of This Project  
This project was built to demonstrate my ability to:

- Work with real‑world messy datasets  
- Build structured, scalable data pipelines  
- Produce clean analytical models for business insights  
- Document a project to professional standards  

It reflects the type of work done in analytics engineering, BI development, and data analyst roles.

---

## 📬 Contact  
If you’d like to discuss this project or my work:

**LinkedIn:** *https://www.linkedin.com/in/jack-williams-b3b442160/*  
**Email:** *jw01672@gmail.com*
