.PHONY:all
all: count_lots.csv count_routes.csv count_integrity_violations.csv distribution_number_of_operations_per_lot.csv distribution_number_of_operations_per_route.csv probability_of_number_of_operations_per_lot.svg probability_of_number_of_operations_per_route.svg section.pdf

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

probability_of_number_of_operations_per_lot.svg:_distribution_number_of_operations_per_lot.gnuplot
	gnuplot _distribution_number_of_operations_per_lot.gnuplot

probability_of_number_of_operations_per_route.svg:_distribution_number_of_operations_per_route.gnuplot
	gnuplot _distribution_number_of_operations_per_route.gnuplot

section.pdf:count_lots.csv count_routes.csv count_integrity_violations.csv probability_of_number_of_operations_per_route.svg probability_of_number_of_operations_per_route.svg
	asciidoctor-pdf section.adoc
	@echo "section.pdf wurde aktualisiert."