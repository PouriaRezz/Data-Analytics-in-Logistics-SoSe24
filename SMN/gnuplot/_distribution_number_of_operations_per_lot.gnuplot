load "_commonstyles.gnuplot"

set datafile separator ','
set key autotitle columnhead

set yrange [0:1]

set xlabel "lots per operation"
set ylabel "Cumulative probability"


set terminal svg ; set output 'probability_of_number_of_lots_per_operation.svg'

plot '../distribution_number_of_operations_per_lot.csv' using 2:3 smooth cumulative