# SQL Data Warehouse Project | End-to-End ETL Pipeline using SQL Server

## Overview

This project demonstrates the design and implementation of a modern **SQL Server Data Warehouse** using the **Medallion Architecture (Bronze → Silver → Gold)**.

The solution ingests raw data from multiple source systems (**CRM** and **ERP**) stored as CSV files, loads the data into a Bronze layer, performs cleansing and business transformations in the Silver layer, and finally creates a business-ready **Star Schema** in the Gold layer for reporting and analytics.

The project follows industry-standard ETL and Data Warehousing practices, including layered architecture, reusable stored procedures, data validation, dimensional modeling, and analytical views.

---

# Architecture

### Medallion Architecture

```
                  +------------------+
                  |   Source Files   |
                  |   CRM / ERP CSV  |
                  +--------+---------+
                           |
                           ▼
                    Bronze Layer
                  (Raw Data Storage)
                           |
                           ▼
                    Silver Layer
             (Data Cleaning & Transformation)
                           |
                           ▼
                     Gold Layer
            (Star Schema & Business Views)
                           |
                           ▼
                Analytics / Power BI / BI Tools
```

---

# Data Sources

The warehouse integrates data from two operational systems.

## CRM (Customer Relationship Management)

* Customer Information
* Product Information
* Sales Transactions

## ERP (Enterprise Resource Planning)

* Customer Information
* Customer Location
* Product Categories

---

# Data Ingestion Diagram

> *(Insert your CRM → ERP relationship diagram here)*

---

# Data Flow Diagram

> *(Insert your Bronze → Silver → Gold pipeline diagram here)*

---

# Project Structure

```
SQL-Data-Warehouse
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── scripts/
│   ├── Database Initialization
│   ├── Bronze Layer
│   ├── Silver Layer
│   └── Gold Layer
│
└── README.md
```

---

# Medallion Architecture

## Bronze Layer (Raw Data)

The Bronze layer stores raw data exactly as received from the source systems.

### Source

CSV Files

### Tables

* crm_cust_info
* crm_prd_info
* crm_sales_details
* erp_cust_az12
* erp_loc_a101
* erp_px_cat_g1v2

### Loading Process

* BULK INSERT
* Full Load
* TRUNCATE TABLE before loading
* Stored Procedure
* Execution Time Logging
* TRY...CATCH Error Handling

Stored Procedure

```sql
bronze.load_bronze
```

---

## Silver Layer (Data Cleansing & Transformation)

The Silver layer transforms raw data into clean, standardized, and validated datasets.

### Transformations Performed

### Customer Data

* Removed duplicate customers
* Kept the latest customer record using ROW_NUMBER()
* Removed NULL customer IDs
* Trimmed leading and trailing spaces
* Standardized gender values
* Standardized marital status values

### Product Data

* Extracted Category IDs
* Parsed Product Keys
* Replaced NULL product costs
* Standardized Product Line values
* Calculated Product End Dates using LEAD()

### Sales Data

* Converted integer dates to DATE
* Corrected invalid sales amounts
* Derived missing prices
* Handled invalid and missing dates

### ERP Data

* Removed unnecessary prefixes
* Standardized country names
* Standardized gender values
* Removed future birth dates

### Additional Features

* Data Quality Validation
* Default Warehouse Load Timestamp
* Business Rule Transformations

Stored Procedure

```sql
silver.load_silver
```

---

## Gold Layer (Business Model)

The Gold layer exposes business-ready analytical datasets using a **Star Schema**.

Instead of physical tables, analytical **Views** are created.

### Dimension Views

### dim_customers

Contains

* Surrogate Key
* Customer Information
* Country
* Gender
* Birth Date
* Marital Status

### dim_products

Contains

* Surrogate Key
* Product Information
* Category
* Subcategory
* Product Line
* Product Cost

### Fact View

### fact_sales

Contains

* Customer Key
* Product Key
* Order Date
* Shipping Date
* Due Date
* Sales Amount
* Quantity
* Price

The fact view joins both dimensions using surrogate keys to create a business-ready analytical model.

---

# ETL Pipeline

```
CSV Files
     │
     ▼
Bronze Layer
(Raw Tables)
     │
     ▼
Silver Layer
(Cleaned & Standardized Tables)
     │
     ▼
Gold Layer
(Dimension & Fact Views)
     │
     ▼
Business Intelligence
Dashboards
Analytics
```

---

# SQL Concepts Used

* SQL Server
* T-SQL
* Schemas
* Stored Procedures
* BULK INSERT
* TRY...CATCH
* Window Functions
* ROW_NUMBER()
* LEAD()
* CASE
* COALESCE()
* ISNULL()
* NULLIF()
* CAST()
* TRIM()
* LEFT JOIN
* Views
* Star Schema
* Surrogate Keys
* Data Validation
* Data Cleansing
* ETL Design

---

# Features

* Layered Medallion Architecture
* Automated ETL using Stored Procedures
* Data Quality Checks
* Duplicate Removal
* Standardized Business Values
* Business Rule Transformations
* Error Handling
* Execution Time Logging
* Analytical Star Schema
* Reusable SQL Scripts

---

# Repository Workflow

```
CRM CSV Files
ERP CSV Files
        │
        ▼
bronze.load_bronze
        │
        ▼
Bronze Tables
        │
        ▼
silver.load_silver
        │
        ▼
Silver Tables
        │
        ▼
Gold Views
        │
        ▼
Analytics & Reporting
```

---

# Learning Outcomes

Through this project, I gained hands-on experience in:

* Designing a SQL Server Data Warehouse
* Building end-to-end ETL pipelines
* Implementing Medallion Architecture
* Loading data using BULK INSERT
* Writing reusable Stored Procedures
* Applying Window Functions
* Data Cleansing and Standardization
* Data Validation
* Dimensional Modeling
* Star Schema Design
* Creating Business-ready Views

---

# Future Improvements

* Incremental Loading
* Slowly Changing Dimensions (SCD Type 2)
* Change Data Capture (CDC)
* SQL Server Agent Scheduling
* Azure Data Factory Integration
* Power BI Dashboard
* Data Quality Monitoring
* Logging and Audit Tables

---

# Author

**Yousaf Umer**

Aspiring Data Engineer passionate about Data Warehousing, ETL Development, SQL Server, Python, and Cloud Data Engineering.
