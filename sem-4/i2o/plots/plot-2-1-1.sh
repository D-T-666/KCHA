#!/opt/local/bin/gnuplot -p


set border lw 1 lc "#000001"
set xtics textcolor "#000001"
set ytics textcolor "#000001"
set xlabel "x" textcolor "#000001"
set ylabel "y" textcolor "#000001"
# set key textcolor "#000001"
unset key

set output "../week-2/2-1-1.svg"

#  ==================

set isosamples 16
set hidden3d trianglepattern 2

set term svg font "Times New Roman,18"

set xrange [-0.1:0.3]
set yrange [-0.3:0.3]

set xtics 0.1
set ytics 0.1

set view 60, 45

set xyplane at -0.02

set object circle at first 0,0,0 radius 0.004 fillstyle solid fillcolor rgb '#000002'
set object circle at first 0,0,0 radius 0.004 fillstyle solid fillcolor rgb '#000002'

splot x**2 - 5*x*y**2 + 5*y**4 w l lc "#000002", 0 w l lc "#000001"
