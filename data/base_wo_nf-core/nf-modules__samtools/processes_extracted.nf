Name : faidx
Inputs : [[0, 'ch_refFasta']]
Outputs : [[0, 'ch_out_faidx']]
Emits : []


Name : sort
Inputs : [[0, 'ch_in_sort']]
Outputs : [[0, 'ch_out_sort']]
Emits : []


Name : index
Inputs : [[0, 'ch_refFasta'], [1, 'ch_in_index']]
Outputs : [[0, 'ch_out_index']]
Emits : []


Name : depth
Inputs : [[0, 'ch_refFasta'], [1, 'ch_in_depth']]
Outputs : [[0, 'ch_out_depth']]
Emits : []


