Name : Shared_Results
Inputs : [[0, 'shared_adata'], [1, 'shared_parameters'], [2, 'shared_probeset'], [3, 'shared_markers']]
Outputs : [[0, 'ch_shared_results_cs'], [1, 'ch_shared_results_knn'], [2, 'ch_shared_results_gene_corr'], [3, 'ch_shared_results_marker_corr']]
Emits : []


Name : Cluster_Similarity_Pre_results
Inputs : [[0, 'pre_results_cs_adata'], [1, 'pre_results_cs_parameters'], [2, 'pre_results_cs_probeset'], [3, 'pre_results_cs_markers'], [4, 'probeset_ids']]
Outputs : [[0, 'ch_pre_results_cs']]
Emits : []


Name : KNN_Overlap_Pre_results
Inputs : [[0, 'pre_results_knn_adata'], [1, 'pre_results_knn_parameters'], [2, 'pre_results_knn_probeset'], [3, 'pre_results_knn_markers'], [4, 'probeset_ids']]
Outputs : [[0, 'ch_pre_results_knn']]
Emits : []


Name : Evaluate_Random_Forest_Classifier_Probesets
Inputs : [[0, 'probesets_fclfs_adata'], [1, 'probesets_fclfs_parameters'], [2, 'probesets_fclfs_probeset'], [3, 'probesets_fclfs_markers'], [4, 'probeset_ids']]
Outputs : [[0, 'ch_fclfs_probesets']]
Emits : []


Name : Evaluate_Cluster_Similarity_Probesets
Inputs : [[0, 'probesets_cs_adata'], [1, 'probesets_cs_parameters'], [2, 'probesets_cs_probeset'], [3, 'probesets_cs_markers'], [4, 'ch_shared_results_cs'], [5, 'ch_pre_results_cs'], [6, 'probeset_ids']]
Outputs : [[0, 'ch_cs_probesets']]
Emits : []


Name : Evaluate_KNN_Graph_Probesets
Inputs : [[0, 'probesets_knn_adata'], [1, 'probesets_knn_parameters'], [2, 'probesets_knn_probeset'], [3, 'probesets_knn_markers'], [4, 'ch_shared_results_knn'], [5, 'ch_pre_results_knn'], [6, 'probeset_ids']]
Outputs : [[0, 'ch_knn_probesets']]
Emits : []


Name : Evaluate_Correlations_Probesets
Inputs : [[0, 'probesets_corr_adata'], [1, 'probesets_corr_parameters'], [2, 'probesets_corr_probeset'], [3, 'probesets_corr_markers'], [4, 'ch_shared_results_gene_corr'], [5, 'ch_shared_results_marker_corr'], [6, 'probeset_ids']]
Outputs : [[0, 'ch_gene_corr_probesets'], [1, 'ch_marker_corr_probesets']]
Emits : []


Name : Calculate_Summary_Statistics
Inputs : [[0, 'summary_adata'], [1, 'summary_parameters'], [2, 'summary_probeset'], [3, 'summary_markers'], [4, 'all_results'], [5, 'params']]
Outputs : [[0, 'ch_summary']]
Emits : []


