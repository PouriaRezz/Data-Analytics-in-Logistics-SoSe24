#!/bin/bash

DB_FILE="logistics.db"
CSV_FILE="extracted_data.csv"

# Check if the SQLite database and tables exist
if [ ! -f "$DB_FILE" ]; then
    # If the database does not exist, create it
    sqlite3 "$DB_FILE" <<EOF
    CREATE TABLE Suppliers (
        SupplierID INTEGER PRIMARY KEY,
        SupplierName TEXT,
        SupplierLocation TEXT,
        ProductCategory TEXT
    );

    CREATE TABLE Orders (
        OrderID INTEGER PRIMARY KEY,
        SupplierID INTEGER,
        ProductID INTEGER,
        ProductName TEXT,
        Quantity INTEGER,
        UnitPrice REAL,
        TotalPrice REAL,
        FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID)
    );
EOF
fi

# Extract data using AWK script
gawk -f extract.awk master.csv detail.csv > "$CSV_FILE"

# Enable foreign key constraints
sqlite3 "$DB_FILE" "PRAGMA foreign_keys=ON;"

# Import data from the temporary CSV file, skipping the header and checking for existing data
sqlite3 "$DB_FILE" <<EOF
.mode csv
.import "$CSV_FILE" Orders_temp
INSERT OR IGNORE INTO Orders SELECT * FROM Orders_temp;
DROP TABLE Orders_temp;
EOF

# Remove the temporary CSV file
# rm "$CSV_FILE"

