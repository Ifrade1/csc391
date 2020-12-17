#!/usr/bin/perl -w
#use strict;
use BeginPerlBioinfo; 
#Takes in the file, removes spaces between lines 
my $RNA_FOLD = $ARGV[0];
my $RNA;
my $rnaName = "";
open (FILE_TO_READ, "<", "$RNA_FOLD")
  or die "Cannot open file $RNA_FOLD : $!";
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
#The file has the RNA sequence at the begining. that needs to be removed.
$rnaName =~ tr/> //d;

#Gets rid of the energy value at the end
#my $protein = dna2peptide($RNA);
#sends the vienna format to a file
my $text = "fa";
my $fileW =  " $text _ $rnaName";
print $fileW;
=pod
open (FILE_TO_WRITE, ">", "$fileName")
     or die "Cannot open $fileName to write: $!";
#print FILE_TO_WRITE "$RNA\n";
close(FILE_TO_WRITE);
