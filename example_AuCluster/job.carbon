#!/bin/bash
#PBS -l nodes=1:ppn=16:gen6
#PBS -l walltime=00:30:00
#PBS -A user
#PBS -N casting_testrun
#PBS -o job.out
#PBS -j oe
#PBS -m ea

cd $PBS_O_WORKDIR

export PYTHONPATH=${PYTHONPATH}:$SANDBOX/bin/lammps/python
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$SANDBOX/bin/lammps/src

$SANDBOX/env-casting/bin/python -m CASTING inputs.json
