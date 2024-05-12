#!/bin/bash

# Definiere statische Teile der HTML-Datei mit Here Documents
html_static=$(cat <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Meine HTML-Datei</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Willkommen</h1>
    <p>Dies ist eine dynamisch generierte HTML-Datei.</p>
EOF
)

# Dynamische Teile der HTML-Datei durch Command Substitution einfügen
timestamp=$(date)
rm extracted_data.csv
rm output.html
bash create_database.sh

csv_file="extracted_data.csv"

# Generate HTML table
html_table="<table>"
while IFS=',' read -r -a row; do
    # html_table+="  <tr>\n"
    for cell in "${row[@]}"; do
        html_table+="    <td>${cell}</td>"
    done
    html_table+="  </tr>"
done < "$csv_file"
html_table+="</table>"

echo "HTML table created: $html_file"
html_dynamic="<p>Aktuelles Datum und Uhrzeit: $timestamp</p>"
html_dynamic+="<p>Die extrahierte Tabelle der Datenbank: </p>"
html_dynamic+="<p>$html_table </p>" 

# Füge statische und dynamische Teile zusammen
html_content="$html_static$html_dynamic"



# Füge HTML-Dokumentabschluss hinzu
html_content+="</body></html>"

# Erstelle HTML-Datei
echo "$html_content" > output.html

# Technische Dokumentation als Kommentare
tech_documentation=$(cat <<EOF
<!--
Wesentliche Konzepte:

- Verwendung von Here-Dokumenten für statische HTML-Teile ermöglicht eine übersichtliche Strukturierung des Skripts.
- Command Substitution wird verwendet, um dynamische Inhalte (wie das aktuelle Datum und die Uhrzeit) in die HTML-Datei einzufügen.
- Die HTML-Datei wird am Ende des Skripts mit den generierten statischen und dynamischen Inhalten erstellt.

Möglichkeiten zur Überführung der HTML-Datei in ein PDF-Dokument:

1. Verwendung von Browser-Erweiterungen oder Online-Diensten, die HTML zu PDF konvertieren können.
2. Verwendung von Befehlen wie wkhtmltopdf oder pandoc, um die HTML-Datei direkt in ein PDF-Dokument zu konvertieren.
3. Verwendung von LaTeX mit einem entsprechenden LaTeX-Template, das das HTML-Dokument in ein PDF umwandelt. Dies erfordert möglicherweise zusätzliche Formatierungsarbeiten, insbesondere für die Paginierung und Referenzierung.
-->
EOF
)

# Füge technische Dokumentation am Ende der HTML-Datei hinzu
echo "$tech_documentation" >> output.html

echo "HTML-Datei wurde erstellt: output.html"