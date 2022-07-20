OPERATION_1 string : Channel
    .fromFilePairs("$params.input/**/bundles/*.trk",
                   size: -1) { it.parent.parent.name }
    .into{bundles_for_rm_invalid; bundles_for_fixel_afd}
OPERATION_1 origin : []
OPERATION_1 gives  : [['bundles_for_rm_invalid', 'P'], ['bundles_for_fixel_afd', 'P']]


OPERATION_2 string : Channel
    .fromFilePairs("$params.input/**/metrics/*.nii.gz",
                   size: -1) { it.parent.parent.name }
    .set{in_metrics}
OPERATION_2 origin : []
OPERATION_2 gives  : [['in_metrics', 'P']]


OPERATION_3 string : Channel
    .fromFilePairs("$params.input/**/centroids/*.trk",
        size: -1) { it.parent.parent.name }
    .into{centroids_for_resample; in_centroids_check}
OPERATION_3 origin : []
OPERATION_3 gives  : [['centroids_for_resample', 'P'], ['in_centroids_check', 'P']]


OPERATION_4 string : Channel
    .fromFilePairs("$params.input/**/*lesion_mask.nii.gz",
        size: -1) { it.parent.name }
    .set{lesion_for_lesion_load}
OPERATION_4 origin : []
OPERATION_4 gives  : [['lesion_for_lesion_load', 'P']]


OPERATION_5 string : Channel
    .fromFilePairs("$params.input/**/*fodf.nii.gz",
        size: -1) { it.parent.name }
    .set{fodf_for_fixel_afd}
OPERATION_5 origin : []
OPERATION_5 gives  : [['fodf_for_fixel_afd', 'P']]


OPERATION_6 string : in_metrics
    .set{metrics_for_rename}
OPERATION_6 origin : [['in_metrics', 'P']]
OPERATION_6 gives  : [['metrics_for_rename', 'P']]


OPERATION_7 string : bundles_for_fixel_afd
    .join(fodf_for_fixel_afd)
    .set{bundle_fodf_for_fixel_afd}
OPERATION_7 origin : [['bundles_for_fixel_afd', 'P'], ['fodf_for_fixel_afd', 'P']]
OPERATION_7 gives  : [['bundle_fodf_for_fixel_afd', 'P']]


OPERATION_8 string : centroids_provided
        .set{centroids_for_label_and_distance_map}
OPERATION_8 origin : [['centroids_provided', 'P']]
OPERATION_8 gives  : [['centroids_for_label_and_distance_map', 'P']]


OPERATION_9 string : centroids_computed
        .set{centroids_for_label_and_distance_map}
OPERATION_9 origin : [['centroids_computed', 'P']]
OPERATION_9 gives  : [['centroids_for_label_and_distance_map', 'P']]


OPERATION_10 string : bundles_for_label_and_distance_map
    .join(centroids_for_label_and_distance_map, by: 0)
    .set{bundles_centroids_for_label_and_distance_map}
OPERATION_10 origin : [['bundles_for_label_and_distance_map', 'P']]
OPERATION_10 gives  : [['bundles_centroids_for_label_and_distance_map', 'P']]


OPERATION_11 string : lesion_for_lesion_load
    .join(bundles_for_lesion_load, by: 0)
    .join(voxel_label_map_for_lesion_load, by: 0)
    .set{lesion_bundles_voxel_label_maps_for_lesion_load}
OPERATION_11 origin : [['lesion_for_lesion_load', 'P']]
OPERATION_11 gives  : [['lesion_bundles_voxel_label_maps_for_lesion_load', 'P']]


OPERATION_12 string : metrics_for_endpoints_roi_stats
    .mix(fixel_afd_for_endpoints_roi_stats)
    .groupTuple(by: 0)
     .map{it -> [it[0], it[1..-1].flatten()]}
    .set{metrics_afd_for_endpoints_roi_stats}
OPERATION_12 origin : [['metrics_for_endpoints_roi_stats', 'P'], ['fixel_afd_for_endpoints_roi_stats', 'P']]
OPERATION_12 gives  : [['metrics_afd_for_endpoints_roi_stats', 'P']]


OPERATION_13 string : metrics_afd_for_endpoints_roi_stats
    .combine(endpoints_maps_for_roi_stats, by: 0)
    .set{metrics_endpoints_for_roi_stats}
OPERATION_13 origin : [['metrics_afd_for_endpoints_roi_stats', 'P']]
OPERATION_13 gives  : [['metrics_endpoints_for_roi_stats', 'P']]


OPERATION_14 string : metrics_for_endpoints_metrics
    .mix(fixel_afd_for_endpoints_metrics)
    .groupTuple(by: 0)
    .map{it -> [it[0], it[1..-1].flatten()]}
    .set{metrics_afd_for_endpoints_metrics}
OPERATION_14 origin : [['metrics_for_endpoints_metrics', 'P'], ['fixel_afd_for_endpoints_metrics', 'P']]
OPERATION_14 gives  : [['metrics_afd_for_endpoints_metrics', 'P']]


OPERATION_15 string : bundles_for_endpoints_metrics
    .flatMap{ sid, bundles -> bundles.collect{[sid, it]} }
    .combine(metrics_afd_for_endpoints_metrics, by: 0)
    .set{metrics_bundles_for_endpoints_metrics}
