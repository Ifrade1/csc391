
my $DNA_FASTA = $ARGV[0];


open (FILE_TO_READ, "<", "$DNA_FASTA")
  or die "Cannot open file $DNA_FASTA : $!";
my $DNA;

while (my $line = <FILE_TO_READ>) {
 
  if ($line !~ /^>/) {
    chomp($line);
    $DNA = $DNA.$line;
  }
  else {
    chomp($line);
    $rnaName = $rnaName.$line;
  }

}
close (FILE_TO_READ);

my $RNA = $DNA;
$RNA =~ tr/ACGT/ACGU/;
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
