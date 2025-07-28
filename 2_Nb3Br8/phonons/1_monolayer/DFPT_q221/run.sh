#!/bin/bash
#SBATCH -J PhBrMl
#SBATCH -N 2
#SBATCH --ntasks-per-node 192
#SBATCH -p genoa
#SBATCH -t 3-00:00:00
#SBATCH --mem=0

module load 2024
module load QuantumESPRESSO/7.3.1-foss-2024a

export OMP_NUM_THREADS=1

srun pw.x -nk 12 < scf.in > scf.out

d3hess.x < d3hess.in > d3hess.out 

srun ph.x -nk 12 < ph.in > ph.out

q2r.x < q2r.in > q2r.out

matdyn.x < matdyn.in > matdyn.out

