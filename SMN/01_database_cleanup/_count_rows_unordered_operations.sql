-- we keep the later operation
SELECT
    COUNT(smn1.LOT)
FROM SMN smn1
LEFT JOIN SMN smn2 ON
    smn2.LOT = smn1.LOT
AND
    smn2.ROUTE = smn1.ROUTE
AND
    smn2.OPERATION <= smn1.OPERATION
AND
    unixepoch(smn2.TIME_STAMP_UTC) > unixepoch(smn1.TIME_STAMP_UTC)
WHERE smn2.LOT IS NOT NULL;
