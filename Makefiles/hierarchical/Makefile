all: plot.svg

include folder1/Makefile folder2/Makefile

clean:
	rm /folder1/measurements.csv
	rm /folder2/processed.csv
	rm plot.csv

processed.csv: measurements1.csv measurements2.csv
	$(info "====================================")
	$(info "generating processed.csv ....")
	touch processed.csv
	@echo "Finished generating processed.csv"

plot.svg: processed.csv
	$(info "====================================")
	$(info "generating plot.svg ....")
	touch plot.svg
	@echo "Finished generating plot.svg"

