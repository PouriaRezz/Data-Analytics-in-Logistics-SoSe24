WITH Operations_Per_Lot AS (
    SELECT
        LOT,
        COUNT(LOT) AS OPS_Per_Lot
    FROM SMN
    GROUP BY LOT
)

SELECT
    OPS_Per_Lot,
    COUNT(LOT) AS Lots_With_n_OPS,
    COUNT(LOT)*1.0/(SELECT COUNT(*) FROM Operations_Per_Lot) AS Probability
FROM operations_per_lot
GROUP BY OPS_Per_Lot
ORDER BY OPS_Per_Lot ASC



