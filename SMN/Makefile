SUBDIRS := $(wildcard */.)

all: SMN.db $(SUBDIRS) main.pdf

main.pdf:01_database_cleanup/_section.pdf 02_understanding_the_data/_section.pdf
	asciidoctor-pdf _main.adoc
	@echo "main.pdf wurde aktualisiert."

SMN.db: _import2database.sh _postprocess_import.sql _create_smn_table.sql routes.dat
	-rm -f SMN.db
	sh _import2database.sh

$(SUBDIRS): SMN.db
	$(MAKE) -C $@


.PHONY: all $(SUBDIRS)