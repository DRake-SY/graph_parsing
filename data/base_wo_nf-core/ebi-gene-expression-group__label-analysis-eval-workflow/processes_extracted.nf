Name : remove_tech_duplicates
Inputs : [[0, 'REF_LABELS_FILE']]
Outputs : [[0, 'REF_LABELS_FILTERED'], [1, 'REF_LABELS_FILTERED_DIR']]
Emits : []


Name : build_cell_ontology_dict
Inputs : [[0, 'REF_LABELS_FILTERED_DIR']]
Outputs : [[0, 'ONTOLOGY_DICT']]
Emits : []


Name : get_tool_performance_table
Inputs : [[0, 'PRED_LABELS_DIR'], [1, 'REF_LABELS_FILTERED'], [2, 'ONTOLOGY_DICT'], [3, 'ONTOLOGY_GRAPH']]
Outputs : [[0, 'TOOL_PERF_TABLE']]
Emits : []


Name : generate_empirical_cdf
Inputs : [[0, 'REF_LABELS_FILTERED'], [1, 'ONTOLOGY_DICT']]
Outputs : [[0, 'EMP_DISTRIBUTION']]
Emits : []


Name : get_pvals
Inputs : [[0, 'TOOL_PERF_TABLE'], [1, 'EMP_DISTRIBUTION']]
Outputs : [[0, 'TOOL_TABLE_PVALS']]
Emits : []


