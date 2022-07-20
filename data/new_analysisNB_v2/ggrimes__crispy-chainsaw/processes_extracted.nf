Name : cutadapt
Inputs : [[0, 'sra_ch']]
Outputs : [[0, 'trimmed_ch']]
Emits : []


Name : velveth
Inputs : [[0, 'trimmed_ch'], [1, 'kmers']]
Outputs : [[0, 'velveth_out_ch']]
Emits : []


Name : stats
Inputs : [[0, 'velveth_out_ch']]
Outputs : [[0, 'stats_ch']]
Emits : []


Name : combined_stats
Inputs : [[0, 'stats_ch']]
Outputs : [[0, 'cout']]
Emits : []


