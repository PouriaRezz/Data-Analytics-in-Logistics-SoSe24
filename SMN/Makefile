
all: count_lots.csv count_routes.csv count_integrity_violations.csv

SMN.db: _import2database.sh
	sh _import2database.sh

count_lots.csv: SMN.db _count_lots.sql
	sqlite3 -csv SMN.db < _count_lots.sql > count_lots.csv

count_routes.csv: SMN.db _count_routes.sql
	sqlite3 -csv SMN.db < _count_routes.sql > count_routes.csv

count_integrity_violations.csv: SMN.db _count_integrity_violations.sql
	sqlite3 -csv SMN.db < _count_integrity_violations.sql > count_integrity_violations.csv