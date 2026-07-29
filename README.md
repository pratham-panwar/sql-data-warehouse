# SQL Data Warehouse Project

## Overview

This project demonstrates the design and implementation of a modern **Data Warehouse** using **Microsoft SQL Server**. It follows the **Medallion Architecture** (Bronze, Silver, and Gold layers) to transform raw operational data into clean, business-ready analytical datasets.

The project showcases industry best practices in data engineering, including data ingestion, cleansing, transformation, dimensional modeling, and the creation of analytical views using a Star Schema.

---

## Architecture

The data warehouse is organized into three logical layers:

### Bronze Layer (Raw Data)

* Stores raw data exactly as received from source systems.
* Serves as the landing zone for ingestion.
* Preserves the original data for auditing and reprocessing.

### Silver Layer (Cleaned Data)

* Cleanses and standardizes raw data.
* Removes duplicates.
* Handles missing or inconsistent values.
* Applies business rules and data quality checks.

### Gold Layer (Business Layer)

* Presents analytics-ready data.
* Implements dimensional modeling.
* Contains fact and dimension views following a Star Schema.
* Optimized for reporting and business intelligence tools.

---

## Project Structure

```text
SQL-Data-Warehouse/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── scripts/
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   └── load_silver.sql
│   │
│   ├── gold/
│   │   ├── dim_customers.sql
│   │   ├── dim_products.sql
│   │   └── fact_sales.sql
│   │
│   └── tests/
│
├── docs/
│   ├── architecture.png
│   ├── erd.png
│   └── data_flow.png
│
└── README.md
```

---

## Technologies Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL
* Git
* GitHub

---

## Data Warehouse Workflow

```
Source Systems
      │
      ▼
 Bronze Layer
      │
      ▼
 Silver Layer
      │
      ▼
 Gold Layer
      │
      ▼
 Reporting & Analytics
```

---

## Data Modeling

The Gold layer follows a **Star Schema** consisting of:

### Dimension Tables

* Dim Customers
* Dim Products

### Fact Table

* Fact Sales

This design minimizes joins, improves query performance, and simplifies analytical reporting.

---

## ETL Process

### 1. Extract

* Load raw CRM and ERP datasets into the Bronze layer.

### 2. Transform

* Standardize formats.
* Remove duplicates.
* Handle null values.
* Apply business rules.
* Generate surrogate keys where appropriate.

### 3. Load

* Populate dimension views.
* Build fact views.
* Prepare analytics-ready datasets.

---

## Key Features

* Layered Medallion Architecture
* Data quality validation
* Modular SQL scripts
* Reusable views
* Dimensional modeling
* Star Schema implementation
* Surrogate key generation
* Git version control
* Well-organized project structure

---

## Getting Started

### Prerequisites

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* Git

### Clone the Repository

```bash
git clone https://github.com/<your-username>/<repository-name>.git
```

### Open the Project

1. Open SSMS.
2. Connect to your SQL Server instance.
3. Execute the scripts in the following order:

```
1. Bronze DDL
2. Bronze Load

3. Silver DDL
4. Silver Load

5. Gold Views
```

---

## Learning Objectives

This project demonstrates practical knowledge of:

* Data Warehouse Design
* ETL Pipelines
* Medallion Architecture
* Data Cleansing
* T-SQL Development
* Views
* Stored Procedures
* Window Functions
* Dimensional Modeling
* Star Schema Design
* Git Workflow

---

## Future Improvements

* Incremental data loading
* Slowly Changing Dimensions (SCD)
* Index optimization
* SQL Agent scheduling
* Data quality dashboards
* Automated testing
* CI/CD pipeline integration

---

## Repository

```text
scripts/
datasets/
docs/
README.md
```

---

## Author

**Pratham Panwar**

Aspiring Data Engineer with an interest in SQL, Data Warehousing, ETL pipelines, and Analytics Engineering.
