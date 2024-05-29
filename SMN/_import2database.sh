#!/bin/bash

# SQLite-Datenbank erstellen und Tabelle erstellen
sqlite3 SMN.db <<EOF
CREATE TABLE IF NOT EXISTS SMN (
    LOT TEXT,
    ROUTE TEXT,
    OPERATION INTEGER,
    SPS_NAME TEXT,
    EQUIPMENT TEXT,
    OPERATOR TEXT,
    TIME_STAMP_UTC TEXT,
    SORTER_JOB_COMPLETE_INCON_SRC INTEGER
);
EOF

COUNT=$(sqlite3 SMN.db "SELECT COUNT(*) FROM SMN;");

if [ $((COUNT)) -eq 0 ]
then
# Daten importieren
sqlite3 -cmd ".mode tabs" SMN.db ".import --skip 1 routes.dat SMN"
sqlite3 SMN.db "UPDATE SMN SET SORTER_JOB_COMPLETE_INCON_SRC = NULL WHERE SORTER_JOB_COMPLETE_INCON_SRC = '';"
sqlite3 SMN.db "CREATE INDEX LOT_IDX ON SMN(LOT);"
sqlite3 SMN.db "CREATE INDEX ROUTE_IDX ON SMN(ROUTE);"

fi
