#!/bin/bash
#SBATCH --job-name=TreePointGroup_EXP_1
#SBATCH --gres=gpu:4
#SBATCH --output=%x-%A.out
#SBATCH --time=0-48:0:0
#SBATCH --cpus-per-gpu=30
#SBATCH --mem-per-gpu=40G
#SBATCH --nodes=1

module load singularity
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base -n EXP_1_insseg-pointgroup-v1m1-0-spunet-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base -n EXP_1_insseg-pointgroup-v1m1-0-spunet-base -w model_best

# CULS, configs: TREE, model: TREE-PG
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_CULS_insseg-pointgroup-v1m1-0-spunet-base_TREE
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_CULS_insseg-pointgroup-v1m1-0-spunet-base_TREE -w model_best

# NIBIO, configs: TREE, model: TREE-PG
# threshold = 1 seems better balanced
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_NIBIO_insseg-pointgroup-v1m1-0-spunet-base_TREE
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_NIBIO_insseg-pointgroup-v1m1-0-spunet-base_TREE -w model_best
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -w exp/trees/EXP_1_forinstance/EXP_1_NIBIO_insseg-pointgroup-v1m1-0-spunet-base_TREE/model/model_best.pth -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_NIBIO_insseg-pointgroup-v1m1-0-spunet-base_TREE_CONT


# RMIT, configs: TREE, model: TREE-PG
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_RMIT_insseg-pointgroup-v1m1-0-spunet-base_TREE
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_RMIT_insseg-pointgroup-v1m1-0-spunet-base_TREE -w model_best

# SCION, configs: TREE, model: TREE-PG
# threshold = 1 seems better balanced
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_SCION_insseg-pointgroup-v1m1-0-spunet-base_TREE
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_SCION_insseg-pointgroup-v1m1-0-spunet-base_TREE -w model_best

# TUWIEN, configs: TREE, model: TREE-PG
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_TUWIEN_insseg-pointgroup-v1m1-0-spunet-base_TREE
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -c EXP_1_insseg-pointgroup-v1m1-0-spunet-base_TREE -n EXP_1_TUWIEN_insseg-pointgroup-v1m1-0-spunet-base_TREE -w model_best
