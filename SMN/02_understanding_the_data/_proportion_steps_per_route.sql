WITH step_counts AS (
    SELECT
        route,
        COUNT(*) AS total_steps,
        SUM(CASE WHEN equipment NOT IN ('AUTP', 'MESP') THEN 1 ELSE 0 END) AS productive_steps,
        SUM(CASE WHEN equipment = 'MESP' THEN 1 ELSE 0 END) AS measurement_steps,
        SUM(CASE WHEN equipment = 'AUTP' THEN 1 ELSE 0 END) AS sorting_steps
    FROM
        SMN
    GROUP BY
        route
),
proportions AS (
    SELECT
        route,
        productive_steps * 1.0 / total_steps AS productive_proportion,
        measurement_steps * 1.0 / total_steps AS measurement_proportion,
        sorting_steps * 1.0 / total_steps AS sorting_proportion
    FROM
        step_counts
)
SELECT * FROM proportions;
