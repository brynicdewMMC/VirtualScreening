#!/usr/bin/perl
use strict;
use warnings;

# Ask the user to input the name of the file containing the Vina output
print "Enter the path to the output text file:\t";
my $input_file = <STDIN>;
chomp $input_file;

# Open the input file
open my $fh, '<', $input_file or die "Cannot open file $input_file: $!\n";

# Variables to store ligand names and their best energy
my %ligand_energies;  # Hash to map ligand names to energies
my $current_ligand;   # Track the current ligand being processed

while (my $line = <$fh>) {
    chomp $line;
    
    # Detect the ligand file being processed (e.g., Ligands/ligand10.pdbqt)
    if ($line =~ /Processed ligand file: (\S+)/) {
        $current_ligand = $1;
    }
    
    # Check if the line contains the best energy using regex
    if ($line =~ /Best energy\s*(-?\d+\.\d+)\s*kcal\/mol/) {
        my $energy = $1;
        # Store the best energy for the current ligand
        $ligand_energies{$current_ligand} = $energy;
    }
}

# Close the input file
close $fh;

# Sort the ligands by their energies in ascending order (most negative first)
my @sorted_ligands = sort { $ligand_energies{$a} <=> $ligand_energies{$b} } keys %ligand_energies;

# Get the top 10 ligands with the most negative energies
my @top_10_ligands = @sorted_ligands[0..9];

# Print the 10 most negative energies along with their ligand names
print "Top 10 most negative energies and their ligands:\n";
foreach my $ligand (@top_10_ligands) {
    print "$ligand: $ligand_energies{$ligand} kcal/mol\n";
}

# Optionally, save the top 10 ligands and their energies to an output file
my $output_file = "top_10_negative_ligands.txt";
open my $out_fh, '>', $output_file or die "Cannot open file $output_file: $!\n";
print $out_fh "Top 10 most negative energies and their ligands:\n";
foreach my $ligand (@top_10_ligands) {
    print $out_fh "$ligand: $ligand_energies{$ligand} kcal/mol\n";
}
close $out_fh;

print "The top 10 most negative energies and ligands have been saved to $output_file\n";
