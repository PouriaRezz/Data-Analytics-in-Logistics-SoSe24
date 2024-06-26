#!/bin/bash

# Generieren des HTML-Inhalts
html_content=$(cat <<EOF
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="stylesheet.css">
  <title>Data Analytics Report - Datenbereinigung und Ergebnisaufbereitung</title>
</head>
<body>

  <h1>Data Analytics Report</h1>

  <h2>Datenbereinigung: Herausfiltern von irrelevanten Datensätzen</h2>

  <p>
    Um die Analyseergebnisse zu optimieren und aussagekräftige Schlussfolgerungen aus den Daten zu ziehen, 
    wurde eine gründliche Datenbereinigung durchgeführt. Dabei wurden Datensätze herausgefiltert, 
    die aufgrund von Inkonsistenzen oder fehlender Relevanz für die Analyse untauglich waren.

    <b>Folgende Kriterien wurden zur Identifizierung und Entfernung irrelevanter Datensätze angewandt:</b>
    <ol>
    <li> <b>Fehlender Start mit Operation 1:</b> Datensätze, die nicht mit Operation 1 begannen, 
       wurden ausgeschlossen, da dies auf einen fehlerhaften Dateneintrag oder eine Inkonsistenz in der 
       Prozessabfolge hindeutet. 
       (Anzahl der entfernten Datensätze: $(sed -n '1p' "count_lots_that_do_not_start_with_operation_1.csv"))
    </li>
    <li> <b>Durchlaufen mehrerer Routen:</b> Datensätze, die mehrere Routen durchliefen, wurden ebenfalls 
       ausgeschlossen, da dies auf eine fehlerhafte Zuordnung oder einen inkonsistenten Fertigungsprozess 
       hindeutet. 
       (Anzahl der entfernten Datensätze: $(sed -n '1p' "count_lots_that_run_several_routes.csv"))
    </li>
    </ol>
    <b>Durch die Anwendung dieser Filterkriterien wurde der ursprüngliche Datensatz bereinigt und auf 
    relevante und konsistente Einträge reduziert. Der bereinigte Datensatz umfasst somit 
    $(sed -n '1p' "count_leftover_rows.csv") verbleibende Datensätze, die für die weitere Analyse 
    verwendet werden können.</b>

    Die Datenbereinigung ist ein wichtiger Schritt im Prozess der Datenanalyse, um zuverlässige und 
    aussagekräftige Ergebnisse zu erzielen. Durch die Identifizierung und Entfernung von 
    irrelevanten oder fehlerhaften Daten wird die Qualität der Analyse verbessert und die 
    Zuverlässigkeit der Schlussfolgerungen gestärkt.
  </p>

</body>
</html>
EOF
)

# Speichern des HTML-Inhalts in einer Datei
echo "$html_content" > section.html

# Ausgabe einer Bestätigungsmeldung
echo "HTML-Datei erstellt: section.html"
