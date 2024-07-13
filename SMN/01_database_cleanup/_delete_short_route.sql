-- Delete data records from the SMN table for which the number of different operations per route is less than 100

DELETE FROM SMN
WHERE ROUTE IN (
    SELECT ROUTE
    FROM SMN
    GROUP BY ROUTE
    HAVING COUNT(DISTINCT OPERATION) < 100
);
