#!/bin/bash
#SBATCH -J PhClBiRelax
#SBATCH -N 2
#SBATCH --ntasks-per-node 192
#SBATCH -p genoa
#SBATCH -t 3-00:00:00
#SBATCH --mem=240G

module load 2024
module load QuantumESPRESSO/7.3.1-foss-2024a

export OMP_NUM_THREADS=1

srun pw.x -nk 16 < relax.in > relax.out

