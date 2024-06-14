
all: cleanup count_leftover_rows.csv

count_lots_that_do_not_start_with_operation_1.csv: ../SMN.db _count_lots_that_do_not_start_with_operation_1.sql
	sqlite3 -csv ../SMN.db < _count_lots_that_do_not_start_with_operation_1.sql > count_lots_that_do_not_start_with_operation_1.csv

count_lots_that_run_several_routes.csv: ../SMN.db _count_lots_that_run_several_routes.sql
	sqlite3 -csv ../SMN.db < _count_lots_that_run_several_routes.sql > count_lots_that_run_several_routes.csv

cleanup: count_lots_that_do_not_start_with_operation_1.csv count_lots_that_run_several_routes.csv
	sqlite3 ../SMN.db < _delete_lots_that_do_not_start_with_operation_1.sql
	sqlite3 ../SMN.db < _delete_lots_that_run_several_routes.sql

count_leftover_rows.csv:
	sqlite3 -csv ../SMN.db < _count_leftover_rows.sql > count_leftover_rows.csv