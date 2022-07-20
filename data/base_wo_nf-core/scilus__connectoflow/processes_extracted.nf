Name : Transform_T1_Labels
Inputs : [[0, 'anat_for_transformation']]
Outputs : [[0, 'transformed_labels'], [1, 'transformed_anat']]
Emits : []


Name : Decompose_Connectivity
Inputs : [[0, 'tracking_labels_for_decompose']]
Outputs : [[0, 'h5_for_commit'], [0, 'h5_for_skip_commit']]
Emits : []


Name : Run_COMMIT
Inputs : [[0, 'data_tracking_for_commit']]
Outputs : [[0, 'sid'], [1, 'h5_for_afd_rd'], [1, 'h5_for_skip_afd_rd']]
Emits : []


Name : Compute_AFD_RD
Inputs : [[0, 'h5_fodf_for_afd_rd']]
Outputs : [[0, 'h5_for_transformation']]
Emits : []


Name : Register_Anat
Inputs : [[0, 'anats_for_registration']]
Outputs : [[0, 'transformation_for_data'], [0, 'transformation_for_metrics'], [0, 'transformation_for_lesions']]
Emits : []


Name : Transform_Metrics
Inputs : [[0, 'metrics_transformation_for_metrics']]
Outputs : [[0, 'metrics_for_compute']]
Emits : []


Name : Transform_Lesions
Inputs : [[0, 'lesions_transformation_for_data']]
Outputs : [[0, 'lesions_for_compute']]
Emits : []


Name : Transform_Data
Inputs : [[0, 'labels_tracking_transformation_for_data']]
Outputs : [[0, 'h5_labels_for_compute'], [1, 'h5_for_similarity']]
Emits : []


Name : Average_Connections
Inputs : [[0, 'all_h5_for_similarity']]
Outputs : [[0, 'edges_for_similarity']]
Emits : []


Name : Compute_Connectivity_with_similiarity
Inputs : [[0, 'h5_labels_similarity_list_for_compute']]
Outputs : [[0, 'matrices_for_visualize_with_similarity'], [0, 'matrices_w_similarity_for_merge']]
Emits : []


Name : Compute_Connectivity_without_similiarity
Inputs : [[0, 'h5_labels_list_for_compute']]
Outputs : [[0, 'matrices_for_visualize_without_similarity'], [0, 'matrices_wo_similarity_for_merge']]
Emits : []


Name : Connectivity_in_csv
Inputs : [[0, 'matrices_for_connectivity_in_csv']]
Outputs : []
Emits : []


Name : Visualize_Connectivity
Inputs : [[0, 'matrices_labels_list_for_visualize']]
Outputs : [[0, 'sid']]
Emits : []


