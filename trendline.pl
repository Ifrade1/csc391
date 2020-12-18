#!/usr/bin/perl -w
#use strict;
#makes a plot file that is the average of multiple plots

my @files = glob("*.plot");
foreach $file (@files) {
  print "$file\n" if -f $file;
}

my @array;
my @temp;
my $j;
my $first = 1;

for (my $i = 0; $i < scalar @files; $i++) {
  open (FILE_TO_READ, "<", "$files[$i]") or die "yeet";
  $j = 0;
  while (my $line = <FILE_TO_READ>) {
    chomp($line);
    @temp = split / /, $line;

    if ($first) {
      $array[$j] = $temp[1];
    }
    else {
      $array[$j] = (int($array[$j]) + int($temp[1])) / 2;
    }

    $j++;
    $first = 0;
  }
}

open (FILE_TO_WRITE, ">", "tl.yeet") or die "bad";
for (my $i = 0; $i < scalar @array; $i++) {
  print FILE_TO_WRITE $i." ".$array[$i]."\n";
}

