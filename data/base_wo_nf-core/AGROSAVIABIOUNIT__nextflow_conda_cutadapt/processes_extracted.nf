Name : pruning
Inputs : [[0, 'raw_fastqs'], [1, 'adapter_file_1']]
Outputs : [[0, 'fastqs_to_trim']]
Emits : []


Name : trimming
Inputs : [[0, 'fastqs_to_trim'], [1, 'adapter_file_2']]
Outputs : [[0, 'pair_id']]
Emits : []


