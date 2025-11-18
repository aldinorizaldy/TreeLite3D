# 🌲 **TreeLite3D**  
### *3D tree segmentation and classification with minimal labels from LiDAR point clouds*

<p align="center">
  <img width="960" height="540" alt="Tree_Pointcloud Figures" src="https://github.com/user-attachments/assets/6165c7de-d0e6-41ff-a13e-d0ab43098838" />
  ![insseg_prediction](https://github.com/user-attachments/assets/5d0f8f22-31b4-4996-ad9a-0fb9cbf856f5)
  ![semseg_prediction](https://github.com/user-attachments/assets/081d7eab-dbbc-45e7-a1b3-7e2f11988a89)
</p>

---

## 📄 Paper  
📘 **Label-Efficient 3D Forest Mapping: Self-Supervised and Transfer Learning for Individual, Structural, and Species Analysis**  
🔗 *Read the paper on arXiv:* https://arxiv.org/abs/2511.06331

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

## 📢 Code Availability  
🔧 **The full codebase and pretrained models will be released upon publication.**

Stay tuned!
