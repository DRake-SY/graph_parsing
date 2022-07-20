Name : extract_reads
Inputs : [[0, 'input_ch']]
Outputs : [[0, 'extract_log_ch'], [1, 'reads_ch']]
Emits : []


Name : genotype
Inputs : [[0, 'reads_ch']]
Outputs : [[1, 'genotype_ch']]
Emits : []


Name : merge
Inputs : [[0, 'genotype_ch']]
Outputs : [[0, 'merged_ch']]
Emits : []


