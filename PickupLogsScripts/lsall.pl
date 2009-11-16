system "cleartool lsvob -s > lsvob.log";
open(fh,"lsvob.log");

@all_data=<fh>;
close(fh);

foreach my $line (@all_data)
{
  chomp($line);
  my $ls = "multitool lsreplica -l -invob " . $line . " >> lsreplica.log\n";
  my $le = "multitool lsepoch -invob " . $line . " >> lsepoch.log\n";
#  print $ls
  system "${ls}"; 
  system "${le}"; 
}
system "cleartool lsvob -l > lsvob.log";