OPERATION_15 origin : [['bundles_for_endpoints_metrics', 'P']]
OPERATION_15 gives  : [['metrics_bundles_for_endpoints_metrics', 'P']]


OPERATION_16 string : metrics_for_mean_std
    .mix(fixel_afd_for_mean_std)
    .groupTuple(by: 0)
     .map{it -> [it[0], it[1..-1].flatten()]}
    .set{metrics_afd_for_mean_std}
OPERATION_16 origin : [['metrics_for_mean_std', 'P'], ['fixel_afd_for_mean_std', 'P']]
OPERATION_16 gives  : [['metrics_afd_for_mean_std', 'P']]


OPERATION_17 string : metrics_afd_for_mean_std
    .combine(bundles_for_mean_std, by: 0)
    .set{metrics_bundles_for_mean_std}PROCESS DEF Bundle_Mean_Std
OPERATION_17 origin : [['metrics_afd_for_mean_std', 'P']]
OPERATION_17 gives  : [['metrics_bundles_for_mean_std', 'P']]


OPERATION_18 string : metrics_for_mean_std_per_point
    .mix(fixel_afd_for_mean_std_per_point)
    .groupTuple(by: 0)
     .map{it -> [it[0], it[1..-1].flatten()]}
    .set{metrics_afd_for_std_per_point}
OPERATION_18 origin : [['metrics_for_mean_std_per_point', 'P'], ['fixel_afd_for_mean_std_per_point', 'P']]
OPERATION_18 gives  : [['metrics_afd_for_std_per_point', 'P']]


OPERATION_19 string : metrics_afd_for_std_per_point
    .join(bundles_for_mean_std_per_point, by: 0)
    .join(label_distance_maps_for_mean_std_per_point, by: 0)
    .set{metrics_bundles_label_distance_maps_for_mean_std_per_point}
OPERATION_19 origin : [['metrics_afd_for_std_per_point', 'P']]
OPERATION_19 gives  : [['metrics_bundles_label_distance_maps_for_mean_std_per_point', 'P']]


OPERATION_20 string : lesion_load_to_aggregate
    .collect()
    .set{all_lesion_load_to_aggregate}
OPERATION_20 origin : [['lesion_load_to_aggregate', 'P']]
OPERATION_20 gives  : [['all_lesion_load_to_aggregate', 'P']]


OPERATION_21 string : lesion_load_per_point_to_aggregate
    .collect()
    .set{all_lesion_load_per_point_to_aggregate}
OPERATION_21 origin : [['lesion_load_per_point_to_aggregate', 'P']]
OPERATION_21 gives  : [['all_lesion_load_per_point_to_aggregate', 'P']]


OPERATION_22 string : endpoints_maps_to_aggregate
    .collect()
    .set{all_aggregate_endspoints_map}
OPERATION_22 origin : [['endpoints_maps_to_aggregate', 'P']]
OPERATION_22 gives  : [['all_aggregate_endspoints_map', 'P']]


OPERATION_23 string : endpoints_metric_stats_to_aggregate
    .collect()
    .set{all_aggregate_all_endpoints_metric_stats}
OPERATION_23 origin : [['endpoints_metric_stats_to_aggregate', 'P']]
OPERATION_23 gives  : [['all_aggregate_all_endpoints_metric_stats', 'P']]


OPERATION_24 string : bundles_length_stats_to_aggregate
    .collect()
    .set{all_bundle_length_stats_to_aggretate}
OPERATION_24 origin : [['bundles_length_stats_to_aggregate', 'P']]
OPERATION_24 gives  : [['all_bundle_length_stats_to_aggretate', 'P']]


OPERATION_25 string : mean_std_to_aggregate
    .collect()
    .set{all_mean_std_to_aggregate}
OPERATION_25 origin : [['mean_std_to_aggregate', 'P']]
OPERATION_25 gives  : [['all_mean_std_to_aggregate', 'P']]


OPERATION_26 string : volumes_to_aggregate
    .collect()
    .set{all_volumes_to_aggregate}
OPERATION_26 origin : [['volumes_to_aggregate', 'P']]
OPERATION_26 gives  : [['all_volumes_to_aggregate', 'P']]


OPERATION_27 string : streamline_counts_to_aggregate
    .collect()
    .set{all_streamline_counts_to_aggregate}
OPERATION_27 origin : [['streamline_counts_to_aggregate', 'P']]
OPERATION_27 gives  : [['all_streamline_counts_to_aggregate', 'P']]


OPERATION_28 string : volumes_per_label_to_aggregate
    .collect()
    .set{all_volumes_per_label_to_aggregate}
OPERATION_28 origin : [['volumes_per_label_to_aggregate', 'P']]
OPERATION_28 gives  : [['all_volumes_per_label_to_aggregate', 'P']]


OPERATION_29 string : mean_std_per_point_to_aggregate
    .collect()
    .set{all_mean_std_per_point_to_aggregate}
OPERATION_29 origin : [['mean_std_per_point_to_aggregate', 'P']]
OPERATION_29 gives  : [['all_mean_std_per_point_to_aggregate', 'P']]


OPERATION_30 string : population_mean_std_per_point
    .concat(population_lesion_load_per_point)
    .set{population_mean_std_lesion_per_point}
OPERATION_30 origin : [['population_mean_std_per_point', 'P'], ['population_lesion_load_per_point', 'P']]
OPERATION_30 gives  : [['population_mean_std_lesion_per_point', 'P']]


