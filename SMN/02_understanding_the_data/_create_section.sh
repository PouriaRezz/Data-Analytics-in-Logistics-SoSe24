#!/bin/bash

html_content=$(cat <<EOF
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="stylesheet.css">
    <title>Data Analytics Report</title>
</head>
<body>
  <h1>Data Analytics Report</h1>

  <h2>Grundlegende Kennzahlen aus den Daten</h2>
  <p>
    Eine Ermittlung der Gesamtzahl an Losen und Routen im Datensatz ergab, dass insgesamt
    $(sed -n '2p' "count_lots.csv") unterschiedliche Lose auf 
    $(sed -n '2p' "count_routes.csv") verschiedenen Routen ausgeführt werden. 
    Des Weiteren wurden $(sed -n '2p' "count_integrity_violations.csv") Integritätsverstöße festgestellt.
  </p>

  <h2>Visualisierung der Verteilungen der Operationsanzahl</h2>
  <figure> 
  <img src="gnuplot/probability_of_number_of_operations_per_route.svg"/>
    <figcaption> Wahrscheinlichkeitsdichtefunktion der Operationsanzahl pro Route. 
    Diese Visualisierung zeigt die Verteilung der Häufigkeit, mit der verschiedene 
    Operationszahlen pro Route auftreten. 
    </figcaption>
  </figure>
  <figure> 
    <img src="gnuplot/probability_of_number_of_operations_per_lot.svg"/>
    <figcaption> Wahrscheinlichkeitsdichtefunktion der Operationsanzahl pro Los. 
    Diese Visualisierung zeigt die Verteilung der Häufigkeit, mit der verschiedene 
    Operationszahlen pro Los auftreten.
    </figcaption>
  </figure>

  </body>
</html>
EOF
)

echo "$html_content" > section.html

echo "HTML file created: section.html"
