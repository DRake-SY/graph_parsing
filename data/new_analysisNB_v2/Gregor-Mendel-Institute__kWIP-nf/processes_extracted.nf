Name : trimGalore
Inputs : [[0, 'ch_reads']]
Outputs : [[0, 'ch_trimmed_reads']]
Emits : []


Name : khmerInterleaving
Inputs : [[0, 'ch_trimmed_reads']]
Outputs : [[0, 'ch_fq_for_khmerHashing']]
Emits : []


Name : khmerHashing
Inputs : [[0, 'ch_fq_for_khmerHashing']]
Outputs : [[0, 'ch_hashes_for_kWIP']]
Emits : []


Name : kWIP
Inputs : [[0, 'ch_hashes_for_kWIP']]
Outputs : [[0, 'result']]
Emits : []


