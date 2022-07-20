Name : align
Inputs : [[0, 'fastq_pair_ch']]
Outputs : [[0, 'align_result_channel']]
Emits : []


Name : cut_fields
Inputs : [[0, 'align_result_channel']]
Outputs : [[0, 'final_results']]
Emits : []


