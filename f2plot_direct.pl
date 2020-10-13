#this file contains a slight modifcation that allows the program to run RNAfold on a fasta file. 

#!/usr/bin/perl -w
#use strict;

#Takes in the file, removes spaces between lines 

system("RNAfold < $ARGV[0] > $ARGV[1]"); #runs RNA fold
#Takes in the file, removes spaces between lines 
my $RNA_FOLD = $ARGV[1]; #sends output file to this program. 
open (FILE_TO_READ, "<", "$RNA_FOLD")
  or die "Cannot open file $RNA_FOLD : $!";
my $RNA;
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

#The file has the RNA sequence at the begining. that needs to be removed.
$RNA =~ tr/ACGUT//d;
$rnaName =~ tr/>//d;

#Gets rid of the energy value at the end
my $len = length($RNA);
my $loc = index($RNA, " ");

$RNA = substr($RNA, 0, $loc);
if ($rnaName eq ""){
        $rnaName = "v".$RNA_FOLD;
}

#sends the vienna format to a file
open (FILE_TO_WRITE, ">", "$rnaName")
     or die "Cannot open $rnaName to write: $!";
print FILE_TO_WRITE "$RNA\n";
close(FILE_TO_WRITE);
if (-e $rnaName){
  #print "RNA were written to $rnaName file successfully!\n";
}

my $s = $RNA;
my @stack = ();					#holds last known ( index
my @diffs = ();					#holds the distance between each () pair
my $curr;					#holds each character of $s per loop
my $dif;					#difference between ) - (

my $hash_size = 5000;
my %hash = ();					#unitialized hash
for (my $i = 1; $i < $hash_size + 1; $i++) {	#for keys 1-500
  $hash{$i} = 0;				#default 0
}

for (my $i = 0; $i < length($s); $i++) {
  $curr = substr($s, $i, 1);
  if ($curr =~ /\(/) {				#if curr char matches (
    push(@stack, $i);
  }
  elsif ($curr =~ /\)/) {			#if curr char matches )
    $dif = ($i - pop(@stack));			#set dif by popping stack
    push(@diffs, $dif);				#push @diffs
    if ($dif < $hash_size) {			#if the dif is under 500
      $hash{$dif} = $hash{$dif} + 1;		#iterate hash at key $i  
    }
    else {
      $hash{$hash_size} = $hash{$hash_size} + 1;#any value >= 500 is assigned to key(500)
    }
  }
}

for (my $i = 1; $i < $hash_size; $i++) {
  $hash{$i+1} = $hash{$i+1} + $hash{$i}; 	#divide each value by the total number of pairs
}

my $count = 0;					#adds all difs together
for (my $i = 0; $i < (scalar @diffs); $i++) {	
  #print $diffs[$i].", ";			#print curr element of @diffs
  $count = $count + $diffs[$i];			#add $count to curr element
}

#my $avg = $count / scalar @diffs;		#average the values
#print "Avg: $avg"."\n";			#print average

for (my $i = 1; $i < $hash_size + 1; $i++) {		#output in form "key value\n"
  print $i." ".$hash{$i}."\n";
}
