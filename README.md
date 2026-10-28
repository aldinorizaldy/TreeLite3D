# 🌲 **TreeLite3D**  
### *3D tree segmentation and classification with minimal labels from LiDAR point clouds*

<p align="center">
  <img width="75%" height="75%" alt="Overview" src="https://github.com/user-attachments/assets/03023cc2-e240-4ef6-95bf-e2311b035415" />
  <img width="480" height="270" alt="Tree_Pointcloud Figures" src="https://github.com/user-attachments/assets/74d94f6b-ba51-4c55-8243-2d17a62a8eaa" />
  <img width="480" height="270" alt="Tree_Pointcloud Figures" src="https://github.com/user-attachments/assets/42c27143-c0d3-484d-bd0b-1bcc088a3d28" />
</p>

---

## 📄 Paper  
📘 **Label-efficient 3D Forest Mapping: Self-Supervised and Transfer Learning for Instance Segmentation, Semantic Segmentation, and Species Classification**  
🔗 *Read the paper on Remote Sensing of Environment:* https://doi.org/10.1016/j.rse.2026.115564

---

## 🚀 Overview  
**TreeLite3D** explores how self-supervised and transfer learning can drastically reduce annotation requirements for 3D forest mapping. We develop and evaluate pretrained models for three major tasks:

### 🌳 Instance Segmentation  
Self-supervised learning on unlabeled point clouds combined with domain adaptation to improve generalization across forest types.

### 🌲 Semantic Segmentation  
Independent self-supervised pretraining to capture structural patterns without dense manual labels.

### 🌿 Tree Classification  
A hierarchical coarse-to-fine strategy enabling robust species-level classification, even with limited labeled data.

---

## 🎯 Few-Shot Learning Results  
Our experiments show that fine-tuning pretrained models:

- Provides strong gains over training from scratch  
- Improves stability in low-label regimes  
- Enhances transfer to unseen species and environments  
- Reduces training compute and carbon emissions  

These results highlight a practical path toward **label-efficient, scalable 3D forest analysis**.

---


## Pretrained Models and Sample Data
🔧 **Download the pretrained models and test with your data**

Download from [here](https://drive.google.com/drive/folders/12IYq9gx-p1BQntIBxKyNLWlb47LIeM3A?usp=drive_link) and put them in this directory: `exp/trees/TREE-UNIFIED_trees_insseg-pointgroup-v1m1-0-spunet-base`.

A sample data is also provided [here](https://drive.google.com/drive/folders/1O1MdVK4Gr579nCj6p3TmEg4XyD-dIKWu?usp=sharing). Put it in this directory: `data/trees_UNIFIED/test`

Instance and semantic segmentation results of a sample data:
<p align="center">
  <img width="25%" height="25%" alt="instance_result" src="https://github.com/user-attachments/assets/55a8cf99-1e27-4c15-b548-e707c43b4189" />
  <img width="25%" height="25%" alt="semantic_result" src="https://github.com/user-attachments/assets/bdea1113-5a2f-4384-abc7-1b8142076449" />
</p>

Custom data: Simply prepare your data similar to the sample data

--- 
## Installation
🔧 Docker installation is recommended for a clean installation. TreeLite3D is built using Pointcept 1.5.0. Install Pointcept 1.5.0 using docker from [here](https://hub.docker.com/layers/pointcept/pointcept/v1.5.0-pytorch1.11.0-cuda11.3-cudnn8-devel/images/sha256-8bdaf256670ec7e2f1a3472769ca9c97a1cb2b099f632ec20bf6050c21feb823)

---
## Inference and Training (if necessary)
Inference is straightforward:

```
sh scripts/test.sh -g 1 -p python -d trees -c TREE-UNIFIED-insseg-pointgroup-v1m1-0-spunet-base -n TREE-UNIFIED_trees_insseg-pointgroup-v1m1-0-spunet-base -w model_best
```

If necessary and to improve the segmentation results, simply label a few points per tree on your custom data and prepare it as pth files similar to the sample data. Put your training data in `data/trees_UNIFIED/train` then train:

```
sh scripts/train.sh -g 4 -d trees -c TREE-UNIFIED-insseg-pointgroup-v1m1-0-spunet-base -n TREE-UNIFIED_trees_insseg-pointgroup-v1m1-0-spunet-base
```

Note that I used 4 A100 GPUs. Configure the batch size in config file accordingly depending on your GPUs.
