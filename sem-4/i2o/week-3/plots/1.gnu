#!/opt/local/bin/gnuplot -p


set border lw 1 lc "#000001"
set xtics textcolor "#000001"
set ytics textcolor "#000001"
set xlabel "x" textcolor "#000001"
set ylabel "y" textcolor "#000001"
# set key textcolor "#000001"
unset key

set output "1.svg"

#  ==================

set isosamples 100,16
set hidden3d trianglepattern 1

set term svg font "Times New Roman,10" size 300,250 fixed

set xrange [-0.3:0.3]
set yrange [-0.05:0.15]

set xtics 0.2
set ytics 0.1
# set ztics 0.01
unset ztics

set view 60, 125

set xyplane at -0.01

set object circle at first 0,0,0 radius 0.004 fillstyle solid fillcolor rgb '#000002'
set object circle at first 0,0,0 radius 0.004 fillstyle solid fillcolor rgb '#000002'

splot 2*x**4 - 3*x**2*y + y**2 w l lc "#000002", 0 w l lc "#000001"


