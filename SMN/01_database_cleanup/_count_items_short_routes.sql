SELECT COUNT(*) FROM (
    SELECT ROUTE
    FROM SMN
    GROUP BY ROUTE
    HAVING COUNT(DISTINCT OPERATION) < 100
)
