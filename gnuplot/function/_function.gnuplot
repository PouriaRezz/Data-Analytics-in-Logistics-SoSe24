load "../_commonstyles.gnuplot"
set style data lines
set autoscale y

set terminal svg enhanced font 'Verdana,9'; set output 'function.svg'

set xlabel "Daytime"
set ylabel "Energy [kWh]"

f(x) = sin(x)

plot f(x) w l ls 2

#plot "chart.csv"