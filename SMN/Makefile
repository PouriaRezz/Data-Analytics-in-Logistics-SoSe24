SUBDIRS := $(wildcard */.)

all: SMN.db $(SUBDIRS) main.pdf

main.pdf:01_database_cleanup/section.pdf 02_understanding_the_data/section.pdf
	asciidoctor-pdf -o SMN_Analyse-$$(date +%Y-%m-%d-%H-%M).pdf _main.adoc
	@echo "SMN_Analyse-$$(date +%Y-%m-%d-%H-%M).pdf wurde erstellt."

SMN.db: _import2database.sh _postprocess_import.sql _create_smn_table.sql routes.dat
	-rm -f SMN.db
	sh _import2database.sh

$(SUBDIRS): SMN.db
	$(MAKE) -C $@


.PHONY: all $(SUBDIRS)