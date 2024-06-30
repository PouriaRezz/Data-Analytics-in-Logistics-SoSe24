WITH step_counts AS (
    SELECT
        lot,
        SUM(CASE WHEN equipment = 'MESP' THEN 1 ELSE 0 END) AS measurement_steps,
        SUM(CASE WHEN equipment = 'AUTP' THEN 1 ELSE 0 END) AS sorting_steps
    FROM
        SMN
    GROUP BY
        lot
)
SELECT
    lot,
    measurement_steps,
    sorting_steps
FROM
    step_counts;

