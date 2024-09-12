The sdf file contains the entire library of ligands that will be used for the virtual screening, which is ~2500 ligands. In order to begin the virtual screening, the library must be separated into individual PDBQT files. This can be done by using the following command:

obabel {LIBRARYNAME}.sdf -O ligand.pdbqt -m

Ex:

obabel LC_ALK_Tyrosine_Kinase_Focused_Library.sdf -O ligand.pdbqt -m

OpenBabel converts the file from SDF to PDBQT, and the -m argument puts each ligand in an individual file.
