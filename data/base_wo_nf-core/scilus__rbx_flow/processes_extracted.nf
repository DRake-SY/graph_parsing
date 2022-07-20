Name : Register_Anat
Inputs : [[0, 'anats_for_registration']]
Outputs : [[0, 'transformation_for_recognition'], [0, 'transformation_for_centroids'], [1, 'transformation_for_average']]
Emits : []


Name : Transform_Centroids
Inputs : [[0, 'anat_and_transformation'], [1, 'atlas_centroids']]
Outputs : []
Emits : []


Name : Recognize_Bundles
Inputs : [[0, 'tractogram_and_transformation']]
Outputs : [[0, 'bundles_for_cleaning']]
Emits : []


Name : Clean_Bundles
Inputs : [[0, 'all_bundles_for_cleaning']]
Outputs : [[0, 'bundle_for_density']]
Emits : []


Name : Compute_Density_Bundles
Inputs : [[0, 'all_bundles_transfo_for_average']]
Outputs : [[0, 'bundle_for_average']]
Emits : []


Name : Average_Bundles
Inputs : [[0, 'all_bundle_for_average']]
Outputs : []
Emits : []


