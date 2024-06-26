html_content=$(cat <<EOF
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="stylesheet.css">
  <title>Data Analytics Report - Detaillierte Analyse der Fertigungsdaten</title>
</head>
<body>

  <h2>Grundlegende Kennzahlen aus den Fertigungsdaten</h2>

  <p>
    Eine umfassende Analyse der vorliegenden Fertigungsdaten ergab folgende grundlegende Kennzahlen:
  <ul>
    <li><b>Gesamtzahl der Wafer-Chargen (Lots):</b> Der Datensatz umfasst insgesamt <b>$(sed -n '2p' "count_lots.csv")</b> einzigartige Wafer-Chargen. Eine Wafer-Charge repräsentiert eine Gruppe von Siliziumwafern, die gleichzeitig durch den Chipherstellungsprozess verarbeitet werden.</li>

    <li><b>Gesamtzahl der Verarbeitungsrouten:</b> Der Datensatz beinhaltet <b>$(sed -n '2p' "count_routes.csv")</b> verschiedene Verarbeitungsschritte. Jeder Verarbeitungsschritt stellt eine einzelne Stufe oder Operation dar, die während der Fertigung an den Wafer-Chargen durchgeführt wird.</li>

    <li><b>Daten-Integritätsverstöße:</b> Die Analyse identifizierte <b>$(sed -n '2p' "count_integrity_violations.csv")</b> Data-Integritätsverstöße. Diese Verstöße können Fehler oder Inkonsistenzen in den Daten sein, die deren Genauigkeit oder Zuverlässigkeit beeinträchtigen könnten.</li>
  </ul>
    Diese grundlegenden Kennzahlen liefern einen ersten Überblick über die Struktur der Daten und dienen als Ausgangspunkt für weitere Analysen und Optimierungsbemühungen.
  </p>

  <h2>Visualisierung der Verteilungen der Operationsanzahl pro Route</h2>

  <figure>
    <p>
      Um die Komplexität der Verarbeitung pro Route besser zu verstehen, wurden die Daten ausgewertet und als Wahrscheinlichkeitsdichtefunktion visualisiert. Diese Visualisierung zeigt die Verteilung der Häufigkeit, mit der verschiedene Operationszahlen pro Route auftreten.
    </p>

    <img src="$(realpath "probability_of_number_of_operations_per_route.svg")"/>

    <figcaption>
      <b>Wahrscheinlichkeitsdichtefunktion der Operationsanzahl pro Route</b>

      Diese Visualisierung veranschaulicht die Verteilung der Operationsanzahl pro Route und verdeutlicht die Wahrscheinlichkeit, auf verschiedene Operationszahlen zu stoßen. Es wird deutlich, dass 80% der Routen weniger als 200 Operationen umfassen, was darauf hindeutet, dass die meisten Routen relativ einfach zu bewältigen sind.

      Diese Analyse kann wertvolle Erkenntnisse liefern, um potenzielle Engpässe oder Bereiche für Optimierungen innerhalb des Fertigungsprozesses zu identifizieren.
    </figcaption>
  </figure>

  <h2>Visualisierung der Verteilungen der Operationsanzahl pro Wafer-Charge</h2>

  <figure>
    <p>
      Um die Komplexität der Verarbeitung pro Wafer-Charge zu beurteilen, wurden die Daten ebenfalls als Wahrscheinlichkeitsdichtefunktion visualisiert. Diese Visualisierung zeigt die Verteilung der Häufigkeit, mit der verschiedene Operationszahlen pro Wafer-Charge auftreten.
    </p>

    <img src="$(realpath "probability_of_number_of_operations_per_lot.svg")"/>

    <figcaption>
      <b>Wahrscheinlichkeitsdichtefunktion der Operationsanzahl pro Wafer-Charge</b>

      Diese Visualisierung veranschaulicht die Verteilung der Operationsanzahl pro Wafer-Charge und verdeutlicht die Wahrscheinlichkeit, auf verschiedene Operationszahlen zu stoßen. Es wird deutlich, dass 83% der Wafer-Chargen bis zu 220 Operationen erfordern, was darauf hindeutet, dass die meisten Chargen eine moderate Verarbeitungskomplexität aufweisen.

      Diese Analyse kann hilfreich sein, um die Arbeitslastverteilung über verschiedene Verarbeitungsstationen hinweg zu verstehen und potenzielle Bereiche für Effizienzsteigerungen zu identifizieren.
    </figcaption>
  </figure>

  <h2>Auswertung der Verteilung der der Sortierschritte</h2>

  <p>
    Um besser zu verstehen wie die Sortierschritte verteilt sind wurden die Menge an produktiven 
    Schritten zwsichen den Sortierschritten ausgezählt und basierend auf diesen Daten 
    eine Clusteranalyse erstellt. Um diese Analyse weiter zu spezifizieren wurde auf besonders herrausstechende Routen
    genaueres Augenmerk gelegt.
  </p>


</body>
</html>

EOF
)

echo "$html_content" > section.html

echo "HTML file created: section.html"