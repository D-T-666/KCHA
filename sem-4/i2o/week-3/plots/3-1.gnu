set term svg font "Times New Roman,18" size 400,300 fixed
set output "3-1.svg"

set border lw 1 lc "#000001"
set xtics textcolor "#000001"
set ytics textcolor "#000001"
set key textcolor "#000001"

set logscale y 10
set xtics 10000

plot "3-1.dat" using 0:1 w l lc "#000003" title columnheader, \
     "3-1.dat" using 0:2 w l lc "#000004" title columnheader