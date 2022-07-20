Name : buildIndex
Inputs : [[0, 'params']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : mapping
Inputs : [[0, 'params'], [1, 'params'], [2, 'index_ch'], [3, 'read_pairs_ch']]
Outputs : [[0, 'bam_ch']]
Emits : []


Name : makeTranscript
Inputs : [[0, 'params'], [1, 'bam_ch']]
Outputs : []
Emits : []


