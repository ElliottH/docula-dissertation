#
# version 1
# adapted from http://www.bmsc.washington.edu/people/merritt/gnuplot/
#

set terminal pdf enhanced
set output 'timings.pdf'

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.5
set key invert samplen 0.2
set key samplen 0.2
set key center top
set bmargin 4
set offset 0,2,0,0

set tic scale 0
set xtics font "Helvetica, 5"

plot newhistogram "\n\nDirectFB" lt 1, \
     'timings.dat' index 0 u 2:xtic(1) title "Second Run", \
     '' index 0 u 3 title "Run Time", \
     '' index 0 u 4 title "Projected Run Time", \
     newhistogram "{/*0.75 freetype}" lt 1, \
     'timings.dat' index 1 u 2:xtic(1) notitle, \
     '' index 1 u 3 notitle, \
     '' index 1 u 4 notitle, \
     newhistogram "{/*0.75 ffmpeg}" lt 1, \
     'timings.dat' index 2 u 2:xtic(1) notitle, \
     '' index 1 u 3 notitle, \
     '' index 1 u 4 notitle, \
     newhistogram "{/*0.75 icu}" lt 1, \
     'timings.dat' index 3 u 2:xtic(1) notitle, \
     '' index 1 u 3 notitle, \
     '' index 1 u 4 notitle, \
     newhistogram "{/*0.75 VTK}" lt 1, \
     'timings.dat' index 4 u 2:xtic(1) notitle, \
     '' index 1 u 3 notitle, \
     '' index 1 u 4 notitle
