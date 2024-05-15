WITH operations_per_lot AS (
    SELECT
        LOT,
        COUNT(LOT) AS count
    FROM SMN
    GROUP BY LOT
)
SELECT
    COUNT(count),
    COUNT(count)*100/(SELECT SUM(count) FROM operations_per_lot)
FROM operations_per_lot
GROUP BY count;



SELECT
    LOT,
    COUNT(LOT) AS count
FROM SMN
GROUP BY LOT;