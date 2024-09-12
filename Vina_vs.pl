#!/usr/bin/perl
use strict;
use warnings;

print "Ligand_file:\t";
my $ligfile = <STDIN>;
chomp $ligfile;

# Open the file containing ligand names
open my $fh, '<', $ligfile or die "Cannot open file $ligfile: $!\n";
my @arr_file = <$fh>;
close $fh;

# Define the global log file name
my $global_logfile = 'Global_Log.txt';

# Open the global log file for appending
open my $log_fh, '>>', $global_logfile or die "Cannot open log file $global_logfile: $!\n";

foreach my $line (@arr_file) {
    chomp $line;
    print "$line\n";
    
    # Build the command for Vina
    my $command = "vina --config conf_vs.txt --ligand $line";
    
    # Redirect both stdout and stderr to the global log file
    my $full_command = "$command >> $global_logfile 2>&1";
    
    print "Running command: $full_command\n";
    
    # Execute the Vina command
    my $exit_status = system($full_command);
    
    if ($exit_status != 0) {
        print $log_fh "Error running Vina on $line: $?\n";
    } else {
        print $log_fh "Processed ligand file: $line\n";
    }
}

# Close the log file handle
close $log_fh;
