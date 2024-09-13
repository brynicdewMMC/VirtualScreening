# Virtual Screening

This repository contains all of the files used for Virtual Screening using AutoDock Vina w/ GPU acceleration

When prompted for a Ligand, the relative path must be given. For example, if copied exactly from repository, when prompted enter:

Ligands/Ligand.txt

## Included:

Ligands - Any ligand files should be placed in this directory. By default, there is a library where ~2500 ligands are stored inside a sdf file. Instructions for how to separate into individual pdbqts can be found in the Ligands directory. Library can be found here:

https://lifechemicals.com/screening-libraries/targeted-and-focused-screening-libraries/kinase-general-libraries/kinase-targeted-libraries/alk-tyrosine-kinase-focused-library

Receptors - Any receptor files should be placed in this directory. By default, there is the wild type of STYK

conf_vs.txt - Config file that contains parameters for running the virtual screening. Any changed that want to be made (grid size, receptor change, etc.) should occur here

vina_vs.pl - Perl script that executes running AutoDock Vina 

launch.sh - Shell script that runs the program

## Instructions:

1. Separate ligands in the Ligands directory into individual files. Go into Ligands directory and run convert.sh.

      Ensure it has execute permission by running:
      
      __chmod +x convert.sh__

      Then execute it.

      __./convert.sh__
2. Create maps.fld file for receptor. Here any changes to your grid will be saved, unlike with vina and the config file. If receptor is in pdbqt format follow instructions below
   1. Open receptor file in AutoDock Tools -> Read Molecule
     
      <img width="741" alt="image" src="https://github.com/user-attachments/assets/b354e5fa-3300-4ae8-a0c6-367424be2856">
 
   2. Grid -> MacroMolecule -> Choose -> Choose the desired receptor model.
      _If asked about gasteiger charges, click no and continue onwards_
      
      <img width="739" alt="image" src="https://github.com/user-attachments/assets/ad53fa6f-2bea-4efc-9c36-63a176e3806d">

   3. Grid -> Output -> Save GPF

      <img width="734" alt="image" src="https://github.com/user-attachments/assets/9034f2aa-5120-42a0-be5b-551cd028830f">

   4. Run grid.sh. Ensure it has execute permission by running:
      
      __chmod +x grid.sh__

      Then execute it. There is also an example GPF file provided associated with the WT receptor:

      __./grid.sh__

3. Run launch.sh. Ensure it has execute permission by running:
      
      __chmod +x launch.sh__

      Then execute it. Fill in the path for the receptor, ligands, and log file:

      __./launch.sh__

   For the STYK run you will want to enter
   
   Receptor file: _Receptors/WT_prepared.maps.fld_
   
   Ligand file: _Ligands.txt_
   
   Log file: _${FILENAME}.txt_
