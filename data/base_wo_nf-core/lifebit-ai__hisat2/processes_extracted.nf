Name : makeHISATindex
Inputs : [[0, 'ch_fasta_for_hisat_index']]
Outputs : [[0, 'hisat2_index_name'], [1, 'hs2_indices']]
Emits : []


Name : hisat2
Inputs : [[0, 'reads_ch'], [1, 'hisat2_index_name'], [2, 'hs2_indices']]
Outputs : [[0, 'hs2_sam']]
Emits : []


