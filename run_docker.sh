#!/bin/bash
echo ----------------------------------------------------------------------
echo $SWANEXE
echo with OpenMP on linux cluster, Nerdalize mod.
echo SGE_O_WORKDIR : $SWANDIR
echo ----------------------------------------------------------------------
### Copy swaninit
cd /data/RUN
### General, start SWAN.
cp $1.SWN INPUT
starttime=`date +%s`
$SWANEXE
endtime=`date +%s`

runtime=$((endtime-starttime))
echo ----------------------------------------------------------------------
echo "The run was completed after $((runtime / 60)) minutes"
echo ----------------------------------------------------------------------

cp PRINT "$1".PRT
rm INPUT
rm PRINT
rm swaninit
rm norm_end

mkdir -p /output
cp -R /data/RUN/* /output
