#!/bin/bash
#SBATCH --job-name=MSC_spunet
#SBATCH --gres=gpu:4
#SBATCH --output=%x-%A.out
#SBATCH --time=0-48:0:0
#SBATCH --cpus-per-gpu=30
#SBATCH --mem-per-gpu=40G
#SBATCH --nodes=1
# #SBATCH --nodelist=fwgegpu02

module load singularity

# pretraining (original uses 8 GPUs)
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 8 -d trees -c pretrain-msc-v1m1-0-spunet-base -n pretrain-msc-v1m1-0-spunet-base
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 4 -d trees -c pretrain-msc-v1m1-0-spunet-base -n pretrain-msc-v1m1-0-spunet-base
srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 4 -d trees -c pretrain-msc-v1m1-0-spunet-base -n pretrain-msc-v1m1-0-spunet-base-1200epoch
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 4 -d trees -c pretrain-msc-v1m1-0-spunet-base -n pretrain-msc-v1m1-0-spunet-base_checkgpu


# fine-tuning
# srun singularity exec --nv /home/rizald42/containers/pointcept_container.sif sh ../../scripts/train.sh -g 4 -d trees -w exp/trees/pretrain-msc-v1m1-0-spunet-base/model/model_last.pth -c insseg-pointgroup-v1m1-0-spunet-base -n insseg-msc-v1m1-0f-pointgroup-spunet-base