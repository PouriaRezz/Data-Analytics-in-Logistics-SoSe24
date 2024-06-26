.PHONY: all
all: count_leftover_rows.csv section.pdf

count_items_lots_that_do_not_start_with_operation_1.csv: ../SMN.db _count_items_lots_that_do_not_start_with_operation_1.sql
	sqlite3 -csv ../SMN.db < _count_items_lots_that_do_not_start_with_operation_1.sql > count_items_lots_that_do_not_start_with_operation_1.csv

count_rows_lots_that_do_not_start_with_operation_1.csv: ../SMN.db _count_rows_lots_that_do_not_start_with_operation_1.sql
	sqlite3 -csv ../SMN.db < _count_rows_lots_that_do_not_start_with_operation_1.sql > count_rows_lots_that_do_not_start_with_operation_1.csv

count_items_lots_that_run_several_routes.csv: ../SMN.db _count_items_lots_that_run_several_routes.sql
	sqlite3 -csv ../SMN.db < _count_items_lots_that_run_several_routes.sql > count_items_lots_that_run_several_routes.csv

count_rows_lots_that_run_several_routes.csv: ../SMN.db _count_rows_lots_that_run_several_routes.sql
	sqlite3 -csv ../SMN.db < _count_rows_lots_that_run_several_routes.sql > count_rows_lots_that_run_several_routes.csv

cleanup: count_items_lots_that_do_not_start_with_operation_1.csv count_rows_lots_that_do_not_start_with_operation_1.csv count_items_lots_that_run_several_routes.csv count_rows_lots_that_run_several_routes.csv
	sqlite3 ../SMN.db < _delete_lots_that_do_not_start_with_operation_1.sql
	sqlite3 ../SMN.db < _delete_lots_that_run_several_routes.sql

count_leftover_rows.csv: cleanup
	sqlite3 -csv ../SMN.db < _count_leftover_rows.sql > count_leftover_rows.csv

section.pdf:count_rows_lots_that_run_several_routes.csv count_items_lots_that_run_several_routes.csv count_items_lots_that_do_not_start_with_operation_1.csv count_rows_lots_that_do_not_start_with_operation_1.csv count_leftover_rows.csv
	asciidoctor-pdf _section.adoc
	@echo "section.pdf wurde aktualisiert."