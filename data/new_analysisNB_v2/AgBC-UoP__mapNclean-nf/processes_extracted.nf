Name : index
Inputs : [[0, 'fasta_ch']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : mapping
Inputs : [[0, 'index_ch'], [1, 'read_pairs_ch']]
Outputs : [[0, 'sam'], [1, 'logs']]
Emits : []


Name : index_samtools
Inputs : [[0, 'fasta_ch1']]
Outputs : [[0, 'index_ch1']]
Emits : []


Name : remove_clipping
Inputs : [[0, 'sam'], [1, 'index_ch1']]
Outputs : [[0, 'sam_out']]
Emits : []


