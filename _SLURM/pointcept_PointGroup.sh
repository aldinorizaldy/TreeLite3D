#!/bin/bash
#SBATCH --job-name=PointGroup_Trees
#SBATCH --gres=gpu:4
#SBATCH --output=%x-%A.out
#SBATCH --time=0-48:0:0
#SBATCH --cpus-per-gpu=30
#SBATCH --mem-per-gpu=40G
#SBATCH --nodes=1

module load singularity
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c insseg-pointgroup-v1m1-0-spunet-base -n CULS_trees_insseg-pointgroup-v1m1-0-spunet-base
srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c insseg-pointgroup-v1m1-0-spunet-base -n CULS_trees_insseg-pointgroup-v1m1-0-spunet-base -w model_best

# Check test.py to get semantic and instance segmentation results