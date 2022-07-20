Name : fetch_training_datasets
Inputs : [[0, 'IMPORT_PARAMS']]
Outputs : [[0, 'TRAINING_DATA'], [1, 'N_CLUST']]
Emits : []


Name : unmelt_condensed_sdrf
Inputs : [[0, 'TRAINING_DATA']]
Outputs : [[0, 'TRAINING_DATA_UNMELT'], [1, 'UNMELTED_SDRF_QUERY']]
Emits : []


Name : unzip_data
Inputs : [[0, 'GROUPED_DATA'], [1, 'BARCODE_COL'], [2, 'CELL_LABEL_COL']]
Outputs : [[0, 'DATA'], [1, 'MARKERS'], [2, 'UNMELTED_SDRF_QUERY']]
Emits : []


Name : run_garnett_workflow
Inputs : [[0, 'GARNETT_FILTERED_DATA']]
Outputs : [[0, 'GARNETT_OUTPUT']]
Emits : []


Name : run_scmap_cell_workflow
Inputs : [[0, 'SCMAP_CELL_FILTERED_DATA']]
Outputs : [[0, 'SCMAP_CELL_OUTPUT']]
Emits : []


Name : run_scmap_cluster_workflow
Inputs : [[0, 'SCMAP_CLUSTER_FILTERED_DATA']]
Outputs : [[0, 'SCMAP_CLUST_OUTPUT']]
Emits : []


Name : run_scpred_workflow
Inputs : [[0, 'SCPRED_FILTERED_DATA']]
Outputs : [[0, 'SCPRED_OUTPUT']]
Emits : []


Name : combine_results
Inputs : [[0, 'ALL_RESULTS']]
Outputs : [[0, 'COMBINED_RESULTS_DIR']]
Emits : []


Name : run_label_analysis
Inputs : [[0, 'COMBINED_RESULTS_DIR'], [1, 'UNMELTED_SDRF_QUERY']]
Outputs : [[0, 'TOOL_PERF_TABLE'], [1, 'TOOL_TABLE_PVALS']]
Emits : []


