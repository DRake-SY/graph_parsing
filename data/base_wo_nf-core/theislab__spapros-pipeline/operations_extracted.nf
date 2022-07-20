OPERATION_1 string : ch_adata = Channel.fromPath(params.adata, checkIfExists: true)
OPERATION_1 origin : [['params.adata, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_adata', 'P']]


OPERATION_2 string : ch_parameters = Channel.fromPath(params.parameters, checkIfExists: true)
OPERATION_2 origin : [['params.parameters, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_parameters', 'P']]


OPERATION_3 string : ch_probeset = Channel.fromPath(params.probeset, checkIfExists: true)
OPERATION_3 origin : [['params.probeset, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['ch_probeset', 'P']]


OPERATION_4 string : ch_markers = Channel.fromPath(params.markers, checkIfExists: true)
OPERATION_4 origin : [['params.markers, checkIfExists: true', 'A']]
OPERATION_4 gives  : [['ch_markers', 'P']]


OPERATION_5 string : cluster_similarity_results = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['cluster_similarity_results', 'P']]


OPERATION_6 string : knn_results = Channel.empty()
OPERATION_6 origin : []
OPERATION_6 gives  : [['knn_results', 'P']]


OPERATION_7 string : gene_corr_results = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['gene_corr_results', 'P']]


OPERATION_8 string : marker_corr_results = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['marker_corr_results', 'P']]


OPERATION_9 string : rf_results = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['rf_results', 'P']]


OPERATION_10 string : all_results = Channel.empty()
OPERATION_10 origin : []
OPERATION_10 gives  : [['all_results', 'P']]


OPERATION_11 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_11 origin : [['summary', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : ch_adata.into { shared_adata;
                pre_results_cs_adata;
                pre_results_knn_adata;
                probesets_fclfs_adata;
                probesets_cs_adata;
                probesets_knn_adata;
                probesets_corr_adata;
                summary_adata }
OPERATION_12 origin : [['ch_adata', 'P']]
OPERATION_12 gives  : [['shared_adata', 'P'], ['pre_results_cs_adata', 'P'], ['pre_results_knn_adata', 'P'], ['probesets_fclfs_adata', 'P'], ['probesets_cs_adata', 'P'], ['probesets_knn_adata', 'P'], ['probesets_corr_adata', 'P'], ['summary_adata', 'P']]


OPERATION_13 string : ch_parameters.into { shared_parameters;
                    pre_results_cs_parameters;
                    pre_results_knn_parameters;
                    probesets_fclfs_parameters;
                    probesets_cs_parameters;
                    probesets_knn_parameters;
                    probesets_corr_parameters;
                    summary_parameters }
OPERATION_13 origin : [['ch_parameters', 'P']]
OPERATION_13 gives  : [['shared_parameters', 'P'], ['pre_results_cs_parameters', 'P'], ['pre_results_knn_parameters', 'P'], ['probesets_fclfs_parameters', 'P'], ['probesets_cs_parameters', 'P'], ['probesets_knn_parameters', 'P'], ['probesets_corr_parameters', 'P'], ['summary_parameters', 'P']]


OPERATION_14 string : ch_probeset.into {  shared_probeset;
                    pre_results_cs_probeset;
                    pre_results_knn_probeset;
                    probesets_fclfs_probeset; 
                    probesets_cs_probeset;
                    probesets_knn_probeset;
                    probesets_corr_probeset;
                    summary_probeset }
OPERATION_14 origin : [['ch_probeset', 'P']]
OPERATION_14 gives  : [['shared_probeset', 'P'], ['pre_results_cs_probeset', 'P'], ['pre_results_knn_probeset', 'P'], ['probesets_fclfs_probeset', 'P'], ['probesets_cs_probeset', 'P'], ['probesets_knn_probeset', 'P'], ['probesets_corr_probeset', 'P'], ['summary_probeset', 'P']]


OPERATION_15 string : ch_markers.into {   shared_markers;
                    pre_results_cs_markers;
                    pre_results_knn_markers;
                    probesets_fclfs_markers; 
                    probesets_cs_markers;
                    probesets_knn_markers;
                    probesets_corr_markers;
                    summary_markers }
OPERATION_15 origin : [['ch_markers', 'P']]
OPERATION_15 gives  : [['shared_markers', 'P'], ['pre_results_cs_markers', 'P'], ['pre_results_knn_markers', 'P'], ['probesets_fclfs_markers', 'P'], ['probesets_cs_markers', 'P'], ['probesets_knn_markers', 'P'], ['probesets_corr_markers', 'P'], ['summary_markers', 'P']]


OPERATION_16 string : cluster_similarity_results = ch_cs_probesets.collect()
OPERATION_16 origin : [['ch_cs_probesets', 'P']]
OPERATION_16 gives  : [['cluster_similarity_results', 'P']]


OPERATION_17 string : knn_results = ch_knn_probesets.collect()
OPERATION_17 origin : [['ch_knn_probesets', 'P']]
OPERATION_17 gives  : [['knn_results', 'P']]


OPERATION_18 string : all_results = cluster_similarity_results.mix(knn_results, gene_corr_results, marker_corr_results, rf_results).collect()
OPERATION_18 origin : [['cluster_similarity_results', 'P'], ['knn_results', 'P'], ['gene_corr_results', 'P'], ['marker_corr_results', 'P'], ['rf_results', 'P']]
OPERATION_18 gives  : [['all_results', 'P']]


OPERATION_19 string : gene_corr_results = ch_gene_corr_probesets
OPERATION_19 origin : [['ch_gene_corr_probesets', 'P']]
OPERATION_19 gives  : [['gene_corr_results', 'P']]


OPERATION_20 string : marker_corr_results = ch_marker_corr_probesets
OPERATION_20 origin : [['ch_marker_corr_probesets', 'P']]
OPERATION_20 gives  : [['marker_corr_results', 'P']]


OPERATION_21 string : rf_results = ch_fclfs_probesets
OPERATION_21 origin : [['ch_fclfs_probesets', 'P']]
OPERATION_21 gives  : [['rf_results', 'P']]


