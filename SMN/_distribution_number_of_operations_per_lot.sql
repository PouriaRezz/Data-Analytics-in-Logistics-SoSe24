WITH Operations_Per_Lot AS (
    SELECT
        LOT,
        COUNT(LOT) AS count
    FROM SMN
    GROUP BY LOT
)

SELECT
    count AS Number_Of_Operations,
    COUNT(LOT) AS Number_Of_Lots,
    COUNT(LOT)*1.0/(SELECT COUNT(*) FROM Operations_Per_Lot) AS Probability
FROM operations_per_lot
GROUP BY count
ORDER BY Number_Of_Lots ASC;



