OPERATION_1 string : in_data = Channel
        .fromFilePairs("$root/**/{*fa.nii.gz,*fodf.nii.gz,*tracking_mask.nii.gz}",
                        size: 3,
                        maxDepth:2,
                        flat: true) {it.parent.name}
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_data', 'P']]


OPERATION_2 string : map_pft = Channel
        .fromFilePairs("$root/**/{*map_exclude.nii.gz,*map_include.nii.gz}",
                        size: 2,
                        maxDepth:2,
                        flat: true) {it.parent.name}
OPERATION_2 origin : []
OPERATION_2 gives  : [['map_pft', 'P']]


OPERATION_3 string : atlas_anat = Channel.fromPath("$params.atlas_anat")
OPERATION_3 origin : [['"$params.atlas_anat"', 'A']]
OPERATION_3 gives  : [['atlas_anat', 'P']]


OPERATION_4 string : atlas_bundles = Channel.fromPath("$params.atlas_directory/*.trk")
OPERATION_4 origin : [['"$params.atlas_directory/*.trk"', 'A']]
OPERATION_4 gives  : [['atlas_bundles', 'P']]


OPERATION_5 string : anat_for_registration, anat_for_deformation, fod_and_mask_for_priors = in_data
    .map{sid, anat, fodf, tracking_mask -> 
        [tuple(sid, anat),
        tuple(sid, anat),
        tuple(sid, fodf, tracking_mask)]}
    .separate(3)
OPERATION_5 origin : [['in_data', 'P']]
OPERATION_5 gives  : [['anat_for_registration', 'P'], ['anat_for_deformation', 'P'], ['fod_and_mask_for_priors', 'P']]


OPERATION_6 string : map_in_for_tracking, map_ex_for_tracking = map_pft
    .map{sid, map_exclude , map_include -> 
        [tuple(sid, map_include),
        tuple(sid, map_exclude)]}
    .separate(2)
OPERATION_6 origin : [['map_pft', 'P']]
OPERATION_6 gives  : [['map_in_for_tracking', 'P'], ['map_ex_for_tracking', 'P']]


OPERATION_7 string : anat_for_registration
    .combine(atlas_anat)
    .set{anats_for_registration}PROCESS DEF Register_Anat
OPERATION_7 origin : [['anat_for_registration', 'P'], ['atlas_anat', 'P']]
OPERATION_7 gives  : [['anats_for_registration', 'P']]


OPERATION_8 string : anat_for_deformation
    .join(deformation_for_warping)
    .set{anat_deformation_for_warp}PROCESS DEF Warp_Bundle
OPERATION_8 origin : [['anat_for_deformation', 'P'], ['deformation_for_warping', 'P']]
OPERATION_8 gives  : [['anat_deformation_for_warp', 'P']]


OPERATION_9 string : fod_and_mask_for_priors
    .combine(bundles_for_priors, by: 0)
    .set{fod_mask_bundles_for_priors}
OPERATION_9 origin : [['fod_and_mask_for_priors', 'P']]
OPERATION_9 gives  : [['fod_mask_bundles_for_priors', 'P']]


OPERATION_10 string : efod_for_tracking
        .into{fod_for_local_tracking; fod_for_PFT_tracking}
OPERATION_10 origin : [['efod_for_tracking', 'P']]
OPERATION_10 gives  : [['fod_for_local_tracking', 'P'], ['fod_for_PFT_tracking', 'P']]


OPERATION_11 string : fod_for_tracking
        .into{fod_for_local_tracking; fod_for_PFT_tracking}
OPERATION_11 origin : [['fod_for_tracking', 'P']]
OPERATION_11 gives  : [['fod_for_local_tracking', 'P'], ['fod_for_PFT_tracking', 'P']]


OPERATION_12 string : tracking_mask_for_local_tracking
    .combine(fod_for_local_tracking, by: [0,1])
    .combine(seeding_mask_for_local_tracking, by: [0,1])
    .set{mask_seeding_mask_fod_for_tracking}PROCESS DEF Local_Tracking
OPERATION_12 origin : [['tracking_mask_for_local_tracking', 'P']]
OPERATION_12 gives  : [['mask_seeding_mask_fod_for_tracking', 'P']]


OPERATION_13 string : map_in_for_tracking
    .combine(masks_for_map_in, by: 0)
    .set{masks_map_in_for_bs}PROCESS DEF Generate_Map_Include
OPERATION_13 origin : [['map_in_for_tracking', 'P']]
OPERATION_13 gives  : [['masks_map_in_for_bs', 'P']]


OPERATION_14 string : map_ex_for_tracking
    .combine(masks_for_map_ex, by: 0)
    .set{masks_map_ex_for_bs}PROCESS DEF Generate_Map_Exclude
OPERATION_14 origin : [['map_ex_for_tracking', 'P']]
OPERATION_14 gives  : [['masks_map_ex_for_bs', 'P']]


OPERATION_15 string : map_ex_for_PFT_tracking
    .combine(map_in_for_PFT_tracking, by: [0,1])
    .combine(fod_for_PFT_tracking, by: [0,1])
    .combine(seeding_mask_for_PFT_tracking, by: [0,1])
    .set{maps_seeding_mask_fod_for_tracking}PROCESS DEF PFT_Tracking
OPERATION_15 origin : [['map_ex_for_PFT_tracking', 'P']]
OPERATION_15 gives  : [['maps_seeding_mask_fod_for_tracking', 'P']]


OPERATION_16 string : local_bundles_for_recobundles
    .concat(pft_bundles_for_recobundles)
    .set{bundles_for_recobundles}
OPERATION_16 origin : [['local_bundles_for_recobundles', 'P'], ['pft_bundles_for_recobundles', 'P']]
OPERATION_16 gives  : [['bundles_for_recobundles', 'P']]


OPERATION_17 string : bundles_for_recobundles
    .combine(models_for_recobundles, by: [0,1])
    .set{bundles_models_for_recobundles}PROCESS DEF Recobundles_Segmentation
OPERATION_17 origin : [['bundles_for_recobundles', 'P']]
OPERATION_17 gives  : [['bundles_models_for_recobundles', 'P']]


