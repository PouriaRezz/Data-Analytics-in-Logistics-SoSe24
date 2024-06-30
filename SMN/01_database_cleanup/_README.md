## Entfernen aller Lose, zu denen keine Operation 1 in den Daten existiert

Dabei handelt es sich um `count_items_lots_that_do_not_start_with_operation_1.csv` Lose und es werden `count_rows_lots_that_do_not_start_with_operation_1.csv` Zeilen aus der Datenbank entfernt.

## Entfernen aller Lose, die mehrere Routen durchlaufen

Die Daten enthalten Lose, die mehrere Routen durchlaufen. Da ein Los dabei einzelne Operationen von einer Route mit Schritten einer anderen Route vermischt, werden diejenigen Lose, die mehrere Routen durchlaufen aus den Daten entfernt. Es handelt sich dabei um `count_items_lots_that_run_several_routes.csv` Lose, wodurch `count_rows_lots_that_run_several_routes.csv` Zeilen entfernt werden.

## Entfernen aller duplizierten Operationen
TODO

## Fazit

Durch das Entfernen von:

* allen Lose, deren Operation 1 nicht in den Daten vorkommt,
* allen Lose, die mehrere Routen durchlaufen und
* allen Duplizierten Operationen

reduziert sich die Datenmenge auf `count_leftover_rows.csv` Zeilen.
