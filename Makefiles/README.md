# Makefiles
Ein Makefile ist eine Sammlung von Skripten (Make-Targets). Es hat folgenden Aufbau:

```makefile
<targetName>: [prerequisites]*
    [commands]*
```
Die prerequisites enthalten eine Liste von targetNames, die vor der Ausführung der commands ausgeführt werden sollen. 
Danach werden die commands ausgeführt. prerequisites und commands dürfen auch leer sein.
Mithilfe des Namens des Targets wird dieses aufgerufen (`make <targetName>`). 
Dann werden erst alle prerequisites ausgeführt und anschließend alle commands. 

## Erstellung eines Makefiles
Make sucht in folgender Reihenfolge nach Makefiles: `GNUmakefile`, `makefile`, `Makefile`. Die make Dokumentation empfiehlt `Makefile`. 
Wenn das Makefile anders benannt ist, muss der Name des Makefiles mit angegeben werden
```commandline
make -f myVerySpecialMakefileName
make --file myVerySpecialMakefileName
```

## Benennung von Targets
Benennt man seine Targets nach der Datei, die mittels des Targets erstellt wird, wird vor der Ausführung des Targets mittels Zeitstempel der Datei geprüft, ob das Target ausgeführt werden muss.


## Beispiel-Makefile
```makefile
measurements.csv:
	touch measurements.csv

processed.csv: ../measurements.csv
	touch processed.csv

plot.svg: ../processed.csv
	touch plot.svg

```

TODO
Wird dieses Makefile mit `make`

## Längere Targets vs. Aufrufe von bash-Skripten
Längere Listen von Commands in Makefile-Targets können auch in entsprechende Skripte ausgelagert werden.

#### Vorteile von Längeren Targets:
- Effizienz: Makefiles sind darauf ausgelegt nur Targets auszuführen, die sich geändert haben. Zudem sind sie in der Lage einige Befehle zu parallelisieren. 
- Einfachheit: Alle Befehle sind in einer Datei zu finden

#### Vorteile von Bash-Skripten:
- Flexibilität: Bash-Skripte sind mächtiger in ihrem Befehlsumfang. Werden konditionale Logik oder Schleifen benötigt, sind Bash-Skripte sinnvoller.
- Lesbarkeit: Bei komplexen Prozessen kann eine Aufteilung die Lesbarkeit und Wartbarkeit verbessern.
- Wiederverwendbarkeit: Skripte können in verschiedenen Projekten/Teilen eines Projekts wiederverwendet werden.
- Alle Commands werden in einer Bash ausgeführt: Während die Commands im Makefile in unterschiedlichen Bashes ausgeführt werden, wird der gesamte Inhalt des Skriptes in einer Bash ausgeführt. Dies ermöglicht die Verwendung von Variablen.

#### Zusammenfassung
Für simple und kurze Prozesse lieber alles ins Makefile schreiben, wenn komplexere Logik mit if-else oder Schleifen benötigt werden, oder die Targets sehr lang werden, ist eine Auslagerung in Bash-Skripte sinnvoll 


## Fortschrittsanzeige
Da Make nicht weiß, die lange die einzelnen Targets zur Ausführung benötigen, kann es keinen Fortschrittsbalken berechnen.
Die einfachste Möglichkeit für eine Fortschrittsanzeige ist eine Ausgabe mittels echo, wenn einzelne Aufgaben abgeschlossen wurden.

## Laufzeitmessung

#### Für einzelne Commands
Da make die einzelnen Commands in seperaten Bashes ausführt, können keine Variablen zwischen den Commands geteilt werden.
Soll eine Laufzeit gemessen werden, müssen die Commands zu einem Command zusammengefasst werden. Dies kann schnell unleserlich werden, daher bietet es sich hier an, das Target in ein bash-Skript auszulagern
```makefile
timeMeasurement:
	d=$$(date +%s)\
    ; sleep 3 \
    && echo "Build took $$(($$(date +%s)-d)) seconds"
```

#### Für die gesamte Ausführung
Die Laufzeit der Gesamtausführung lässt sich messen, indem der `time` command verwendet wird.
```commandline
time make all
```

## Tips
- `@` vor einem Command verhindert die Ausgabe des Commands auf der Konsole.
- `.ONESHELL` am Beginn des Makefile sorgt dafür, dass alle Befehle eines Targets in einer Shell ausgeführt werden.
