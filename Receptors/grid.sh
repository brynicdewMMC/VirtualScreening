#!/bin/zsh

source /programs/sbgrid.shrc

echo "What is the name of the GPF file? Include .gpf at the end"

read gpf_file

echo "What would you like to call the generated GLG file? Include .glg at the end"

read glg_file

touch "$glg_file"

autogrid4 -p $gpf_file $glg_file
