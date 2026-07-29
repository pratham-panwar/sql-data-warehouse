# SQL Data Warehouse Project

A modern **SQL Server Data Warehouse** built using the **Medallion Architecture (Bronze, Silver, Gold)** to transform raw CRM and ERP data into analytics-ready datasets.

The project demonstrates industry-standard data warehousing concepts including ETL pipelines, data cleansing, dimensional modeling, and Star Schema design using **T-SQL**.

---

## Architecture

The warehouse follows a three-layer Medallion Architecture:

```
          Source Systems
        (CRM & ERP Data)
                │
                ▼
        ┌────────────────┐
        │     Bronze     │
        │   Raw Data     │
        └────────────────┘
                │
                ▼
        ┌────────────────┐
        │     Silver     │
        │ Cleaned Data   │
        └────────────────┘
                │
                ▼
        ┌────────────────┐
        │      Gold      │
        │ Business Views │
        └────────────────┘
                │
                ▼
       Reporting & Analytics
```

---

## Project Structure

```text
sql-data-warehouse/
│
├── datasets/
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   │
│   └── source_erp/
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
│
├── docs/
│   ├── data_architecture.png
│   ├── data_flow.png
│   ├── data_layers.png
│   ├── data_model.png
│   └── naming_conventions.md
│
├── scripts/
│   ├── 01_init_database.sql
│   │
│   ├── bronze/
│   │   ├── 01_ddl_bronze.sql
│   │   ├── 02_proc_load_bronze.sql
│   │   └── 03_load_bronze.sql
│   │
│   ├── silver/
│   │   ├── 01_ddl_silver.sql
│   │   ├── 02_proc_load_silver.sql
│   │   └── 03_load_silver.sql
│   │
│   └── gold/
│       └── 01_ddl_gold.sql
│
├── tests/
│   ├── quality_checks_silver.sql
│   └── quality_checks_gold.sql
│
├── .gitignore
└── README.md
```

---

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Git
- GitHub

---

## Data Warehouse Layers

### Bronze Layer

The Bronze layer stores raw data exactly as received from the source systems.

- Loads CRM and ERP datasets
- Preserves source data
- Supports auditing and reprocessing

---

### Silver Layer

The Silver layer transforms and cleans the raw data.

Transformations include:

- Data cleansing
- Standardizing values
- Removing duplicates
- Handling missing values
- Applying business rules
- Preparing clean datasets for analytics

---

### Gold Layer

The Gold layer exposes business-ready views following a **Star Schema**.

### Dimension Views

- `gold.dim_customers`
- `gold.dim_products`

### Fact View

- `gold.fact_sales`

The Gold layer includes:

- Surrogate key generation using `ROW_NUMBER()`
- Customer enrichment from CRM and ERP sources
- Product categorization
- Analytics-ready sales fact view

---

## ETL Workflow

```
CRM + ERP Source Files
          │
          ▼
 Bronze Stored Procedures
          │
          ▼
 Bronze Tables
          │
          ▼
 Silver Stored Procedures
          │
          ▼
 Silver Tables
          │
          ▼
 Gold Views
          │
          ▼
 Business Analytics
```

---

## Features

- Medallion Architecture
- Layered ETL pipeline
- Modular SQL scripts
- Stored Procedures for data loading
- Star Schema implementation
- Dimension and Fact views
- Surrogate key generation
- Data transformation using T-SQL
- Version controlled with Git

---

## Getting Started

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

### Clone the Repository

```bash
git clone https://github.com/pratham-panwar/sql-data-warehouse.git
```

### Execute the Scripts

Run the SQL scripts in the following order:

```
1. scripts/01_init_database.sql

2. scripts/bronze/
   - 01_ddl_bronze.sql
   - 02_proc_load_bronze.sql
   - 03_load_bronze.sql

3. scripts/silver/
   - 01_ddl_silver.sql
   - 02_proc_load_silver.sql
   - 03_load_silver.sql

4. scripts/gold/
   - 01_ddl_gold.sql
```

> **Note:** Execute the scripts in ascending numerical order.

---

## Documentation

The `docs/` directory contains supporting documentation and project diagrams:

| File | Description |
|------|-------------|
| `data_architecture.png` | High-level architecture of the data warehouse |
| `data_flow.png` | End-to-end ETL data flow |
| `data_layers.png` | Medallion Architecture (Bronze, Silver, Gold) |
| `data_model.png` | Star Schema data model |
| `naming_conventions.md` | SQL naming standards used throughout the project |

---

## Skills Demonstrated

- Data Warehousing
- ETL Pipeline Development
- Microsoft SQL Server
- T-SQL
- Stored Procedures
- Views
- Window Functions
- Data Cleansing
- Data Transformation
- Dimensional Modeling
- Star Schema Design
- Git & GitHub

---

## Future Enhancements

- Incremental data loading
- Slowly Changing Dimensions (SCD)
- Automated SQL Agent scheduling
- Performance optimization with indexing
- Data quality reporting
- Power BI dashboards

---

## Author

**Pratham Panwar**

Aspiring Data Engineer passionate about SQL, Data Warehousing, ETL pipelines, and Analytics Engineering.

---
