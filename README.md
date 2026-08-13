# 🌲 **TreeLite3D**  
### *3D tree segmentation and classification with minimal labels from LiDAR point clouds*

<p align="center">
  <img width="50%" height="50%" alt="Overview" src="https://github.com/user-attachments/assets/03023cc2-e240-4ef6-95bf-e2311b035415" />
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


## Pretrained Models
🔧 **Download the pretrained models and test with your data.**

Download from [here](https://drive.google.com/drive/folders/12IYq9gx-p1BQntIBxKyNLWlb47LIeM3A?usp=drive_link) and put them in this directory: `exp/trees/TREE-UNIFIED_trees_insseg-pointgroup-v1m1-0-spunet-base`.

A sample data is also provided [here](https://drive.google.com/drive/folders/1O1MdVK4Gr579nCj6p3TmEg4XyD-dIKWu?usp=sharing) and put in this directory: `data/trees_UNIFIED/test`
