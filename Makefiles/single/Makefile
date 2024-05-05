# this is a makefile
.PHONY=test

all: plot.svg

clean:
	rm measurements.csv
	rm processed.csv
	rm plot.csv

measurements.csv:
	$(info "====================================")
	$(info "Generating File measurements.csv....")
	touch measurements.csv
	@echo "Finished generating measurements.csv"
	$(info "This will be printed before the 'Finished' Message!")

processed.csv: measurements.csv
	$(info "====================================")
	$(info "generating processed.csv ....")
	touch processed.csv
	@echo "Finished generating processed.csv"

plot.svg: processed.csv
	$(info "====================================")
	$(info "generating plot.svg ....")
	touch plot.svg
	@echo "Finished generating plot.svg"

timeMeasurement:
	d=$$(date +%s)\
    ; sleep 3 \
    && echo "Build took $$(($$(date +%s)-d)) seconds"

