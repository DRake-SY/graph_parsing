Name : p01_process_data
Inputs : []
Outputs : [[0, 'process_data_adata'], [1, 'process_data_html']]
Emits : []


Name : p02_filter_data
Inputs : [[3, 'process_data_adata']]
Outputs : [[0, 'filter_data_adata_1'], [0, 'filter_data_adata_2'], [1, 'filter_data_html']]
Emits : []


Name : p03_normalize
Inputs : [[4, 'filter_data_adata_2']]
Outputs : [[0, 'correct_data_adata'], [1, 'correct_data_html']]
Emits : []


Name : p04_annotate_cell_types
Inputs : [[3, 'correct_data_adata']]
Outputs : [[0, 'annotate_cell_types_adata'], [1, 'annotate_cell_types_html']]
Emits : []


Name : p05_prepare_adata_t_nk
Inputs : [[3, 'annotate_cell_types_adata']]
Outputs : [[0, 'prepare_adata_t_nk'], [0, 'prepare_adata_t_nk_3'], [0, 'prepare_adata_t_nk_6'], [1, 'prepare_adata_t_nk_html'], [2, 'prepare_adata_t_nk_obs'], [2, 'prepare_adata_t_nk_obs_2'], [3, 'prepare_adata_t_nk_norm_counts']]
Emits : []


Name : p20_prepare_cluster_de_analysis
Inputs : [[1, 'prepare_adata_t_nk_obs_2'], [2, 'prepare_adata_t_nk_norm_counts']]
Outputs : [[0, 'prepare_cluster_de_analysis_rda'], [1, 'prepare_cluster_de_analysis_html']]
Emits : []


Name : p21_run_de_analysis_clusters
Inputs : [[0, 'prepare_cluster_de_analysis_rda']]
Outputs : [[0, 'run_de_analysis_clusters_results'], [1, 'run_de_analysis_clusters_results_xlsx']]
Emits : []


Name : p22_cluster_de_analysis
Inputs : [[1, 'run_de_analysis_clusters_results_xlsx'], [2, 'run_de_analysis_clusters_results']]
Outputs : [[0, 'cluster_de_analysis_html'], [1, 'cluster_de_analysis_zip']]
Emits : []


Name : p60_tcr_analysis
Inputs : [[1, 'prepare_adata_t_nk_3']]
Outputs : [[0, 'tcr_analysis_html'], [1, 'tcr_analysis_tsv']]
Emits : []


Name : p61_cluster_analysis
Inputs : [[1, 'prepare_adata_t_nk_6']]
Outputs : [[0, 'cluster_analysis_figures'], [1, 'cluster_analysis_html']]
Emits : []


Name : deploy
Inputs : []
Outputs : []
Emits : []


