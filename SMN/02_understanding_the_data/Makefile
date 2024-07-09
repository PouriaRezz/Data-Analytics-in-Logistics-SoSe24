.PHONY:all
all: count_lots.csv count_routes.csv count_integrity_violations.csv distribution_number_of_operations_per_lot.csv distribution_number_of_operations_per_route.csv proportion_steps_per_route.csv outlier_routes_by_proportion.csv count_MESP_AUTP_per_lot.csv proportion_sorting_per_measurement_steps_per_lot.csv proportion_sorting_per_productive_steps_per_lot.csv probability_of_number_of_operations_per_lot.svg probability_of_number_of_operations_per_route.svg section.pdf

count_lots.csv: ../SMN.db _count_lots.sql
	sqlite3 -csv ../SMN.db < _count_lots.sql > count_lots.csv

count_routes.csv: ../SMN.db _count_routes.sql
	sqlite3 -csv ../SMN.db < _count_routes.sql > count_routes.csv

count_integrity_violations.csv: ../SMN.db _count_integrity_violations.sql
	sqlite3 -csv ../SMN.db < _count_integrity_violations.sql > count_integrity_violations.csv

distribution_number_of_operations_per_lot.csv: ../SMN.db _distribution_number_of_operations_per_lot.sql
	sqlite3 -csv ../SMN.db < _distribution_number_of_operations_per_lot.sql > distribution_number_of_operations_per_lot.csv

distribution_number_of_operations_per_route.csv: ../SMN.db _distribution_number_of_operations_per_route.sql
	sqlite3 -csv ../SMN.db < _distribution_number_of_operations_per_route.sql > distribution_number_of_operations_per_route.csv

proportion_steps_per_route.csv: ../SMN.db _proportion_steps_per_route.sql
	sqlite3 -csv ../SMN.db < _proportion_steps_per_route.sql > proportion_steps_per_route.csv

outlier_routes_by_proportion.csv: ../SMN.db _outlier_routes_by_proportion.sql
	sqlite3 -csv ../SMN.db < _outlier_routes_by_proportion.sql > outlier_routes_by_proportion.csv

count_MESP_AUTP_per_lot.csv: ../SMN.db _count_MESP_AUTP_per_lot.sql
	sqlite3 -csv -header ../SMN.db < _count_MESP_AUTP_per_lot.sql > count_MESP_AUTP_per_lot.csv

proportion_sorting_per_measurement_steps_per_lot.csv: ../SMN.db _proportion_sorting_per_measurement_steps_per_lot.sql
	sqlite3 -csv ../SMN.db < _proportion_sorting_per_measurement_steps_per_lot.sql > proportion_sorting_per_measurement_steps_per_lot.csv

proportion_sorting_per_productive_steps_per_lot.csv: ../SMN.db _proportion_sorting_per_productive_steps_per_lot.sql
	sqlite3 -csv ../SMN.db < _proportion_sorting_per_measurement_steps_per_lot.sql > proportion_sorting_per_productive_steps_per_lot.csv

probability_of_number_of_operations_per_lot.svg:_distribution_number_of_operations_per_lot.gnuplot
	gnuplot _distribution_number_of_operations_per_lot.gnuplot

probability_of_number_of_operations_per_route.svg:_distribution_number_of_operations_per_route.gnuplot
	gnuplot _distribution_number_of_operations_per_route.gnuplot

routes_with_high_sort_per_productive.csv: _distribution_sort_per_productive.py
	python3 _distribution_sort_per_productive.py

Highest_sort_per_productive.csv: _routes_with_high_sort_per_productive.py routes_with_high_sort_per_productive.csv
	python3 _routes_with_high_sort_per_productive.py

section.pdf:count_lots.csv count_routes.csv count_integrity_violations.csv probability_of_number_of_operations_per_route.svg probability_of_number_of_operations_per_route.svg _section.adoc Highest_sort_per_productive.csv
	asciidoctor-pdf -o section.pdf _section.adoc
	@echo "section.pdf wurde aktualisiert."