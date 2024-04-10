set term svg font "Times New Roman,18" size 800,300 fixed
set output "3-3.svg"

set border lw 1 lc "#000001"
set xtics textcolor "#000001"
set ytics textcolor "#000001"
set key textcolor "#000001"

set logscale y 10
set xtics 260

plot "3-3.dat" using 0:1 w l lc "#000003" title columnheader, \
     "3-3.dat" using 0:2 w l lc "#000004" title columnheader