OPERATION_1 string : tractogram_for_recognition = Channel
     .fromFilePairs("$root/**/{*tracking*.*,}",
                    size: -1,
                    maxDepth:1) {it.parent.name}
OPERATION_1 origin : []
OPERATION_1 gives  : [['tractogram_for_recognition', 'P']]


OPERATION_2 string : Channel
    .fromPath("$root/**/*fa.nii.gz",
                    maxDepth:1)
    .map{[it.parent.name, it]}
    .into{anat_for_registration;anat_for_reference_centroids;anat_for_reference_bundles}
OPERATION_2 origin : []
OPERATION_2 gives  : [['anat_for_registration', 'P'], ['anat_for_reference_centroids', 'P'], ['anat_for_reference_bundles', 'P']]


OPERATION_3 string : Channel.fromPath("$params.atlas_anat")
    .into{atlas_anat;atlas_anat_for_average}
OPERATION_3 origin : [['"$params.atlas_anat"', 'A']]
OPERATION_3 gives  : [['atlas_anat', 'P'], ['atlas_anat_for_average', 'P']]


OPERATION_4 string : atlas_config = Channel.fromPath("$params.atlas_config")
OPERATION_4 origin : [['"$params.atlas_config"', 'A']]
OPERATION_4 gives  : [['atlas_config', 'P']]


OPERATION_5 string : atlas_directory = Channel.fromPath("$params.atlas_directory")
OPERATION_5 origin : [['"$params.atlas_directory"', 'A']]
OPERATION_5 gives  : [['atlas_directory', 'P']]


OPERATION_6 string : atlas_centroids = Channel.fromPath("$params.atlas_centroids/*_centroid.trk")
OPERATION_6 origin : [['"$params.atlas_centroids/*_centroid.trk"', 'A']]
OPERATION_6 gives  : [['atlas_centroids', 'P']]


OPERATION_7 string : atlas_centroids = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['atlas_centroids', 'P']]


OPERATION_8 string : anat_for_registration
    .combine(atlas_anat)
    .set{anats_for_registration}PROCESS DEF Register_Anat
OPERATION_8 origin : [['anat_for_registration', 'P'], ['atlas_anat', 'P']]
OPERATION_8 gives  : [['anats_for_registration', 'P']]


OPERATION_9 string : anat_for_reference_centroids
    .join(transformation_for_centroids, by: 0)
    .set{anat_and_transformation}PROCESS DEF Transform_Centroids
OPERATION_9 origin : [['anat_for_reference_centroids', 'P']]
OPERATION_9 gives  : [['anat_and_transformation', 'P']]


OPERATION_10 string : tractogram_for_recognition
    .join(anat_for_reference_bundles)
    .join(transformation_for_recognition)
    .combine(atlas_config)
    .combine(atlas_directory)
    .set{tractogram_and_transformation}PROCESS DEF Recognize_Bundles
OPERATION_10 origin : [['tractogram_for_recognition', 'P'], ['anat_for_reference_bundles', 'P'], ['transformation_for_recognition', 'P'], ['atlas_config', 'P'], ['atlas_directory', 'P']]
OPERATION_10 gives  : [['tractogram_and_transformation', 'P']]


OPERATION_11 string : bundles_for_cleaning
    .transpose()
    .set{all_bundles_for_cleaning}PROCESS DEF Clean_Bundles
OPERATION_11 origin : [['bundles_for_cleaning', 'P']]
OPERATION_11 gives  : [['all_bundles_for_cleaning', 'P']]


OPERATION_12 string : bundle_for_density
    .combine(transformation_for_average, by:0)
    .combine(atlas_anat_for_average)
    .set{all_bundles_transfo_for_average}PROCESS DEF Compute_Density_Bundles
OPERATION_12 origin : [['bundle_for_density', 'P'], ['atlas_anat_for_average', 'P']]
OPERATION_12 gives  : [['all_bundles_transfo_for_average', 'P']]


OPERATION_13 string : bundle_for_average
    .flatMap{ sid, bundles -> bundles.collect{[sid, it]} }
    .groupTuple(by: 0)
    .set{all_bundle_for_average}PROCESS DEF Average_Bundles
OPERATION_13 origin : [['bundle_for_average', 'P']]
OPERATION_13 gives  : [['all_bundle_for_average', 'P']]


