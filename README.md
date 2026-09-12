# SQL Data Warehouse & Analytics Project

An end-to-end data warehouse built from scratch in SQL Server, covering the full path from raw CSV extracts to business-ready analytics. I designed the layers, wrote the ETL, resolved the data quality issues, modelled the star schema, and built the analytical queries on top of it.

---

## Data Architecture

The warehouse follows the **Medallion Architecture** — Bronze, Silver and Gold layers, each with a clearly defined responsibility.

| Layer | Purpose | What I did |
|---|---|---|
| **Bronze** | Raw landing zone | Ingested CSV files from two source systems into SQL Server with no transformation, so the data stays auditable against the source |
| **Silver** | Cleansed and standardised | Handled duplicates, missing values, invalid records, type casting and normalisation of source codes into analysis-friendly values |
| **Gold** | Business-ready | Modelled the data into a star schema (fact and dimension tables) built for reporting and analytical querying |

Data moves between layers through a controlled ETL process: extract-and-load into Bronze, full ETL into Silver, transform-and-load into Gold.

---

## Part 1 — Building the Warehouse (Data Engineering)

**Objective:** consolidate sales data from two separate systems into a single warehouse that supports analytical reporting.

**What the build covers**

- **Sources** — ERP and CRM systems, delivered as CSV files
- **Data quality** — profiling and cleansing carried out before anything reaches the Silver layer; quality issues are fixed at source-of-truth level, not patched in reports
- **Integration** — both systems merged into one coherent data model, with keys reconciled across sources
- **Load strategy** — full extraction, batch processing, truncate-and-insert full loads
- **Historisation** — SCD Type 1 (overwrite). The warehouse reflects the latest state of the data; historical tracking is out of scope
- **Documentation** — the data model is documented so both business stakeholders and analysts can work with it without needing to read the SQL

---

## Part 2 — Analytics & Reporting (Data Analysis)

SQL-based analysis built on the Gold layer, answering questions across three areas:

- **Customer behaviour** — segmentation, retention and purchasing patterns
- **Product performance** — revenue contribution, best and worst performers
- **Sales trends** — movement over time and across categories

The output is a set of reusable analytical queries that surface the metrics stakeholders actually make decisions on.

---

## Repository Structure

```
datasets/        Raw ERP and CRM CSV files
scripts/
  bronze/        DDL and load scripts for the raw layer
  silver/        Cleansing and transformation logic
  gold/          Star schema views and dimension/fact builds
  analytics/     Business analysis queries
docs/            Data model documentation, data catalog, diagrams
tests/           Data quality checks
```

---

## Tools Used

- **SQL Server** — warehouse database engine
- **SQL Server Management Studio (SSMS)** — development and querying
- **Draw.io** — architecture diagrams and data flow documentation
- **Git / GitHub** — version control

---

## Acknowledgements

This project was built following the SQL Data Warehouse course by Data With Baraa. The architecture and requirements come from that course; the implementation, the SQL, the troubleshooting and the documentation in this repository are my own work.

---

## License

Released under the MIT License — free to use, modify and share with attribution.

---

## About Me

I'm **Ahmad Sarosh**, an IT professional currently looking for roles in Data Analytics, Data Engineering and Software Engineering.

Feel free to get in touch — **ahmadsarosh07@gmail.com**
