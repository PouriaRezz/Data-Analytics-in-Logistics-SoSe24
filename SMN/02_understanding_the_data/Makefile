all: count_lots.csv count_routes.csv count_integrity_violations.csv distribution_number_of_operations_per_lot.csv distribution_number_of_operations_per_route.csv _distribution_number_of_operations_per_lot.svg _distribution_number_of_operations_per_route.svg section.html

count_lots.csv: ../SMN.db _count_lots.sql
	sqlite3 -header -csv ../SMN.db < _count_lots.sql > count_lots.csv

count_routes.csv: ../SMN.db _count_routes.sql
	sqlite3 -header -csv ../SMN.db < _count_routes.sql > count_routes.csv

count_integrity_violations.csv: ../SMN.db _count_integrity_violations.sql
	sqlite3 -header -csv ../SMN.db < _count_integrity_violations.sql > count_integrity_violations.csv

distribution_number_of_operations_per_lot.csv: ../SMN.db _distribution_number_of_operations_per_lot.sql
	sqlite3 -header -csv ../SMN.db < _distribution_number_of_operations_per_lot.sql > distribution_number_of_operations_per_lot.csv

distribution_number_of_operations_per_route.csv: ../SMN.db _distribution_number_of_operations_per_route.sql
	sqlite3 -header -csv ../SMN.db < _distribution_number_of_operations_per_route.sql > distribution_number_of_operations_per_route.csv

_distribution_number_of_operations_per_lot.svg:_distribution_number_of_operations_per_lot.gnuplot
_distribution_number_of_operations_per_lot.gnuplot:
	gnuplot _distribution_number_of_operations_per_lot.gnuplot

_distribution_number_of_operations_per_route.svg:_distribution_number_of_operations_per_route.gnuplot
_distribution_number_of_operations_per_route.gnuplot:
	gnuplot _distribution_number_of_operations_per_route.gnuplot

section.html: _create_section.sh count_integrity_violations.csv count_lots.csv count_routes.csv probability_of_number_of_operations_per_lot.svg probability_of_number_of_operations_per_route.svg
	sh _create_section.sh