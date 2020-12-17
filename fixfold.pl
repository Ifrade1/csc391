use strict;
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
                           $RNA = substr($RNA, 0, $loc);
                           if ($rnaName eq ""){
                                   $rnaName = $RNA_FOLD.".plot";
                                   }
                                   #sends the vienna format to a file
                                   open (FILE_TO_WRITE, ">", "$rnaName")
                                        or die "Cannot open $rnaName to write: $!";
                                        print FILE_TO_WRITE "$RNA\n";
                                        close(FILE_TO_WRITE);
                                        if (-e $rnaName){
                                          #print "RNA were written to $rnaName file successfully!\n";
                                        }
