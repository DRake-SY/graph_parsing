Name : fetch_query_data
Inputs : [[0, 'IMPORT_PARAMS']]
Outputs : [[0, 'FETCH_DATA']]
Emits : []


Name : unmelt_sdrf_query
Inputs : [[0, 'FETCH_DATA']]
Outputs : [[0, 'FETCH_DATA_UNMELT'], [1, 'BARCODES'], [2, 'DATA_ID']]
Emits : []


Name : generate_folds
Inputs : [[0, 'DATASET_ID'], [1, 'BARCODES_FOLDS']]
Outputs : [[0, 'K_FOLD_CELL_INDEXES']]
Emits : []


Name : split_train_test
Inputs : [[0, 'FOLD_DATA']]
Outputs : [[0, 'SPLIT_DATA'], [1, 'FOLD_N_SPLIT_DATA']]
Emits : []


Name : group_fold_data
Inputs : [[0, 'GROUPED_DATA']]
Outputs : [[0, 'RUN_PREDICTORS']]
Emits : []


Name : run_predictors
Inputs : [[0, 'RUN_PREDICTORS']]
Outputs : [[0, 'LABEL_ANALYSIS'], [1, 'DATASET_ID_A']]
Emits : []


Name : combine_results
Inputs : [[0, 'LABEL_ANALYSIS']]
Outputs : [[0, 'COMBINED_RESULTS']]
Emits : []


Name : avg_folds
Inputs : [[0, 'COMBINED_RESULTS'], [1, 'DATASET_ID_A']]
Outputs : [[0, 'AVG_TOOL_PERF_TABLE'], [1, 'AVG_TOOL_PERF_PVALS']]
Emits : []


