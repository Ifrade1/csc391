#!/usr/bin/perl -w
#use strict;
#this program takes the list (sampleSize), reads files from ccds
#and runs RNAfold on them, exporting to a file. 
my $rna_list =$ARGV[0];

open(FILE_TO_READ, "<",  "$rna_list")
	or die "Cannot open file $rna_list :$!";

my $file_name;
@rfiles = ();
@wfiles = ();
$fileNum = 0;
#$ccds = "ccds/";
while (my $line = <FILE_TO_READ>){
$file_name = chomp($line);
#$file_name = "output/$line";
#$line = $ccds.$line;
push(@rfiles, $line);
push(@wfiles, $file_name);
$line = "";
$file_name = "";
$fileNum++;
}
close(FILE_TO_READ);
for ($i = 0; $i < $fileNum; $i++){
open (FILE_TO_WRITE, ">", "$wfiles[$i]")
or die "Cannot open $wfiles[$i] to write: $!";
close(FILE_TO_WRITE);
system("RNAfold < $rfiles[$i] > $wfiles[$i]");
}

my $sSizelist = 'samplefolded.txt';
open (FILE_TO_WRITE, ">", "$sSizelist")
     or die "Cannot open $sSizelist to write: $!";
for ($i = 0; $i < $fileNum; $i++){
	print FILE_TO_WRITE "$wfiles[$i]\n";
}
