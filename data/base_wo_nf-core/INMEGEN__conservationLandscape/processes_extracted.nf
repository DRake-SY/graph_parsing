Name : countKmers
Inputs : [[0, 'fasta_datasets'], [1, 'hash_value'], [2, 'threads_value']]
Outputs : [[0, 'counts']]
Emits : []


Name : cov_plot
Inputs : [[0, 'counts']]
Outputs : [[0, 'cov']]
Emits : []


Name : plot
Inputs : [[0, 'cov']]
Outputs : [[0, 'output']]
Emits : []


