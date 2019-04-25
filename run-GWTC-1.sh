#!/bin/bash
#SBATCH -n 1 --ntasks 2 --cpus-per-task 4 -p cca -o logs/run.out -e logs/run.err

set -e

source ~/.bashrc
source activate
export PYTHONPATH="$PYTHONPATH:/mnt/home/wfarr/PISNLineCosmography"

NSEL=8192
./fit.py --nmix 3 --sampfile GWTC-1/GWTC-1-observations.h5 --selfile GWTC-1/GWTC-1-selected.h5 --nsel $NSEL --chainfile GWTC-1/GWTC-1-population.h5 --tracefile GWTC-1/GWTC-1-traceplot.pdf > GWTC-1/GWTC-1.out 2>&1 &
./fit.py --nmix 3 --cosmo-prior --sampfile GWTC-1/GWTC-1-observations.h5 --selfile GWTC-1/GWTC-1-selected.h5 --nsel $NSEL --chainfile GWTC-1/GWTC-1-population_cosmo.h5 --tracefile GWTC-1/GWTC-1-traceplot_cosmo.pdf > GWTC-1/GWTC-1_cosmo.out 2>&1 &

wait
