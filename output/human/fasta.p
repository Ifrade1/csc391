set terminal postscript portrait noenhanced color colortext \
   dashed dashlength 1.0 linewidth 1.0 defaultplex \
   palfuncparam 2000,0.003 \
   butt "Helvetica" 16

set output 'fasta_output.ps'
set multiplot
plot "RNA14578.plot" with lines , "RNA14687.plot" with lines , "RNA16054.plot" with lines , "RNA18653.plot" with lines , "RNA20471.plot" with lines , "RNA23969.plot" with lines , "RNA2473.plot" with lines , "RNA2930.plot" with lines , "RNA31129.plot" with lines , "RNA3339.plot" with lines
unset multiplot
