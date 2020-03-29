#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --time=1:00:00
#SBATCH --job-name=diffusion
#SBATCH --mail-type=FAIL

module load gcc rarray hdf5 netcdf boost

for i in {1..16}
do
    export OMP_NUM_THREADS=$i
    	(time ./diffusion1d;)  2>> times.dat
    wait
done

