# Virtual Screening 
This repository contains all of the files used for Virtual Screening using AutoDock Vina w/o GPU acceleration.  Click Code and either copy URL for cloning or download the ZIP file. 

 
Note: When prompted for a Ligand, the relative path must be given. For example, if copied exactly from repository, when prompted enter: 
Ligands/Ligand.txt 
 
# Included: 
Ligands - Contains the ligands used for this virtual screening. This will have to be changed when using a different ligand library. Just move/delete the old ligands folder and create a new folder named “Ligands” that holds the new library. Then follow Ligand_Prep.txt to separate into individual poses. 
Receptors - STYK protein model that is used as the receptor for the virtual screening. This can be swapped out if another ligand is to be used 
conf_vs.txt - Config file that contains parameters for running the virtual screening. Any changed that want to be made (grid size, receptor change, etc.) should occur here. Num_modes = maximum number of poses generated per ligand. Energy range (in kcal/mol) sets which docking poses are kept relative to the best pose. If the best-scoring pose has an energy of -8.5 kcal/mol, then poses within 4 kcal/mol of this (e.g., -4.5 kcal/mol and better) will be kept. Exhaustiveness determines the thoroughness of the search. This run uses 20 for a more comprehensive search, however it can also be lowered to 8. 
screen.sh - Script for submitting the job to slurm to run in the background and conducting the screening 
output.pl - Script that parses through results to find and organize the most negative scores 
 
# Instructions: 
Follow instructions detailed in Ligand_Prep.txt found in the Ligands directory in order to separate ligands into individual files. If ligands are already separated PDBQT files inside the Ligand folder, this step can be ignored. Use the rm or mv command to remove the original file that held your database (Ex: “rm db.sdf”) 
 
Create an empty text file. For this, I will call it Ligands.txt. In the terminal, run the command “ls Ligands > Ligands.txt” to move the name of every ligand file into a text file. This will be used for reading the ligands later. 
 
Add receptor to Receptor directory. 
 
Change receptor in conf_vs.txt. Make sure the file path is specified (Ex. "Receptor/ABC.pdb"). This is also when any changes to the config parameters can be made.  
 
 
Save any changes made before exiting. Grid parameters can be viewed in AutoDock Tools before running the screening. Run "adt" in terminal and go to Grid->Grid Box to set your parameters. 
image 
Open screen.sh. Ensure the ligfile is set to the name of the file created in step 2. For this example, that would be Ligands.txt.  
 
Set the name of the logfile that contains the screening results.  
 
 
 
Set the correct config file 
 
 
 
 
Set the name of the directory holding the ligands 
 
 
Update the job name at the top of the file for easier tracking through SLURM. image 
Finally, run "sbatch screen.sh." This will submit the job to slurm when run through the SBGrid environment. 
 

If running locally, just run the script normally with "chmod +x screen.sh" followed by "./screen.sh" 
 
Run "perl output.pl" to find the ligands with the most negative score. Currently checks for lowest 10, but can be updated in the file to look for more. 
 
