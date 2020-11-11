#!/usr/bin/perl -w
#use strict;
#syntax: perl system.pl randomfilelist.txt


my $file = $ARGV[0];
my @array;
open (FILE_TO_READ,"<","$file") or die "failed 1";
while (my $line = <FILE_TO_READ>) {
  chomp($line);
  push(@array, $line);
}
close (FILE_TO_READ);

open (FILE_TO_WRITE, ">", "fasta.p") or die "failed 2";

print FILE_TO_WRITE "set output \'fasta_output.pdf\'\n";
print FILE_TO_WRITE "set multiplot\n";


for (my $i = 0; $i < scalar @array; $i++) {
  print FILE_TO_WRITE "plot "."\"$array[$i]\""." with lines\n";
}
print FILE_TO_WRITE "unset multiplot";
close (FILE_TO_WRITE);

system("gnuplot -persist  fasta.p");


#@my_array = <$file_handle>
#@my_array = <STDIN>
#if ($line =~ /set title/) do something

