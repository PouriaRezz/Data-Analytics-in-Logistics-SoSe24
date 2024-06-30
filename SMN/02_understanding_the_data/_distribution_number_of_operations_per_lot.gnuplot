load "../_commonstyles.gnuplot"

set datafile separator ','
set key autotitle columnhead

set yrange [0:1]

set xlabel "number of operations per lot"
set ylabel "Cumulative probability"


set terminal svg ; set output 'probability_of_number_of_operations_per_lot.svg'

plot 'distribution_number_of_operations_per_lot.csv' using 1:3 smooth cumulative