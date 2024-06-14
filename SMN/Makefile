SUBDIRS := $(wildcard */.)

all: $(SUBDIRS)

SMN.db: _import2database.sh _postprocess_import.sql _create_smn_table.sql
	-rm SMN.db
	sh _import2database.sh

$(SUBDIRS): SMN.db
	$(MAKE) -C $@


.PHONY: all $(SUBDIRS)