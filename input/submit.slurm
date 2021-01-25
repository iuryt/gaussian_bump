#!/bin/bash
#SBATCH --time=00-03:00
#SBATCH --job-name="MITgcm"
#SBATCH --mem-per-cpu=4G
#SBATCH --nodes=2 --ntasks-per-node=2
# Request no GPUs
#SBATCH --gres=gpu:M2050:1

module load cuda/8.0
source /home/isimoesdesousa/.bash_profile
mpiexec -n $SLURM_NTASKS ./mitgcmuv
