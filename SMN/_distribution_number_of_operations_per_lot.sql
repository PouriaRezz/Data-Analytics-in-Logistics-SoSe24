WITH Operations_Per_Lot AS (
    SELECT
        LOT,
        COUNT(LOT) AS count
    FROM SMN
    GROUP BY LOT
)

SELECT
    COUNT(LOT) AS Number_Of_Lots,
    count AS Number_Of_Operations
FROM operations_per_lot
GROUP BY count
ORDER BY count;




