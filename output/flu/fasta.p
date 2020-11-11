set terminal postscript portrait noenhanced color colortext \
   dashed dashlength 1.0 linewidth 1.0 defaultplex \
   palfuncparam 2000,0.003 \
   butt "Helvetica" 16
set output 'flu.ps'
#set multiplot
plot "1_flu.fa.txt.plot" with lines, "2_flu.fa.txt.plot" with lines, "4_flu.fa.txt.plot" with lines, "5_flu.fa.txt.plot" with lines, "6_flu.fa.txt.plot" with lines,  "7_flu.fa.txt.plot" with lines, "8_flu.fa.txt.plot" with lines
#unset multiplot


