#!/usr/bin/perl -w
#use strict;
#Takes in the file, removes spaces between lines 
my $RNA_FOLD = $ARGV[0];
open (FILE_TO_READ, "<", "$RNA_FOLD")
  or die "Cannot open file $RNA_FOLD : $!";
my $RNA = '';
my $rnaName = "";
while (my $line = <FILE_TO_READ>) {
  if ($line !~ /^>/) {
    chomp($line);
    $RNA = $RNA.$line;
  }
  if ($line =~ /^>/) {
    chomp($line);
    $rnaName = $rnaName.$line;
  }

}
close (FILE_TO_READ);
my $filename = "$rnaName.txt";
$filename =~ s/[^A-Za-z0-9\-\.]//g;
$RNA=~ s/[^A-Za-z0-9\-\.]//g;
print $filename;
#!/usr/bin/perl
# Translate DNA into protein

use warnings;

use BeginPerlBioinfo;     # see Chapter 6 about this module

# Initialize variables
my $dna = $RNA;
my $protein = '';
# Translate each three-base codon into an amino acid, and append to a protein 

$protein = dna2peptide($dna);

open (FILE_TO_WRITE, ">", "$filename")             # ">" to overwrite
     or die "Cannot open $filename to write: $!";

print FILE_TO_WRITE $protein;
close(FILE_TO_WRITE);
if (-e $filename){ 
  print " genome is written to $filename file successfully!\n";
}
