# csc391

## Instructions
rna.pl takes a DNA fasta file, & converts it to a new RNA file

in order to produce a file with the RNA folded, you run this command in the RNAfold/bin directory:
> RNAfold < fastafile > rnafoldedfile

for instance:
> RNAfold < polio.fasta > polio.txt

rnaFoldrm.pl takes that new file, and removes the rna sequence. this program does not create a new file, it stores its contents in the original file's location 

### DevShell:
-use RNAfold on the fasta file of choice

> => RNAfold < fasta/test.fa > folded/test.txt
-run f2plot.pl on the resultant .txt file
> => f2plot.pl folded/test.txt > plots/test.plot


### Virtual Desktop
-open gnuplot
> => gnuplot
-plot the file
> => plot "plots/test.plot" with lines
