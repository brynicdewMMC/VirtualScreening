# Virtual Screening

This repository contains all of the files used for Virtual Screening using AutoDock Vina w/o GPU acceleration

When prompted for a Ligand, the relative path must be given. For example, if copied exactly from repository, when prompted enter:

Ligands/Ligand.txt

## Included:

Ligands - Contains the ligands used for this virtual screening. This will have to be changed when using a different ligand library. Just move/delete the old ligands folder and create a new one that holds the new library. Then follow Ligand_Prep.txt to separate into individual poses.

Receptors - STYK protein model that is used as the receptor for the virtual screening. This can be swapped out if another ligand is to be used

conf_vs.txt - Config file that contains parameters for running the virtual screening. Any changed that want to be made (grid size, receptor change, etc.) should occur here

screen.sh - Script for conducting the screening and submitting to slurm

output.pl - Script that parses through results to find most negative scores

## Instructions:

1. Follow instructions detailed in Ligand_Prep.txt found in the Ligands directory in order to separate ligands into individual files. If ligands are already separated PDBQT files inside the Ligand folder, this step can be ignored.
2. Add receptor to Receptor directory
3. Change receptor in conf_vs.txt. Make sure the file path is specified (Ex. "Receptor/ABC.pdb"). This is also when any changes to the config parameters can be made. Save any changes made before exiting.
4. Run "sbatch screen.sh." This will submit the job to slurm when run through the SBGrid environment. Update the job name at the top of the file for easier tracking through SLURM.
<img width="721" alt="image" src="https://github.com/user-attachments/assets/07b7460a-3d44-40da-bf49-217f3ba16c22" />

   If running locally, just run the script normally with "chmod +x screen.sh" followed by "./screen.sh"
   
5. Run "perl output.pl" to find the ligands with the most negative score. Currently checks for lowest 10, but can be updated in the file to look for more.
