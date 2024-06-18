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
    <h1>Einf&uumlhrung</h1>
    <p>Im Folgenden soll die Herstellung von Halbleitern analysiert werden. </p>
EOF
)

# 01_database_cleanup
#html_content+='cat 01_database_cleanup/section.html'

# 02_understanding_the_data
html_content+=$(cat 02_understanding_the_data/section.html)


# Füge HTML-Dokumentabschluss hinzu
html_content+="</body></html>"


# Erstelle HTML-Datei
echo "$html_content" > output.html


echo "HTML-Datei wurde erstellt: output.html"