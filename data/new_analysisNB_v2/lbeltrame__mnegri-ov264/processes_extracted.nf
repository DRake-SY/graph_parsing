Name : size_selection
Inputs : [[0, 'size_select_ch']]
Outputs : [[0, 'processed_bam_ch']]
Emits : []


Name : read_counter
Inputs : [[0, 'processed_bam_ch']]
Outputs : [[0, 'wigfiles_ch']]
Emits : []


Name : ichorCNA
Inputs : [[0, 'wigfiles_ch']]
Outputs : [[2, 'postprocess_ch']]
Emits : []


Name : aggregate_table
Inputs : [[0, 'postprocess_ch']]
Outputs : []
Emits : []


