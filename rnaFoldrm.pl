
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

$RNA =~ tr/ACGUT//d;
$rnaName =~ tr/>//d;
my $len = length($RNA);
my $loc = index($RNA, " ");
print $loc;
my $RNA = substr($RNA, 0, $loc);

open (FILE_TO_WRITE, ">", "$rnaName")
     or die "Cannot open $filename to write: $!";
print FILE_TO_WRITE "$RNA\n";
print FILE_TO_WRITE "$RNA2";
close(FILE_TO_WRITE);
if (-e $filename){
  print "RNA were written to $filename file successfully!\n";
}
