my $RNA_FOLD = $ARGV[0];

open (FILE_TO_READ, "<", "$RNA_FOLD")
  or die "Cannot open file $RNA_FOLD : $!";
my $RNA;
while (my $line = <FILE_TO_READ>) {
  if ($line !~ /^>/) {
    chomp($line);
    $RNA = $RNA.$line;
  }
  elsif ($line !~/^@/){
    chomp($line);
    $rnaName = $rnaName.$line;
  }
}
close (FILE_TO_READ);

$RNA =~ tr/ACGU//d;
$rnaName =~ tr/>//d;
$rnaName =~ tr/, /_/;
$filename = "$rnaName.txt";

open (FILE_TO_WRITE, ">", "$filename")
     or die "Cannot open $filename to write: $!";
print FILE_TO_WRITE "$RNA";
close(FILE_TO_WRITE);
if (-e $filename){
  print "RNA were written to $filename file successfully!\n";
}
