Name : fetch
Inputs : [[0, 'probands_ch'], [1, 'indelible_ch'], [2, 'config_ch']]
Outputs : [[0, 'reads_ch']]
Emits : []


Name : aggregate
Inputs : [[0, 'reads_ch'], [1, 'indelible_ch'], [2, 'config_ch'], [3, 'reference_ch']]
Outputs : [[0, 'counts_ch']]
Emits : []


Name : score
Inputs : [[0, 'counts_ch'], [1, 'indelible_ch'], [2, 'config_ch']]
Outputs : [[0, 'score_ch']]
Emits : []


Name : blast
Inputs : [[0, 'score_ch'], [1, 'indelible_ch'], [2, 'config_ch']]
Outputs : [[0, 'blast_ch']]
Emits : []


Name : annotate
Inputs : [[0, 'blast_ch'], [1, 'indelible_ch'], [2, 'config_ch'], [3, 'frequency_ch']]
Outputs : [[0, 'annotated_ch'], [0, 'annotated_ch2']]
Emits : []


Name : annotated_filter
Inputs : [[0, 'annotated_ch2']]
Outputs : [[0, 'annotated_filtered_ch']]
Emits : []


Name : denovo
Inputs : [[0, 'annotated_ch'], [1, 'indelible_ch'], [2, 'config_ch'], [3, 'ped_ch'], [4, 'parents_ch']]
Outputs : [[0, 'denovo_ch']]
Emits : []


Name : denovo_filter
Inputs : [[0, 'denovo_ch']]
Outputs : [[0, 'denovo_filtered_ch']]
Emits : []


