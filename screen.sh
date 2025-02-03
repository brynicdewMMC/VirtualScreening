#!/bin/bash

#SBATCH --job-name=ABCA7_VS	            # Job name
#SBATCH --partition=relion-gpu-medium-g4dn  # Partition (queue) name
#SBATCH --nodes=1                           # Number of nodes
#SBATCH --ntasks=1                          # Number of tasks (usually set to 1 for serial jobs)
#SBATCH --cpus-per-task=128                  # Number of CPU cores per task
#SBATCH --mem=4G                            # Memory per node (4 GB in this example)
#SBATCH --gres=gpu:4			    # Number of GPUs to use

source /programs/sbgrid.shrc

# Set the path to the ligand file (list of ligand names)
ligfile="ChemBL_Ligands.txt"

# Check if the ligand file exists
if [[ ! -f "$ligfile" ]]; then
    echo "Error: Ligand file '$ligfile' does not exist."
    exit 1
fi

# Set the global log file name
global_logfile="ABCA7_ChemBL_VS.txt"

# Create or append to the log file
touch "$global_logfile"

# Configuration file for Vina
config_file="conf_vs.txt"

# Check if the configuration file exists
if [[ ! -f "$config_file" ]]; then
    echo "Error: Configuration file '$config_file' does not exist."
    exit 1
fi

# Directory containing ligand files
ligand_dir="ChemBL_Ligands"

# Read ligand names from the ligand file
while IFS= read -r ligand; do
    # Skip empty lines
    [[ -z "$ligand" ]] && continue

    echo "Processing ligand: $ligand"

    # Build the command for Vina
    command="vina --config $config_file --ligand $ligand_dir/$ligand"

    # Log the command being run
    echo "Running command: $command" | tee -a "$global_logfile"

    # Execute the Vina command, redirecting output and errors to the log file
    $command >> "$global_logfile" 2>&1
    exit_status=$?

    # Log the status of the command
    if [[ $exit_status -ne 0 ]]; then
        echo "Error running Vina on $ligand: $exit_status" | tee -a "$global_logfile"
    else
        echo "Processed ligand file: $ligand" | tee -a "$global_logfile"
    fi

done < "$ligfile"

echo "All ligands processed. Log saved to $global_logfile."
