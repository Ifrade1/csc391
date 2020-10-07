close(FILE_TO_WRITE);
if (-e $rnaName){
  print "RNA were written to $rnaName file successfully!\n";
}                                                                                                                                           
                                                                                                                                            
my $s = $RNA;
#print "$s\n";
my @stack = ();                                 #holds last known ( index
my @diffs = ();                                 #holds the distance between each () pair
my $curr;                                       #holds each character of $s per loop
my $dif;                                        #difference between ) - (
for (my $i = 0; $i < length($s); $i++) {
  $curr = substr($s, $i, 1);
  if ($curr =~ /\(/) {                          #if curr char matches (
    push(@stack, $i);
  }                                                                                                                                         
  elsif ($curr =~ /\)/) {                       #if curr char matches )
    $dif = ($i - pop(@stack));                  #set dif
    push(@diffs, $dif);                         #append @diffs
  }                                                                                                                                         
}
                                                                                                                                            
my $count = 0;                                  #adds all difs together
print "Diffs: ";
for (my $i = 0; $i < (scalar @diffs); $i++) {
  print $diffs[$i].", ";                        #print curr element of @diffs
  $count = $count + $diffs[$i];                 #add $count to curr element
} print "\n";
                                                                                                                                            
my $avg = $count / scalar @diffs;               #average the values
print "Avg: $avg"."\n";                         #print average
                                                                                                                          68,1          Bot
p
