#!/usr/bin/perl
use strict;
use warnings;

# Get receptor maps.fld file
print "Enter the path to the receptor maps.fld file:\t";
my $recfile = <STDIN>;
chomp $recfile;

# Get ligand file
print "Enter the path to the ligand file (file containing list of ligand names):\t";
my $ligfile = <STDIN>;
chomp $ligfile;

#Generate log file
print "Enter the name of the log file"
my $global_logfile = <STDIN>
chomp $global_logfile

# Open the file containing ligand names
open my $fh, "<", $ligfile or die "Cannot open file $ligfile: $!\n";
my @arr_file = <$fh>;
close $fh;

# Directory where ligand files are located
my $ligand_dir = "Ligands";

# Open the global log file for appending
open my $log_fh, ">>", $global_logfile or die "Cannot open log file $global_logfile: $!\n";

foreach my $line (@arr_file) {
    chomp $line;
    
    # Build the full path to the ligand file inside the Ligands directory
    my $ligand_path = "$ligand_dir/$line";
    
    print "Processing ligand: $ligand_path\n";
    
    # Build the command for Vina
    my $command = "autodock_gpu_128wi --ffile $recfile --lfile $ligand_path";
    
    # Redirect both stdout and stderr to the global log file
    my $full_command = "$command >> $global_logfile 2>&1";
    
    print "Running command: $full_command\n";
    
    # Execute the Vina command
    my $exit_status = system($full_command);
    
    if ($exit_status != 0) {
        print $log_fh "Error running Vina on $ligand_path: $?\n";
    } else {
        print $log_fh "Processed ligand file: $ligand_path\n";
    }
}

# Close the log file handle
close $log_fh;
