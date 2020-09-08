#!/bin/bash
#SBATCH -J CUDA_MonteCarlo
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o CUDA_MonteCarlo.out
#SBATCH -e CUDA_MonteCarlo.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=<email>
for b in 16 32 64 128
do
	for t in 16384 32768 65536 131072 262144 524288 1024000
	do
		/usr/local/apps/cuda/cuda-10.1/bin/nvcc -DBLOCKSIZE=$b -DNUMTRIALS=$t -o CUDA_MonteCarlo CUDA_MonteCarlo.cu
		./CUDA_MonteCarlo
	done
done
