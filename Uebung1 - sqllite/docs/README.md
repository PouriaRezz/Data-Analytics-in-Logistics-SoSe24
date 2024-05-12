# Create gwak-script to extract the desire informations from master-detail relationships datas and add them to the sqllite database
### Project Overview

This project involves initializing a SQLite database, extracting relevant information from master-detail relationship datasets, and populating the database with the extracted data.

### Table of Contents

1. [Master-Detail Relationships Data](#1-master-detail-relationships-data)
2. [GAWK Script](#2-gawk-script)
3. [Creating SQLite Database](#3-creating-sqlite-database)
4. [How to Run the Project](#4-how-to-run-the-project)
5. [Testing](#5-testing)

### 1. Master-Detail Relationships Data

The data consists of two CSV files:

- **master.csv**: Contains information about suppliers, including SupplierID, SupplierName, SupplierLocation, and ProductCategory.

   | SupplierID | SupplierName | SupplierLocation | ProductCategory |
   |------------|--------------|------------------|-----------------|
   | 1          | Supplier A   | New York         | Electronics     |
   | 2          | Supplier B   | Los Angeles      | Furniture       |
   | 3          | Supplier C   | Miami            | Appliances      |
   | 4          | Supplier D   | Chicago          | Electronics     |
   | 5          | Supplier E   | Houston          | Furniture       |
   | 6          | Supplier F   | Dallas           | Appliances      |

- **detail.csv**: Contains order details, including OrderID, SupplierID, ProductID, ProductName, Quantity, UnitPrice, and TotalPrice.
   
   | OrderID | SupplierID | ProductID | ProductName      | Quantity | UnitPrice | TotalPrice |
   |---------|------------|-----------|------------------|----------|-----------|------------|
   | 1       | 1          | 101       | Smartphone       | 50       | 300       | 15000      |
   | 2       | 1          | 102       | Laptop           | 30       | 800       | 24000      |
   | 3       | 2          | 201       | Sofa             | 10       | 500       | 5000       |
   | 4       | 3          | 301       | Refrigerator     | 20       | 700       | 14000      |
   | 5       | 4          | 103       | Tablet           | 40       | 400       | 16000      |
   | 6       | 4          | 104       | TV               | 20       | 1000      | 20000      |
   | 7       | 5          | 202       | Bed              | 15       | 600       | 9000       |
   | 8       | 5          | 203       | Chair            | 25       | 200       | 5000       |
   | 9       | 6          | 302       | Washing Machine  | 10       | 900       | 9000       |
   | 10      | 6          | 303       | Dryer            | 5        | 700       | 3500       |

### 2. GAWK Script

The `extract.awk` script is crucial for extracting the desired information from the master-detail datasets. Here's a summary of its functionality:

- **BEGIN block**: Sets the field separator (`FS`) and output field separator (`OFS`) to comma (`,`). Prints the header for the extracted data.

- **NR == FNR block**: Processes the master file. It skips the header and checks each line. If the supplier is located in New York, it stores the SupplierID and SupplierName in an associative array.

- **NR != FNR block**: Processes the detail file. It skips the header and checks each line. If the SupplierID of the current order exists in the New York suppliers list (from the master file), it prints the order details.

This script effectively filters out order details corresponding to suppliers located in New York from the detail dataset.

### 3. Creating SQLite Database

A SQLite database named `logistics.db` is utilized to store the extracted data. The database consists of two tables:

#### Suppliers Table
| Column Name     | Description            |
|-----------------|------------------------|
| SupplierID      | Unique identifier for the supplier |
| SupplierName    | Name of the supplier   |
| SupplierLocation| Location of the supplier|
| ProductCategory | Category of products supplied by the supplier|

#### Orders Table
| Column Name     | Description            |
|-----------------|------------------------|
| OrderID         | Unique identifier for the order   |
| SupplierID      | References the SupplierID in the Suppliers table |
| ProductID       | Unique identifier for the product ordered |
| ProductName     | Name of the product ordered |
| Quantity        | Quantity of the product ordered |
| UnitPrice       | Price per unit of the product |
| TotalPrice      | Total price of the order (Quantity * UnitPrice) |

The `populate_database.sh` script automates the creation of the database if it doesn't exist and imports the extracted data from the CSV files into the respective tables.

### 4. How to Run the Project

To run the project:

1. Ensure that both CSV files (`master.csv` and `detail.csv`) are present in the data directory.

2. Execute the `populate_database.sh` script:
    ```bash
    ./populate_database.sh
    ```
### 5. Testing

After running the project, you can verify the correctness of the extraction and database insertion process by querying the SQLite database `logistics.db`. 

- **Query to retrieve orders from database:**
   ```
  sqllite3 logistics.db
  
  SELECT * FROM Orders
  ```
