
all: cleanup count_leftover_rows.csv section.html

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


section.html: _create_section.sh count_leftover_rows.csv count_lots_that_do_not_start_with_operation_1.csv count_lots_that_run_several_routes.csv
	sh _create_section.sh