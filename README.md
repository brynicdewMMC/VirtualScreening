This repository contains all of the files used for Virtual Screening using AutoDock Vina w/o GPU acceleration

When prompted for a Ligand, the relative path must be given. For example, if copied exactly from repository, when prompted enter:

Ligands/Ligand.txt

Included:

Ligands - Contains the ligands used for this virtual screening. ~2500 ligands are stored inside a sdf file. Instructions for how to separate into individual pdbqts can be found in the Ligands directory. Library can be found here:

https://lifechemicals.com/screening-libraries/targeted-and-focused-screening-libraries/kinase-general-libraries/kinase-targeted-libraries/alk-tyrosine-kinase-focused-library

Receptors - STYK protein model that is used as the receptor for the virtual screening. This can be swapped out if another ligand is to be used

conf_vs.txt - Config file that contains parameters for running the virtual screening. Any changed that want to be made (grid size, receptor change, etc.) should occur here

vina_vs.pl - Perl script that executes running AutoDock Vina 

launch.sh - Shell script that runs the program

Instructions:

1. Separate ligands in the Ligands directory into individual files. Instructions can be found in the directory.
2. Add receptor to Receptor directory
3. Change receptor in conf_vs.txt. This is also when any changes to the config parameters can be made.
4. Run launch.sh
