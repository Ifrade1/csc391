#!/usr/bin/perl -w
#use strict;
#splits a multifasta file into individual files in local directory

my $RNA_FOLD = $ARGV[0];
open (FILE_TO_READ, "<", "$RNA_FOLD")
  or die "Cannot open file $RNA_FOLD : $!";
my $s = -1;
my $RNA;
my $rnaName = "";
my @array;
my @filenames;
while (my $line = <FILE_TO_READ>) {
  if ($line !~ /^>/) {
     chomp($line);
     $array[$s] = $array[$s].$line;
  }
  else {
    $s++; $RNA = "";
    $array[$s] = "";
    chomp($line);
    $rnaName = $line;
    $rnaName =~ tr/ //ds;
    push(@filenames, $rnaName);
  }
}
close (FILE_TO_READ);


for (my $i = 0; $i < scalar @filenames; $i++) {
  open (FILE_TO_WRITE, ">", $filenames[$i])
     or die "Cannot open $i to write: $!";
  print FILE_TO_WRITE "$array[$i]\n";
  close(FILE_TO_WRITE);
}
