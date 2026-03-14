_base_ = ["../_base_/default_runtime.py"]
# misc custom setting
batch_size = 12  # bs: total bs in all gpus
mix_prob = 0
empty_cache = False
enable_amp = True

# model settings
model = dict(
    type="DefaultSegmentorV2",
    num_classes=19,
    backbone_out_channels=64,
    backbone=dict(
        type="PT-v3m1",
        in_channels=14,
        order=["z", "z-trans", "hilbert", "hilbert-trans"],
        stride=(2, 2, 2, 2),
        enc_depths=(2, 2, 2, 6, 2),
        enc_channels=(32, 64, 128, 256, 512),
        enc_num_head=(2, 4, 8, 16, 32),
        enc_patch_size=(128, 128, 128, 128, 128),
        dec_depths=(2, 2, 2, 2),
        dec_channels=(64, 64, 128, 256),
        dec_num_head=(4, 4, 8, 16),
        dec_patch_size=(128, 128, 128, 128),
        mlp_ratio=4,
        qkv_bias=True,
        qk_scale=None,
        attn_drop=0.0,
        proj_drop=0.0,
        drop_path=0.3,
        shuffle_orders=True,
        pre_norm=True,
        enable_rpe=True,
        enable_flash=False,
        upcast_attention=True,
        upcast_softmax=True,
        cls_mode=False,
        pdnorm_bn=False,
        pdnorm_ln=False,
        pdnorm_decouple=True,
        pdnorm_adaptive=False,
        pdnorm_affine=True,
        pdnorm_conditions=("ScanNet", "S3DIS", "Structured3D"),
    ),
    criteria=[
        dict(type="CrossEntropyLoss", loss_weight=1.0, ignore_index=0),
        dict(type="LovaszLoss", mode="multiclass", loss_weight=1.0, ignore_index=0),
    ],
)


# scheduler settings
epoch = 500 # original: 3000
optimizer = dict(type="AdamW", lr=0.006, weight_decay=0.05)
scheduler = dict(
    type="OneCycleLR",
    max_lr=[0.006, 0.0006],
    pct_start=0.05,
    anneal_strategy="cos",
    div_factor=10.0,
    final_div_factor=1000.0,
)
param_dicts = [dict(keyword="block", lr=0.0006)]

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
