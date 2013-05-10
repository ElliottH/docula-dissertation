# Where to put the legend
# and what it should contain
set terminal pdf
set output 'correct.pdf'

set style data histogram
set style histogram rowstacked
set style fill solid border -1
set boxwidth 0.5
set key autotitle columnheader
set key invert samplen 0.2
set key samplen 0.2

set xtics rotate scale 0

# We are plotting columns 2, 3 and 4 as y-values,
# the x-ticks are coming from column 1
plot 'correct.dat' using 2:xtic(1) \
    ,'' using 3 \
    ,'' using 4
