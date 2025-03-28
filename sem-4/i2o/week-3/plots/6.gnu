set term svg font "Times New Roman,18" size 800,300 fixed
set output "6.svg"

set border lw 1 lc "#000001"
set xtics textcolor "#000001"
set ytics textcolor "#000001"
set key textcolor "#000001"
unset key

set style line 1 lc rgb "#000002"
set style line 2 lc rgb "#000002"

set style fill solid

set yrange [0:65]
set boxwidth 0.05 
set style data histogram
set style histogram cluster gap 1

set grid ytics
plot "6.dat" using 1:2 with boxes ls 1
