fout = '~/PhD/year-1/hagedorn/plots/gaussian.tex'

set output fout
set terminal cairolatex pdf size 6,7 #monochrome
set pm3d at b #border 
#set pm3d border 
set isosample 20,20

set size 1,1

#set palette

unset xtics 
unset ytics 
unset ztics 

e = 0.1 # epsilon


set xrange [-2:2]
set yrange [-2:2]
set view 50,10,1.5,1.5
set ticslevel 0.0

alpha = 0.5
w(x,y) = x**3 + x**4 + x**5 + 0.5*y**4
g0(x,y) = (pi * e)**(-0.5)*(1 + alpha**2)**(-0.5)*exp(-1/e * (x**2 + y**2)/(1 + alpha**2))
g1(x,y) = w(x,y)*(pi * e)**(-0.5)*(1 + alpha**2)**(-0.5)*exp(-1/e * (x**2 + y**2)/(1 + alpha**2))
g2(x,y) = x**3*y**2*w(x,y)*(pi * e)**(-0.5)*(1 + alpha**2)**(-0.5)*exp(-1/e * (x**2 + y**2)/(1 + alpha**2))
g3(x,y) = x**3*y**3*(pi * e)**(-0.5)*(1 + alpha**2)**(-0.5)*exp(-1/e * (x**2 + y**2)/(1 + alpha**2))
g4(x,y) = x**10*y**10*(pi * e)**(-0.5)*(1 + alpha**2)**(-0.5)*exp(-1/e * (x**2 + y**2)/(1 + alpha**2))
g5(x,y) = x**1*y**10*(pi * e)**(-0.5)*(1 + alpha**2)**(-0.5)*exp(-1/e * (x**2 + y**2)/(1 + alpha**2))

#          Stacked Plot Demo
#
# Set top and bottom margins to 0 so that there is no space between plots.
# Fix left and right margins to make sure that the alignment is perfect.
# Turn off xtics for all plots except the bottom one.
# In order to leave room for axis and tic labels underneath, we ask for
# a 4-plot layout but only use the top 3 slots.
#
set tmargin 0
set bmargin 0
set lmargin 3
set rmargin 3
unset xtics
unset ytics

set multiplot layout 4,2 title "Integrand\n" font ",12"
set samples 30; set isosamples 30
set hidden3d
set pm3d
set surface
set view 30,220,1.3,3
set ticslevel 0.0
unset xtics 
unset ytics 
unset ztics 

set colorbox user origin screen 0.9, screen 0.8 size screen 0.03, screen 0.15
unset colorbox
splot g0(x,y)
unset colorbox
splot g1(x,y)
unset colorbox
splot g2(x,y)
unset colorbox
splot g3(x,y)
unset colorbox
splot g4(x,y)
unset colorbox
splot g5(x,y)

unset multiplot
set output 
unset terminal


