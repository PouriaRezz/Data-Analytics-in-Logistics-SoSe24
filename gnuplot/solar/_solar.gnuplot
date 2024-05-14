set datafile separator ';'
set key autotitle columnhead
set timefmt "%Y-%m-%d %H:%M:%S"

set style data lines
set autoscale y
set xdata time
set format x "%H:%M"

#set terminal svg enhanced font 'Verdana,9'; set output 'solar.svg'

set xlabel "Daytime"
set ylabel "Energy [kWh]"

plot '_chart.csv' using 1:($2/1000) w l ls 1, \
    '' using 1:($3/1000) w l ls 2, \
    '' using 1:($4/1000) w l ls 3

#plot "chart.csv"