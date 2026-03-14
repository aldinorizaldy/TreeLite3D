_base_ = ["../_base_/default_runtime.py"]
# misc custom setting
batch_size = 12  # bs: total bs in all gpus
mix_prob = 0
empty_cache = False
enable_amp = True

# model settings
model = dict(
    type="DefaultSegmentor",
    backbone=dict(
        type="PointTransformer-Seg50",
        in_channels=14,
        num_classes=19,
    ),
    criteria=[dict(type="CrossEntropyLoss", loss_weight=1.0, ignore_index=0)],
)


# scheduler settings
epoch = 500 # original: 3000
optimizer = dict(type="AdamW", lr=0.006, weight_decay=0.05)
scheduler = dict(type="MultiStepLR", milestones=[0.6, 0.8], gamma=0.1)

# dataset settings
dataset_type = "DFC2018Dataset"
data_root = "data/dfc2018"
ignore_index = 0
names = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
]

data = dict(
    num_classes=19,
    ignore_index=ignore_index,
    names=names,
    train=dict(
        type=dataset_type,
        split="train",
        data_root=data_root,
        transform=[
            # dict(type="RandomDropout", dropout_ratio=0.2, dropout_application_ratio=0.2),
            # dict(type="RandomRotateTargetAngle", angle=(1/2, 1, 3/2), center=[0, 0, 0], axis='z', p=0.75),
            dict(type="RandomRotate", angle=[-1, 1], axis="z", center=[0, 0, 0], p=0.5),
            # dict(type="RandomRotate", angle=[-1/6, 1/6], axis='x', p=0.5),
            # dict(type="RandomRotate", angle=[-1/6, 1/6], axis='y', p=0.5),
            dict(type="RandomScale", scale=[0.9, 1.1]),
            # dict(type="RandomShift", shift=[0.2, 0.2, 0.2]),
            dict(type="RandomFlip", p=0.5),
            dict(type="RandomJitter", sigma=0.005, clip=0.02),
            # dict(type="ElasticDistortion", distortion_params=[[0.2, 0.4], [0.8, 1.6]]),
            dict(
                type="GridSample",
                grid_size=0.12,
                hash_type="fnv",
                mode="train",
                keys=("coord", "color", "segment"),
                return_grid_coord=True,
            ),
            # dict(type="SphereCrop", point_max=1000000, mode="random"),
            # dict(type="CenterShift", apply_z=False),
            dict(type="NormalizeColor"),
            dict(type="ToTensor"),
            dict(
                type="Collect",
                keys=("coord", "grid_coord", "segment"),
                feat_keys=("coord", "color"),
            ),
        ],
        test_mode=False,
        ignore_index=ignore_index,
    ),
    val=dict(
        type=dataset_type,
        split="val",
        data_root=data_root,
        transform=[
            # dict(type="PointClip", point_cloud_range=(-51.2, -51.2, -4, 51.2, 51.2, 2.4)),
            dict(
                type="GridSample",
                grid_size=0.12,
                hash_type="fnv",
                mode="train",
                keys=("coord", "color", "segment"),
                return_grid_coord=True,
            ),
            # dict(type="SphereCrop", point_max=1000000, mode='center'),
            dict(type="NormalizeColor"),
            dict(type="ToTensor"),
            dict(
                type="Collect",
                keys=("coord", "grid_coord", "segment"),
                feat_keys=("coord", "color"),
            ),
        ],
        test_mode=False,
        ignore_index=ignore_index,
    ),
    test=dict(
        type=dataset_type,
        split="test",
        data_root=data_root,
        transform=[dict(type="CenterShift", apply_z=True), dict(type="NormalizeColor")],
        # transform=[
            # dict(type="Copy", keys_dict={"segment": "origin_segment"}),  
            # dict(type="Copy"),
            # dict(type="CenterShift", apply_z=True),
            # dict(type="NormalizeColor"),
            # dict(
                # type="GridSample",
                # grid_size=0.25,
                # hash_type="fnv",
                # mode="train",
                # keys=("coord", "color", "segment"),
                # return_inverse=True,
            # ),
        # ],
        test_mode=True,
        test_cfg=dict(
            voxelize=dict(
                type="GridSample",
                grid_size=0.12,
                hash_type="fnv",
                mode="test",
                return_grid_coord=True,
                keys=("coord", "color"),
            ),
            crop=None,
            post_transform=[
                dict(type="ToTensor"),
                dict(
                    type="Collect",
                    keys=("coord", "grid_coord", "index"),
                    feat_keys=("coord", "color"),
                ),
            ],
            aug_transform=[
                [dict(type="RandomScale", scale=[0.9, 0.9])],
                [dict(type="RandomScale", scale=[0.95, 0.95])],
                [dict(type="RandomScale", scale=[1, 1])],
                [dict(type="RandomScale", scale=[1.05, 1.05])],
                [dict(type="RandomScale", scale=[1.1, 1.1])],
                [
                    dict(type="RandomScale", scale=[0.9, 0.9]),
                    dict(type="RandomFlip", p=1),
                ],
                [
                    dict(type="RandomScale", scale=[0.95, 0.95]),
                    dict(type="RandomFlip", p=1),
                ],
                [dict(type="RandomScale", scale=[1, 1]), dict(type="RandomFlip", p=1)],
                [
                    dict(type="RandomScale", scale=[1.05, 1.05]),
                    dict(type="RandomFlip", p=1),
                ],
                [
                    dict(type="RandomScale", scale=[1.1, 1.1]),
                    dict(type="RandomFlip", p=1),
                ],
            ],
        ),
        ignore_index=ignore_index,
    ),
)
