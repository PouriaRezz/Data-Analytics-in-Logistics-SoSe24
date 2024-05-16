WITH Operations_Per_Route AS (
    SELECT
        ROUTE,
        COUNT(ROUTE) AS count
    FROM SMN
    GROUP BY ROUTE
)

SELECT
    COUNT(ROUTE) AS Number_Of_Routes,
    count AS Number_Of_Operations
FROM Operations_Per_Route
GROUP BY count
ORDER BY count;




