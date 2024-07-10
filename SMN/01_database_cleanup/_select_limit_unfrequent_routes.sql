-- select bottom x% routes ordered by number of lots that take them
WITH selected_num_lots AS (
    SELECT
        ROUTE,
        COUNT(DISTINCT LOT) as num_lots
    FROM SMN
    GROUP BY ROUTE
    ORDER BY num_lots ASC
    LIMIT CAST(0.5*(SELECT COUNT(DISTINCT SMN.ROUTE) FROM SMN) AS INTEGER)
)
SELECT
    MAX(num_lots) threshold
FROM selected_num_lots;

