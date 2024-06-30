WITH Operations_Per_Route AS (
    SELECT
        ROUTE,
        COUNT(DISTINCT OPERATION) AS count
    FROM SMN
    GROUP BY ROUTE
)
SELECT
    count AS Number_Of_Operations,
    COUNT(ROUTE) AS Number_Of_Routes,
    COUNT(ROUTE)*1.0/(SELECT COUNT(*) FROM Operations_Per_Route) AS Probability
FROM Operations_Per_Route
GROUP BY count
ORDER BY count;



