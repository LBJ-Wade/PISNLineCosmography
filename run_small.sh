#!/bin/bash
#SBATCH -n 1 --ntasks 4 --cpus-per-task 4 -p cca

set -e

source ~/.bashrc
source activate
export PYTHONPATH="$PYTHONPATH:/mnt/home/wfarr/PISNLineCosmography"

NSAMP=64
NSEL=8192

srun --pack-group=0 fit.py --sampfile parameters_small.h5 --samp $NSAMP --selfile selected.h5 --nsel $NSEL --chainfile population_small_free.h5 --tracefile traceplot_small_free.pdf --prior free
srun --pack-group=1 fit.py --sampfile parameters_small.h5 --samp $NSAMP --selfile selected.h5 --nsel $NSEL --chainfile population_small_Planck_Om_w.h5 --tracefile traceplot_small_Planck_Om_w.pdf --prior Planck-Om-w
srun --pack-group=2 fit.py --sampfile parameters_small.h5 --samp $NSAMP --selfile selected.h5 --nsel $NSEL --chainfile population_small_H0.h5 --tracefile traceplot_small_H0.pdf --prior H0
srun --pack-group=3 fit.py --sampfile parameters_small.h5 --samp $NSAMP --selfile selected.h5 --nsel $NSEL --chainfile population_small_H0_Planck_Om.h5 --tracefile traceplot_small_H0_Planck_Om.pdf --prior H0-Planck-Om
