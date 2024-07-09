#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  9 13:51:51 2024

@author: johannesfricke
"""
import sqlite3
import pandas as pd

# Connect to the SQLite database
conn = sqlite3.connect('../SMN.db')

# Load LOTs from the CSV file
lots_df = pd.read_csv('Highest_sort_per_productive.csv')  # Assume the CSV has a single column named 'LOT'

# Create a temporary table for LOTs
conn.execute("DROP TABLE IF EXISTS TempLOTS")
conn.execute("CREATE TEMP TABLE TempLOTS (LOT TEXT)")

# Insert LOTs into the temporary table
lots_df.to_sql('TempLOTS', conn, if_exists='append', index=False)

# SQL query to count the occurrences of each ROUTE for the first occurrence of each LOT
query = """
WITH FirstOccurrence AS (
    SELECT 
        SMN.LOT,
        SMN.ROUTE,
        MIN(SMN.TIME_STAMP_UTC) AS FirstTimeStamp
    FROM 
        SMN
    JOIN
        TempLOTS ON SMN.LOT = TempLOTS.LOT
    GROUP BY 
        SMN.LOT, SMN.ROUTE
)
SELECT 
    ROUTE,
    COUNT(ROUTE) AS COUNT
FROM 
    FirstOccurrence
GROUP BY 
    ROUTE
ORDER BY 
    COUNT DESC;
"""

# Execute the query and load the results into a DataFrame
result_df = pd.read_sql_query(query, conn)

# Save the results to a CSV file
result_df.to_csv('routes_with_high_sort_per_productive.csv', index=False)

# Close the database connection
conn.close()
