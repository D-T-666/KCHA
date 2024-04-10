#!/opt/local/bin/gnuplot -p

# set key at screen 1, 0.9 right top vertical Right noreverse enhanced autotitle nobox
# set style increment default
# set style textbox opaque margins  0.5,  0.5 fc  bgnd noborder linewidth  1.0
# set view 60, 30, 0.85, 1.1
# set samples 20, 20
set isosamples 100, 100
set pm3d
set palette rgb 30,31,32
set hidden3d
set contour base 
set cntrparam levels auto 10 unsorted
unset key
# set style data lines
# set title "more contours (15 levels)" 
# set xlabel "$\pi$" 
# set xrange [ * : * ] noreverse writeback
# set x2range [ * : * ] noreverse writeback
# set ylabel "Y axis" 
# set yrange [ * : * ] noreverse writeback
# set y2range [ * : * ] noreverse writeback
# set zlabel "Z " 
# set zlabel  offset character 1, 0, 0 font "" textcolor lt -1 norotate
# set zrange [ * : * ] noreverse writeback
# set cbrange [ * : * ] noreverse writeback
# set rrange [ * : * ] noreverse writeback
set terminal postscript eps size 3.5,2.62 enhanced color \
    font 'Helvetica,11' linewidth 2
set output "1-2-a-1.eps"

# change a color of border.
set border lw 1 lc rgb "white"

# change text colors of  tics
set xtics textcolor rgb "white"
set ytics textcolor rgb "white"

# change text colors of labels
set xlabel "X" textcolor rgb "white"
set ylabel "Y" textcolor rgb "white"

splot x**2 - y**2
