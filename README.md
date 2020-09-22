# csc391

## Instructions
rna.pl takes a DNA fasta file, & converts it to a new RNA file

in order to produce a file with the RNA folded, you run this command in the RNAfold/bin directory:
> RNAfold < fastafile > rnafoldedfile

for instance:
> RNAfold < polio.fasta > polio.txt

rnaFoldrm.pl takes that new file, and removes the rna sequence. this program does not create a new file, it stores its contents in the original file's location 
