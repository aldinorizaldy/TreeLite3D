#!/bin/bash
#SBATCH --job-name=PTv1_Trees
#SBATCH --gres=gpu:4
#SBATCH --output=%x-%A.out
#SBATCH --time=0-48:0:0
#SBATCH --cpus-per-gpu=30
#SBATCH --mem-per-gpu=40G
#SBATCH --nodes=1

module load singularity
srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 4 -d trees -c semseg-pt-v1-0-base -n trees_semseg-pt-v1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c semseg-pt-v1-0-base -n trees_semseg-pt-v1-0-base -r true
srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/test.sh -g 1 -p python -d trees -n trees_semseg-pt-v1-0-base -w model_best
