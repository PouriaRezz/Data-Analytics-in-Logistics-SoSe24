#!/bin/bash
make

# Definiere statische Teile der HTML-Datei mit Here Documents
html_content=$(cat <<EOF
<!DOCTYPE html>
<html>
<head>
	<link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>
	<link rel="stylesheet" href="stylesheet.css">
    <title>Data analytics in logistic</title>
</head>
<body>
    <h1>Einfuehrung</h1>
    <p>Im Folgenden soll die Herstellung von Halbleitern analysiert werden. </p>
EOF
)

# number of lots
html_content+="<h2>Anzahl der Lose</h2>"
lineno=2
file="count_lots.csv"
line=$(sed -n "${lineno}p" "$file")
html_content+="<p>Es gibt insgesamt $line Lose im betrachteten Zeitraum.</p>"

# Number of routes
html_content+="<h2>Anzahl der Routen</h2>"
lineno=2
file="count_routes.csv"
line=$(sed -n "${lineno}p" "$file")
html_content+="<p>Es gibt $line m&ouml;gliche Routen, die ein Los durchlaufen kann.</p>"




bild="<img src="gnuplot/probability_of_number_of_operations_per_route.svg"/>"
bild="<figure> $bild
		<figcaption> Dichtefunktion der Anzahl von Operationen pro Route </figcaption></figure>"
html_content+="$html_content1$bild"




#html_content+="<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>"

# Füge HTML-Dokumentabschluss hinzu
html_content+="</body></html>"


# Erstelle HTML-Datei
echo "$html_content" > section.html


echo "HTML-Datei wurde erstellt: section.html"