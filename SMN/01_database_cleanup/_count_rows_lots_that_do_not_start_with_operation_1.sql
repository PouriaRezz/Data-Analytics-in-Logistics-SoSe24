WITH lots AS (
    SELECT LOT,
         MIN(OPERATION) as min_operation
    FROM SMN
    GROUP BY LOT
    HAVING min_operation > 1
) 
SELECT
    COUNT(*)
FROM SMN WHERE LOT IN (SELECT LOT FROM lots);