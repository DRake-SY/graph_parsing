Name : Rename_Metrics
Inputs : [[0, 'metrics_for_rename']]
Outputs : [[0, 'metrics_for_mean_std'], [0, 'metrics_for_endpoints_metrics'], [0, 'metrics_for_endpoints_roi_stats'], [0, 'metrics_for_volume'], [0, 'metrics_for_mean_std_per_point']]
Emits : []


Name : Fixel_AFD
Inputs : [[0, 'bundle_fodf_for_fixel_afd']]
Outputs : [[0, 'fixel_afd_for_mean_std'], [0, 'fixel_afd_for_endpoints_metrics'], [0, 'fixel_afd_for_endpoints_roi_stats'], [0, 'fixel_afd_for_mean_std_per_point']]
Emits : []


Name : Remove_Invalid_Streamlines
Inputs : [[0, 'bundles_for_rm_invalid']]
Outputs : [[0, 'bundles_for_label_and_distance_map'], [0, 'bundles_for_centroids']]
Emits : []


Name : Bundle_Centroid
Inputs : [[0, 'bundles_for_centroids']]
Outputs : [[0, 'centroids_computed']]
Emits : []


Name : Resample_Centroid
Inputs : [[0, 'centroids_for_resample']]
Outputs : [[0, 'centroids_provided']]
Emits : []


Name : Bundle_Label_And_Distance_Maps
Inputs : [[0, 'bundles_centroids_for_label_and_distance_map']]
Outputs : [[0, 'label_distance_maps_for_mean_std_per_point'], [1, 'bundles_for_uniformize'], [3, 'voxel_label_maps_for_volume'], [3, 'voxel_label_map_for_lesion_load']]
Emits : []


Name : Uniformize_Bundle
Inputs : [[0, 'bundles_for_uniformize']]
Outputs : [[0, 'bundles_for_coloring'], [0, 'bundles_for_lesion_load'], [0, 'bundles_for_mean_std'], [0, 'bundles_for_endpoints_map'], [0, 'bundles_for_endpoints_metrics'], [0, 'bundles_for_centroid'], [0, 'bundles_for_volume'], [0, 'bundles_for_streamline_count'], [0, 'bundles_for_mean_std_per_point'], [0, 'bundles_for_length_stats']]
Emits : []


Name : Lesion_Load
Inputs : [[0, 'lesion_bundles_voxel_label_maps_for_lesion_load']]
Outputs : [[0, 'lesion_load_to_aggregate'], [1, 'lesion_load_per_point_to_aggregate'], [2, 'lesion_load_per_point_for_plot']]
Emits : []


Name : Color_Bundle
Inputs : [[0, 'bundles_for_coloring']]
Outputs : []
Emits : []


Name : Bundle_Length_Stats
Inputs : [[0, 'bundles_for_length_stats']]
Outputs : [[0, 'bundles_length_stats_to_aggregate']]
Emits : []


Name : Bundle_Endpoints_Map
Inputs : [[0, 'bundles_for_endpoints_map']]
Outputs : [[0, 'endpoints_maps_to_aggregate'], [1, 'endpoints_maps_for_roi_stats']]
Emits : []


Name : Bundle_Metrics_Stats_In_Endpoints
Inputs : [[0, 'metrics_endpoints_for_roi_stats']]
Outputs : [[0, 'endpoints_metric_stats_to_aggregate']]
Emits : []


Name : Bundle_Endpoints_Metrics
Inputs : [[0, 'metrics_bundles_for_endpoints_metrics']]
Outputs : []
Emits : []


Name : Bundle_Mean_Std
Inputs : [[0, 'metrics_bundles_for_mean_std']]
Outputs : [[0, 'mean_std_to_aggregate']]
Emits : []


Name : Bundle_Volume
Inputs : [[0, 'bundles_for_volume']]
Outputs : [[0, 'volumes_to_aggregate']]
Emits : []


Name : Bundle_Streamline_Count
Inputs : [[0, 'bundles_for_streamline_count']]
Outputs : [[0, 'streamline_counts_to_aggregate']]
Emits : []


Name : Bundle_Volume_Per_Label
Inputs : [[0, 'voxel_label_maps_for_volume']]
Outputs : [[0, 'volumes_per_label_to_aggregate']]
Emits : []


Name : Bundle_Mean_Std_Per_Point
Inputs : [[0, 'metrics_bundles_label_distance_maps_for_mean_std_per_point']]
Outputs : [[0, 'mean_std_per_point_for_plot'], [1, 'mean_std_per_point_to_aggregate']]
Emits : []


Name : Plot_Mean_Std_Per_Point
Inputs : [[0, 'mean_std_per_point_for_plot']]
Outputs : [[0, 'sid']]
Emits : []


Name : Plot_Lesions_Per_Point
Inputs : [[0, 'lesion_load_per_point_for_plot']]
Outputs : [[0, 'sid']]
Emits : []


Name : Aggregate_All_Lesion_Load
Inputs : [[0, 'all_lesion_load_to_aggregate']]
Outputs : []
Emits : []


Name : Aggregate_All_Lesion_Load_Per_Point
Inputs : [[0, 'all_lesion_load_per_point_to_aggregate']]
Outputs : [[0, 'population_lesion_load_per_point']]
Emits : []


Name : Aggregate_All_Endpoints_Map
Inputs : [[0, 'all_aggregate_endspoints_map']]
Outputs : []
Emits : []


Name : Aggregate_All_Endpoints_Metric_Stats
Inputs : [[0, 'all_aggregate_all_endpoints_metric_stats']]
Outputs : []
Emits : []


Name : Aggregate_All_Bundle_Length_Stats
Inputs : [[0, 'all_bundle_length_stats_to_aggretate']]
Outputs : []
Emits : []


Name : Aggregate_All_mean_std
Inputs : [[0, 'all_mean_std_to_aggregate']]
Outputs : []
Emits : []


Name : Aggregate_All_Volume
Inputs : [[0, 'all_volumes_to_aggregate']]
Outputs : []
Emits : []


Name : Aggregate_All_Streamline_Count
Inputs : [[0, 'all_streamline_counts_to_aggregate']]
Outputs : []
Emits : []


Name : Aggregate_All_Volume_Per_Label
Inputs : [[0, 'all_volumes_per_label_to_aggregate']]
Outputs : []
Emits : []


Name : Aggregate_All_Mean_Std_Per_Point
Inputs : [[0, 'all_mean_std_per_point_to_aggregate']]
Outputs : [[0, 'population_mean_std_per_point']]
Emits : []


Name : Plot_Population_Mean_Std_Per_Point
Inputs : [[0, 'population_mean_std_lesion_per_point']]
Outputs : []
Emits : []


