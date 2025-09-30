# TreeLite3D
3D tree segmentation and classification with minimal labels from LiDAR point clouds

<img width="960" height="540" alt="Tree_Pointcloud Figures" src="https://github.com/user-attachments/assets/6165c7de-d0e6-41ff-a13e-d0ab43098838" />

In this work, we leverage machine learning techniques to pretrain deep learning models for multiple downstream tasks in forestry, including instance segmentation, semantic segmentation, and tree classification. For instance segmentation, we combine self-supervised learning on unlabeled data with domain adaptation to improve performance across different forest environments. Semantic segmentation is performed independently using self-supervised learning, allowing the model to capture structural patterns without requiring extensive labeled data. Tree classification benefits from a coarse-to-fine pretraining strategy, which is particularly effective for distinguishing species-level differences. To support reproducibility and further research, all pretrained models developed in this study will be made publicly available upon publication.
