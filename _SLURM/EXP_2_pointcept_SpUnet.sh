#!/bin/bash
#SBATCH --job-name=EXP_2_SpUnet
#SBATCH --gres=gpu:4
#SBATCH --output=%x-%A.out
#SBATCH --time=0-48:0:0
#SBATCH --cpus-per-gpu=30
#SBATCH --mem-per-gpu=40G
#SBATCH --nodes=1

module load singularity

# mostly, testing will run out of memory if it is executed directly after training
# send testing in a different job instead

# NIBIO
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_NIBIO_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_NIBIO_semseg-spunet-v1m1-0-base -w model_best

# SCION
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_SCION_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_SCION_semseg-spunet-v1m1-0-base -w model_best

# RMIT
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_RMIT_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_RMIT_semseg-spunet-v1m1-0-base -w model_best

# TUWIEN
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_TUWIEN_semseg-spunet-v1m1-0-base
srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_TUWIEN_semseg-spunet-v1m1-0-base -w model_best
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_2_semseg-spunet-v1m1-0-base -n EXP_2_TUWIEN_semseg-spunet-v1m1-0-base -w model_last
