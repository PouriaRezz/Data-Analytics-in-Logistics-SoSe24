DELETE FROM SMN WHERE LOT IN (
    SELECT LOT
    FROM SMN
    GROUP BY LOT
    HAVING COUNT(distinct route) > 1
);