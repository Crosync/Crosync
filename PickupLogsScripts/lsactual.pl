#######################################################
#
# lists the epoch table for all (available) hosts
#
# command:
# perl lsactual.pl OR ccperl lsactual.pl
#
# zip or tar all the log files and "ship-it"
#
#######################################################


system "cleartool lsvob -s > lsvob.log";
open(fh,"lsvob.log");

@all_data=<fh>;
close(fh);

#
# get the log from the main host
#
foreach my $line (@all_data)
{
  chomp($line);
  my $ls = "multitool lsreplica -l -invob " . $line . " >> lsreplica.log\n";
  my $lr = "multitool lsreplica -invob " . $line . " -fmt \"%n %[master]p %[replica_host]p\\n\" >> t.log\n";
  my $le = "multitool lsepoch -invob " . $line . " >> lsepoch.log\n";
  print $ls;
  print $lr;
  print $le;
  system "${ls}";
  system "${lr}";
  system "${le}";
}

open(fh,"t.log");

@all_data=<fh>;
close(fh);

#
# get the actuals from the reachable hosts (VOB servers)
#
foreach my $line (@all_data)
{
  chomp($line);
  $line =~ m/(.+) (.+@)(.+) (.+)/;
  my $le = "multitool lsepoch -actual " . $1 . "@" . $3 . " >> " . $4 . ".log\n";
  print $le;
  system "${le}"; 
}
system "cleartool lsvob -l > lsvob.log";

print "YOU'RE DONE!\n\n";
print "Please zip or tar all the log files and ship-it-:)\n";
print "THANK YOU!";