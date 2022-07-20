Name : peptide_feature_detection
Inputs : [[0, 'ch_1']]
Outputs : [[0, 'ch_3']]
Emits : []


Name : precursor_correction
Inputs : [[0, 'ch_2'], [0, 'ch_4']]
Outputs : [[0, 'ch_6']]
Emits : []


Name : peptide_identification
Inputs : [[0, 'ch_6'], [1, 'ch_database'], [2, 'ch_msgfplus']]
Outputs : [[0, 'ch_7']]
Emits : []


Name : peptide_indexing
Inputs : [[0, 'ch_7'], [1, 'ch_database']]
Outputs : [[0, 'ch_8']]
Emits : []


Name : false_discovery_rate
Inputs : [[0, 'ch_9']]
Outputs : [[0, 'ch_11']]
Emits : []


Name : mztab_export_peptide_id
Inputs : [[0, 'ch_12']]
Outputs : [[0, 'ch_14']]
Emits : []


Name : id_mapping
Inputs : [[0, 'ch_5'], [0, 'ch_13']]
Outputs : [[0, 'ch_15']]
Emits : []


Name : link_maps
Inputs : [[0, 'ch_15']]
Outputs : [[0, 'ch_16']]
Emits : []


Name : clean_up_ids
Inputs : [[0, 'ch_16']]
Outputs : [[0, 'ch_17']]
Emits : []


Name : normalize
Inputs : [[0, 'ch_17']]
Outputs : [[0, 'ch_18']]
Emits : []


Name : mztab_export_peptide_quant
Inputs : [[0, 'ch_20']]
Outputs : [[0, 'ch_21']]
Emits : []


Name : error_probability
Inputs : [[0, 'ch_10']]
Outputs : [[0, 'ch_22']]
Emits : []


Name : merge_ids
Inputs : [[0, 'ch_22']]
Outputs : [[0, 'ch_23']]
Emits : []


Name : protein_inference
Inputs : [[0, 'ch_23']]
Outputs : [[0, 'ch_24']]
Emits : []


Name : protein_quantification
Inputs : [[0, 'ch_19'], [1, 'ch_24']]
Outputs : [[0, 'ch_25']]
Emits : []


