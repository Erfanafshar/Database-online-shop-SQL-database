# E-Commerce SQL Database

This project implements a relational database system for a simplified e-commerce platform. The system models users, products, orders, and suppliers, with full support for data entry and analytical queries. SQL scripts define the schema, insert test data, and generate reports. A Python script is used to access and query the database programmatically.

## Implemented Features

- **Schema Definition**:  
  The database schema includes the following entities:
  - `Users`: Stores personal information, national ID, contact number, and address.
  - `Products`: Includes product ID, name, available inventory, purchase price, sale price, and associated supplier.
  - `Invoices`: Represents purchase transactions, including invoice ID, user ID, and transaction date.
  - `InvoiceItems`: Line items per invoice, with product ID, quantity, and user rating.
  - `Suppliers`: Contains supplier details including national ID, name, and contact number.

- **Data Population**:  
  Test data has been inserted into all tables to support query execution and reporting. Each table contains 5–6 rows of representative data.

- **Reporting and Querying**:  
  Multiple analytical queries have been implemented, including:
  - Retrieving users based in specific cities or with specific phone number prefixes
  - Identifying products from specific suppliers
  - Computing product rating averages and filtering by rating range
  - Automatically updating sale prices by percentage and returning affected records
  - Listing invoices for a given user
  - Identifying high-profit products
  - Reporting sales count per supplier
  - Generating views summarizing frequently purchased items and supplier contributions

- **Python Integration**:  
  A Python script connects to the database using a standard SQL connector. Queries are executed via Python for data extraction and basic post-processing.
