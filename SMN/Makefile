SUBDIRS := $(wildcard */.)

all: $(SUBDIRS)

SMN.db: _import2database.sh _postprocess_import.sql _create_smn_table.sql 01_database_cleanup/_count_lots_that_do_not_start_with_operation_1.sql 01_database_cleanup/_delete_lots_that_do_not_start_with_operation_1.sql 01_database_cleanup/_count_lots_that_run_several_routes.sql 01_database_cleanup/_delete_lots_that_run_several_routes.sql
	-rm SMN.db
	sh _import2database.sh

$(SUBDIRS): SMN.db
	$(MAKE) -C $@


.PHONY: all $(SUBDIRS)