def extract_unique_atom_types(pdbqt_file):
    unique_atom_types = set()

    with open(pdbqt_file, 'r') as file:
        for line in file:
            if line.startswith("ATOM") or line.startswith("HETATM"):
                atom_type = line.split()[-1]  # The atom type is the last column
                unique_atom_types.add(atom_type)

    return sorted(unique_atom_types)

def main():
    pdbqt_file = input("Enter the path to your PDBQT file: ")
    atom_types = extract_unique_atom_types(pdbqt_file)

    print("Unique atom types found in the PDBQT file:")
    for atom_type in atom_types:
        print(atom_type)

if __name__ == "__main__":
    main()

