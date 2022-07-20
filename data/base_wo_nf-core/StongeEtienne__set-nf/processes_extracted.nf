Name : README
Inputs : []
Outputs : []
Emits : []


Name : A__Convert_Freesurfer_Surface
Inputs : [[0, 'freesurfer_surfaces_to_convert']]
Outputs : [[0, 'surfaces_for_surfaces_masks'], [0, 'surfaces_for_surfaces_labels'], [1, 'surfaces_for_lps']]
Emits : []


Name : A__Civet_Template
Inputs : []
Outputs : [[0, 'in_civet_template']]
Emits : []


Name : A__Convert_CIVET_Surface
Inputs : [[0, 'civet_surfaces_to_convert']]
Outputs : [[0, 'surfaces_for_surfaces_masks'], [0, 'surfaces_for_surfaces_labels'], [1, 'surfaces_for_lps']]
Emits : []


Name : A__Convert_Animal
Inputs : [[0, 'animal_to_convert']]
Outputs : [[0, 'label_vol_to_convert']]
Emits : []


Name : A__Convert_Label_Volume
Inputs : [[0, 'label_vol_to_convert']]
Outputs : [[0, 'label_vol_for_rois']]
Emits : []


Name : A__Surface_to_LPS
Inputs : [[0, 'surfaces_for_lps']]
Outputs : [[0, 'surfaces_to_concatenate']]
Emits : []


Name : B__Surface_Mask
Inputs : [[0, 'data_for_surfaces_masks']]
Outputs : [[0, 'masks_for_concatenate']]
Emits : []


Name : B__Surface_Label
Inputs : [[0, 'data_for_surfaces_labels']]
Outputs : [[0, 'labels_for_cocatenate']]
Emits : []


Name : B__Generate_ROI
Inputs : [[0, 'label_vol_for_rois']]
Outputs : [[0, 'rois_to_concatenate'], [0, 'rois_for_masks']]
Emits : []


Name : B__ROI_Mask
Inputs : [[0, 'map_and_rois_for_masks']]
Outputs : [[0, 'rois_mask_for_concatenate'], [1, 'rois_labels_for_concatenate']]
Emits : []


Name : B__Concatenate_Surface
Inputs : [[0, 'surfaces_and_rois_to_concatenate']]
Outputs : [[0, 'surfaces_to_warp'], [1, 'surface_type_for_set_nf']]
Emits : []


Name : B__Concatenate_Mask
Inputs : [[0, 'lh_flow_mask'], [0, 'rh_flow_mask'], [0, 'lh_seed_mask'], [0, 'rh_seed_mask'], [0, 'sid'], [1, 'lh_intersections_mask'], [1, 'rh_intersections_mask'], [1, 'lh_zero_mask'], [1, 'rh_zero_mask'], [2, 'all_masks_for_concatenate']]
Outputs : [[0, 'flow_mask_for_set_nf'], [1, 'seed_mask_for_set_nf'], [2, 'intersections_mask_for_set_nf']]
Emits : []


Name : B__Concatenate_Label
Inputs : [[0, 'all_labels_for_concatenate']]
Outputs : [[0, 'labels_for_set_nf']]
Emits : []


Name : A__Convert_ANTs_Transformation
Inputs : [[0, 'ants_transfo_to_convert']]
Outputs : [[0, 'ants_transfo_for_surfaces']]
Emits : []


Name : C__Register_Surface
Inputs : [[0, 'surfaces_with_transform']]
Outputs : [[0, 'surfaces_for_seed'], [0, 'surfaces_for_smooth'], [0, 'surfaces_for_density']]
Emits : []


Name : D__Surface_Flow
Inputs : [[0, 'data_for_surface_smooth']]
Outputs : [[0, 'surface_flow_surfaces_for_pft'], [0, 'surfaces_for_connectivity'], [1, 'surface_flow_lines_for_combine']]
Emits : []


Name : E__Surface_Seeding_Map
Inputs : [[0, 'data_rand_for_surface_seed']]
Outputs : [[0, 'surfaces_seeding_map_for_set']]
Emits : []


Name : F__Surface_Enhanced_Tractography
Inputs : [[0, 'seed_map'], [0, 'sum_density'], [0, 'sid'], [1, 'surf'], [1, 'fodf'], [1, 'map_exclude'], [1, 'map_include'], [2, 'data_for_set']]
Outputs : [[0, 'intersections_for_concatenate'], [1, 'streamlines_for_concatenate'], [2, 'feedback_ch']]
Emits : []


Name : G__Concatenate_Intersection
Inputs : [[0, 'intersections_grouped_for_concatenate']]
Outputs : [[0, 'intersections_for_connectivity'], [0, 'intersections_for_density']]
Emits : []


Name : H__Compute_Connectivity_Matrix
Inputs : [[0, 'data_for_connectivity']]
Outputs : [[0, 'matrices_for_stats']]
Emits : []


Name : H__Compute_Surface_Density
Inputs : [[0, 'data_for_density']]
Outputs : [[0, 'density_for_stats']]
Emits : []


