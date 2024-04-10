#!/opt/local/bin/gnuplot -p

set isosamples 100, 100
set pm3d
set palette rgb 30,31,32
set hidden3d
set contour base 
set cntrparam levels auto 10 unsorted
unset key
set terminal postscript eps size 3.5,2.62 enhanced color \
    font 'Helvetica,11' linewidth 2

# change a color of border.
set border lw 1 lc rgb "white"

# change text colors of  tics
set xtics textcolor rgb "white"
set ytics textcolor rgb "white"

# change text colors of labels
set xlabel "X" textcolor rgb "white"
set ylabel "Y" textcolor rgb "white"

set output "1-2-a-2.eps"
splot x**2 + y**2
