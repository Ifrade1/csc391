#use strict;
#!/usr/bin/perl -w

#Takes in the file, removes spaces between lines 
my $RNA_FOLD = $ARGV[0];
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

my $RNA = substr($RNA, 0, $loc);
if ($rnaName eq ""){
        $rnaName = "v".$RNA_FOLD;
}
#sends the vienna format to a file
open (FILE_TO_WRITE, ">", "$rnaName")
     or die "Cannot open $rnaName to write: $!";
print FILE_TO_WRITE "$RNA\n";
close(FILE_TO_WRITE);
if (-e $rnaName){
  print "RNA were written to $rnaName file successfully!\n";
}

my $s = $RNA;
#print "$s\n";
print $loc;
my @stack = ();					#holds last known ( index
my @diffs = ();					#holds the distance between each () pair
my $curr;					#holds each character of $s per loop
my $dif;					#difference between ) - (
for (my $i = 0; $i < length($s); $i++) {
  $curr = substr($s, $i, 1);
  if ($curr =~ /\(/) {				#if curr char matches (
    push(@stack, $i);
  }
  elsif ($curr =~ /\)/) {			#if curr char matches )
    $dif = ($i - pop(@stack));			#set dif
    push(@diffs, $dif);				#append @diffs
  }
}

my $count = 0;					#adds all difs together
print "Diffs: ";
for (my $i = 0; $i < (scalar @diffs); $i++) {	
  print $diffs[$i].", ";			#print curr element of @diffs
  $count = $count + $diffs[$i];			#add $count to curr element
} print "\n";

my $avg = $count / scalar @diffs;		#average the values
print "Avg: $avg"."\n";				#print average
