WITH lot_route_operation_pairs AS (
    SELECT
        LOT,
        ROUTE,
        OPERATION,
        LAG(OPERATION) OVER (PARTITION BY ROUTE, LOT) AS prev
    FROM SMN
    WHERE EQUIPMENT = 'AUTP'
) SELECT
    ROUTE,
    OPERATION - prev AS gap,
    COUNT(OPERATION - prev) AS count
FROM lot_route_operation_pairs
WHERE prev IS NOT NULL
GROUP BY ROUTE, gap
ORDER BY ROUTE, gap;