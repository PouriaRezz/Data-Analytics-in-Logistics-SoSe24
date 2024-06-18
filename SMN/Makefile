SUBDIRS := $(wildcard */.)

all: SMN.db $(SUBDIRS) output.html

output.html:  02_understanding_the_data/section.html
	sh _create_html.sh

SMN.db: _import2database.sh _postprocess_import.sql _create_smn_table.sql routes.dat
	-rm SMN.db
	sh _import2database.sh

$(SUBDIRS): SMN.db
	$(MAKE) -C $@


.PHONY: all $(SUBDIRS)