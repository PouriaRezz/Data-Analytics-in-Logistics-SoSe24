SUBDIRS := $(wildcard */.)

all: $(SUBDIRS) main.pdf

main.pdf:01_database_cleanup/section.pdf 02_understanding_the_data/section.pdf
	asciidoctor-pdf -o SMN_Analyse-$$(date +%Y-%m-%d-%H-%M).pdf _main.adoc
	@echo "SMN_Analyse-$$(date +%Y-%m-%d-%H-%M).pdf wurde erstellt."

SMN.db: routes.dat _import2database.sh _postprocess_import.sql _create_smn_table.sql $(shell find 01_database_cleanup -type f -name "_*.sql") 01_database_cleanup/Makefile
	@if [ -f SMN.db ]; then \
		echo -e "\033[0;31m Rebuilding Database because a dependency changed... \033[0m"; \
		rm -f SMN.db; \
	else \
	  echo "Database do not exist. Now creating...."; \
	fi
	-rm 01_database_cleanup/cleanup_done.csv
	sh _import2database.sh

$(SUBDIRS): SMN.db
	$(MAKE) -C $@


clean:
	find . -type f ! -name "_*" ! -name "Makefile" ! -name "routes.dat" ! -name "README.md" | xargs rm


.PHONY: all $(SUBDIRS)