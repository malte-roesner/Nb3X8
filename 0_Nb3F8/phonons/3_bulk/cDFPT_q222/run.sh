#!/bin/bash
#SBATCH -J cPhF
#SBATCH -N 2
#SBATCH --ntasks-per-node 192
#SBATCH --cpus-per-task 1
#SBATCH -p genoa
#SBATCH -t 5-00:00:00
#SBATCH --mem=240G

module load 2024
#module load QuantumESPRESSO/7.3.1-foss-2024a

module load foss/2024a
module load HDF5/1.14.5-gompi-2024a
module load ELPA/2024.05.001-foss-2024a
module load libxc/6.2.2-GCC-13.3.0

export OMP_NUM_THREADS=1

export PATH=$PATH:/home/mroesner/software/2025/qe/qe-7.4.1/bin

srun pw.x -nk 12 < scf.in > scf.out

d3hess.x < d3hess.in > d3hess.out

srun ph.x -nk 12 < ph.in > ph.out

q2r.x < q2r.in > q2r.out

matdyn.x < matdyn.in > matdyn.out
