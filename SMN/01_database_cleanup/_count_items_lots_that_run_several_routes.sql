WITH tmp AS (
    SELECT LOT
    FROM SMN
    GROUP BY LOT
    HAVING COUNT(distinct route) > 1
)
SELECT
    COUNT(*)
FROM tmp;