Name : Register_Anat
Inputs : [[0, 'anats_for_registration']]
Outputs : [[0, 'deformation_for_warping']]
Emits : []


Name : Warp_Bundle
Inputs : [[0, 'anat_deformation_for_warp'], [1, 'atlas_bundles']]
Outputs : [[0, 'bundles_for_priors'], [0, 'models_for_recobundles']]
Emits : []


Name : Generate_Priors
Inputs : [[0, 'fod_mask_bundles_for_priors']]
Outputs : [[0, 'efod_for_tracking'], [1, 'fod_for_tracking'], [2, 'sid'], [3, 'masks_for_seeding'], [4, 'masks_for_tracking'], [5, 'masks_for_map_ex'], [6, 'masks_for_map_in']]
Emits : []


Name : Seeding_Mask
Inputs : [[0, 'masks_for_seeding']]
Outputs : [[0, 'seeding_mask_for_PFT_tracking'], [0, 'seeding_mask_for_local_tracking']]
Emits : []


Name : Tracking_Mask
Inputs : [[0, 'masks_for_tracking']]
Outputs : [[0, 'tracking_mask_for_local_tracking']]
Emits : []


Name : Local_Tracking
Inputs : [[0, 'mask_seeding_mask_fod_for_tracking'], [1, 'algo_list']]
Outputs : [[0, 'local_bundles_for_recobundles']]
Emits : []


Name : Generate_Map_Include
Inputs : [[0, 'masks_map_in_for_bs']]
Outputs : [[0, 'map_in_for_PFT_tracking']]
Emits : []


Name : Generate_Map_Exclude
Inputs : [[0, 'masks_map_ex_for_bs']]
Outputs : [[0, 'map_ex_for_PFT_tracking']]
Emits : []


Name : PFT_Tracking
Inputs : [[0, 'bundle_name'], [0, 'map_exclude'], [0, 'map_include'], [0, 'efod'], [0, 'sid'], [1, 'maps_seeding_mask_fod_for_tracking'], [2, 'algo_list']]
Outputs : [[0, 'pft_bundles_for_recobundles']]
Emits : []


Name : Recobundles_Segmentation
Inputs : [[0, 'bundles_models_for_recobundles']]
Outputs : [[0, 'bundles_for_outliers']]
Emits : []


Name : Outliers_Removal
Inputs : [[0, 'bundles_for_outliers']]
Outputs : []
Emits : []


