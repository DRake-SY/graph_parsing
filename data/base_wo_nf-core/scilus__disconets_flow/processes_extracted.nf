Name : README
Inputs : []
Outputs : []
Emits : []


Name : Copy_Atlas
Inputs : [[0, 'atlas_for_copy']]
Outputs : []
Emits : []


Name : Register_Lesions_T1s
Inputs : [[0, 'atlas_lesion_for_registration']]
Outputs : [[0, 'transformation_for_registration_lesions']]
Emits : []


Name : Transform_Lesions
Inputs : [[0, 'lesion_mat_for_transformation']]
Outputs : [[0, 'transformed_lesions']]
Emits : []


Name : Register_Tractograms_T1s
Inputs : [[0, 'atlas_trk_for_registration']]
Outputs : [[0, 'transformation_for_trk_registration']]
Emits : []


Name : Transform_Tractograms
Inputs : [[0, 'transfo_trk_for_registration']]
Outputs : [[0, 'transformed_trks']]
Emits : []


Name : Decompose_Connectivity
Inputs : [[0, 'trk_atlases_for_decompose_connectivity']]
Outputs : [[0, 'h5_for_combine_with_lesion']]
Emits : []


Name : Compute_Connectivity_Lesion_without_similiarity
Inputs : [[0, 'h5_labels_lesion_for_compute_connectivity']]
Outputs : [[0, 'matrices_for_connectivity_in_csv'], [1, 'lesion_sc_for_visualisation']]
Emits : []


Name : Connectivity_in_csv
Inputs : [[0, 'matrices_for_connectivity_in_csv']]
Outputs : [[0, 'sid']]
Emits : []


Name : Visualize_Connectivity
Inputs : [[0, 'lesion_sc_for_visualisation']]
Outputs : [[0, 'sid']]
Emits : []


