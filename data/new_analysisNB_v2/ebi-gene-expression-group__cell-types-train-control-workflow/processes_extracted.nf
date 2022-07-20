Name : fetch_training_datasets
Inputs : [[0, 'IMPORT_PARAMS']]
Outputs : [[0, 'TRAINING_DATA'], [1, 'N_CLUST']]
Emits : []


Name : filter_labels
Inputs : [[0, 'TRAINING_DATA'], [1, 'N_CLUST']]
Outputs : [[0, 'TRAINING_DATA_FILT'], [1, 'N_CLUST_FILT']]
Emits : []


Name : unmelt_condensed_sdrf
Inputs : [[0, 'TRAINING_DATA_FILT']]
Outputs : [[0, 'TRAINING_DATA_UNMELT']]
Emits : []


Name : run_garnett_workflow
Inputs : [[0, 'GARNETT_FILTERED_DATA']]
Outputs : [[0, 'GARNETT_CLASSIFIER']]
Emits : []


Name : run_scpred_workflow
Inputs : [[0, 'SCPRED_FILTERED_DATA']]
Outputs : [[0, 'SCPRED_CLASSIFIER']]
Emits : []


Name : run_scmap_cluster_workflow
Inputs : [[0, 'SCMAP_CLUSTER_FILTERED_DATA']]
Outputs : []
Emits : []


Name : run_scmap_cell_workflow
Inputs : [[0, 'SCMAP_CELL_FILTERED_DATA']]
Outputs : [[0, 'SCMAP_CELL_INDEX']]
Emits : []


Name : run_singlecellnet_workflow
Inputs : [[0, 'SCMAP_CELL_FILTERED_DATA']]
Outputs : [[0, 'SINGLECELLNET_CLASSIFIER']]
Emits : []


