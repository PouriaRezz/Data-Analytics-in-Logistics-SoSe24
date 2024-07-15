.PHONY: all
all: section.pdf

count_items_lots_that_do_not_start_with_operation_1.csv: _count_items_lots_that_do_not_start_with_operation_1.sql
	sqlite3 -csv ../SMN.db < _count_items_lots_that_do_not_start_with_operation_1.sql > count_items_lots_that_do_not_start_with_operation_1.csv

count_rows_lots_that_do_not_start_with_operation_1.csv: _count_rows_lots_that_do_not_start_with_operation_1.sql
	sqlite3 -csv ../SMN.db < _count_rows_lots_that_do_not_start_with_operation_1.sql > count_rows_lots_that_do_not_start_with_operation_1.csv

count_items_lots_that_run_several_routes.csv: _count_items_lots_that_run_several_routes.sql
	sqlite3 -csv ../SMN.db < _count_items_lots_that_run_several_routes.sql > count_items_lots_that_run_several_routes.csv

count_rows_lots_that_run_several_routes.csv: _count_rows_lots_that_run_several_routes.sql
	sqlite3 -csv ../SMN.db < _count_rows_lots_that_run_several_routes.sql > count_rows_lots_that_run_several_routes.csv

count_items_unfrequent_routes.csv: _count_items_unfrequent_routes.sql
	sqlite3 -csv ../SMN.db < _count_items_unfrequent_routes.sql > count_items_unfrequent_routes.csv

count_rows_unfrequent_routes.csv: _count_rows_unfrequent_routes.sql
	sqlite3 -csv ../SMN.db < _count_rows_unfrequent_routes.sql > count_rows_unfrequent_routes.csv

select_limit_unfrequent_routes.csv: _select_limit_unfrequent_routes.sql
	sqlite3 -csv ../SMN.db < _select_limit_unfrequent_routes.sql > select_limit_unfrequent_routes.csv

count_rows_short_routes.csv: _count_rows_short_routes.sql
	sqlite3 -csv ../SMN.db < _count_rows_short_routes.sql > count_rows_short_routes.csv

count_items_short_routes.csv: _count_items_short_routes.sql
	sqlite3 -csv ../SMN.db < _count_items_short_routes.sql > count_items_short_routes.csv

cleanup_done.csv: \
		count_items_unfrequent_routes.csv count_rows_unfrequent_routes.csv select_limit_unfrequent_routes.csv \
		count_items_lots_that_do_not_start_with_operation_1.csv count_rows_lots_that_do_not_start_with_operation_1.csv \
		count_items_short_routes.csv count_rows_short_routes.csv
#		count_items_lots_that_run_several_routes.csv count_rows_lots_that_run_several_routes.csv

	touch cleanup_done.csv

	@echo "Removing unfrequent routes from database"
	sqlite3 ../SMN.db < _delete_unfrequent_routes.sql

	@echo "Removing lots that started before our timeframe"
	sqlite3 ../SMN.db < _delete_lots_that_do_not_start_with_operation_1.sql

	@echo "Delete data records which the number of different operations per route is less than 100"
	sqlite3 ../SMN.db < _delete_short_routes.sql

#	@echo "Removing Lots that run several routes"
#	sqlite3 ../SMN.db < _delete_lots_that_run_several_routes.sql

count_leftover_rows.csv: cleanup_done.csv
	sqlite3 -csv ../SMN.db < _count_leftover_rows.sql > count_leftover_rows.csv

section.pdf: count_leftover_rows.csv _section.adoc
	asciidoctor-pdf -o section.pdf _section.adoc
	@echo "database_cleanup: section.pdf wurde aktualisiert."