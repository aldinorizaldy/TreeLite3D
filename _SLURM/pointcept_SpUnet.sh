#!/bin/bash
#SBATCH --job-name=SpUnet_Trees
#SBATCH --gres=gpu:4
#SBATCH --output=%x-%A.out
#SBATCH --time=0-30:0:0
#SBATCH --cpus-per-gpu=30
#SBATCH --mem-per-gpu=40G
#SBATCH --nodes=1

module load singularity
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 1 -d trees -c semseg-spunet-v1m1-0-base -n trees_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c semseg-spunet-v1m1-0-base -n trees_semseg-spunet-v1m1-0-base -r true
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/test.sh -g 1 -p python -d trees -n trees_semseg-spunet-v1m1-0-base -w model_best

# CULS
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c semseg-spunet-v1m1-0-base -n CULS_trees_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -n CULS_trees_semseg-spunet-v1m1-0-base -w model_best

### COMPARE WITH AND WITHOUT GRAPH
# CULS with graph
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c semseg-spunet-v1m1-0-base_graph -n CULS_graph_trees_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -n CULS_graph_trees_semseg-spunet-v1m1-0-base -w model_best

# CULS with graph
srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/train.sh -g 4 -d trees -c semseg-spunet-v1m1-0-base -n CULS_no_graph_trees_semseg-spunet-v1m1-0-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../scripts/test.sh -g 1 -p python -d trees -n CULS_no_graph_trees_semseg-spunet-v1m1-0-base -w model_best
###