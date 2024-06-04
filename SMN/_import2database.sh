#!/bin/bash

# SQLite-Datenbank erstellen und Tabelle erstellen
sqlite3 SMN.db < _create_smn_table.sql

COUNT=$(sqlite3 SMN.db "SELECT COUNT(*) FROM SMN;");

if [ $((COUNT)) -eq 0 ]
then
# Daten importieren
sqlite3 -cmd ".mode tabs" SMN.db ".import routes.dat temp"
sqlite3 SMN.db < _postprocess_import.sql

fi
