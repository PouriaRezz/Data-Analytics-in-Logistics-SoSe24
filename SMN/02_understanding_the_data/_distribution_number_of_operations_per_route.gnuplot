load "../_commonstyles.gnuplot"

set datafile separator ','
set key autotitle columnhead

set yrange [0:1]

set xlabel "Operations per route"
set ylabel "Cumulative probability"


set terminal svg ; set output 'probability_of_number_of_operations_per_route.svg'

plot '../distribution_number_of_operations_per_route.csv' using 1:3 smooth cumulative