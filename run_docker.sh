#!/bin/bash

set -e

# Process configuration a bit
INPUTFILE=$1
WORKDIR=`dirname "$1"`

# Adopt naming convention from input file
if [[ $INPUTFILE =~ \.[A-Z]+$ ]]
then
    OUTPUTFILE="${INPUTFILE%.*}.PRT"
else
    OUTPUTFILE="${INPUTFILE%.*}.prt"
fi

echo ----------------------------------------------------------------------
echo $SWANEXE
echo with OpenMP on linux cluster, Nerdalize mod.
#echo SGE_O_WORKDIR : $SWANDIR
echo INPUT FILE : $INPUTFILE
echo WORKING DIRECTORY : $WORKDIR
echo OUTPUT FILE : $OUTPUTFILE
echo ----------------------------------------------------------------------

# Switch to base working directory
cd $WORKDIR

# Rename input file for SWAN
cp $INPUTFILE INPUT

# Run SWAN
starttime=`date +%s`
$SWANEXE
endtime=`date +%s`

runtime=$((endtime-starttime))
echo ----------------------------------------------------------------------
echo "The run was completed after $((runtime / 60)) minutes"
echo ----------------------------------------------------------------------

# Process generated files into output and delete temporary files
mv PRINT $OUTPUTFILE
rm INPUT
rm -f swaninit
rm -f norm_end

cp -r . /output/
