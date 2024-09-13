# Virtual Screening

This repository contains all of the files used for Virtual Screening using AutoDock Vina w/ GPU acceleration

When prompted for a Ligand, the relative path must be given. For example, if copied exactly from repository, when prompted enter:

Ligands/Ligand.txt

## Included:

Ligands - Contains the ligands used for this virtual screening. ~2500 ligands are stored inside a sdf file. Instructions for how to separate into individual pdbqts can be found in the Ligands directory. Library can be found here:

https://lifechemicals.com/screening-libraries/targeted-and-focused-screening-libraries/kinase-general-libraries/kinase-targeted-libraries/alk-tyrosine-kinase-focused-library

Receptors - STYK protein model that is used as the receptor for the virtual screening. This can be swapped out if another ligand is to be used

conf_vs.txt - Config file that contains parameters for running the virtual screening. Any changed that want to be made (grid size, receptor change, etc.) should occur here

vina_vs.pl - Perl script that executes running AutoDock Vina 

launch.sh - Shell script that runs the program

## Instructions:

1. Separate ligands in the Ligands directory into individual files. Instructions can be found in the directory.
2. Create maps.fld file for receptor. If receptor is in pdbqt format follow instructions below
   1. Open receptor file in AutoDock Tools -> Read Molecule
     <img width="741" alt="image" src="https://github.com/user-attachments/assets/b354e5fa-3300-4ae8-a0c6-367424be2856">
 
   2. Grid -> MacroMolecule -> Choose -> Choose the desired receptor model.
      _If asked about gasteiger charges, click no and continue onwards_
   <img width="739" alt="image" src="https://github.com/user-attachments/assets/ad53fa6f-2bea-4efc-9c36-63a176e3806d">

   3. Grid -> Output -> Save GPF
      <img width="734" alt="image" src="https://github.com/user-attachments/assets/9034f2aa-5120-42a0-be5b-551cd028830f">

   4. In the terminal, in the same directory the receptor and the recently generated GPF file, run the command:
      _Replace {$FILENAME} with actual filename. Do not include brackets_
      __touch {$FILENAME}.glg__
      
   5. Run the command:
      autogrid4 -p {$FILENAME}.gpf {$FILENAME}.glg 
  
3. 
   7. f
   8. f
   9. f
   10. d
   11. 
