fout = 'hagedorn_coeff.tex'

set output fout
set terminal cairolatex pdf size 5,3


e = 0.05 # epsilon
# plot a0, ..., a4 as a function of the mom. shift. delta
c0(d, e) = exp(-d**2/(4*e))
c1(d, e) = sqrt(2/e)*e*c0(d,e)*d/(2*e)
c2(d, e) = sqrt(2)/e*e**2*c0(d,e)*(d**2/(4*e**2) + 1/(2*e)) - 1/(sqrt(2))*c0(d,e)
c3(d, e) = 2*e**3/(sqrt(3*e**3)) * c0(d,e) * (d**3/(2*e)**3 + d/(4*e**2)) - 3/(sqrt(3*e)) *e*c0(d,e)*d/(2*e) 
#c4(d, e) = sqrt(2/e)*e*d/(2*e)*c0(d,e)

#array QC[3] = [0.01, 0.05, 0.1] #what is the size of the transition for each q_c 


set xrange [0:1]
set xlabel '$\delta$'
set ylabel '$|c_k|$'
set title '$\epsilon = 0.05$'

plot [0:1] c0(x, e) title '$k=0$', c1(x, e) title '$k=1$', c2(x, e) title '$k=2$', abs(c3(x,e)) title '$k=3$'

set output 
unset terminal

