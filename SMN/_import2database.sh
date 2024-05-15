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


# Daten importieren
sqlite3 -cmd ".mode tabs" SMN.db ".import routes.dat SMN"
