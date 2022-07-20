Name : blast
Inputs : [[0, 'fasta_ch'], [1, 'db_dir']]
Outputs : [[0, 'hits_ch']]
Emits : []


Name : extract
Inputs : [[0, 'hits_ch'], [1, 'db_dir']]
Outputs : [[0, 'sequences_ch']]
Emits : []


