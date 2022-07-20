Name : build_query_cds
Inputs : [[0, 'QUERY_10X_DIR']]
Outputs : [[0, 'QUERY_CDS_OBJECT']]
Emits : []


Name : run_garnett_predictions
Inputs : [[0, 'CLASSIFIERS'], [1, 'QUERY_CDS_OBJECT']]
Outputs : [[0, 'PRED_LABELS_OBJ']]
Emits : []


Name : get_final_tables
Inputs : [[0, 'PRED_LABELS_OBJ']]
Outputs : [[0, 'PRED_LABELS_TBLS']]
Emits : []


Name : combine_labels
Inputs : [[0, 'PRED_LABELS_TBLS']]
Outputs : [[0, 'GARNETT_LABELS_DIR']]
Emits : []


Name : select_top_labs
Inputs : [[0, 'GARNETT_LABELS_DIR']]
Outputs : [[0, 'GARNETT_TOP_LABS']]
Emits : []


