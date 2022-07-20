Name : blast_job
Inputs : [[0, 'fasta_ch'], [1, 'db_dir']]
Outputs : [[0, 'blast_ch']]
Emits : []


Name : count
Inputs : [[0, 'blastresult_ch'], [1, 'db_dir']]
Outputs : [[0, 'sequences_ch']]
Emits : []


