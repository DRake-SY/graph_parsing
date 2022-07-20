Name : alignment
Inputs : [[0, 'fq_ch'], [1, 'bt2_idx']]
Outputs : [[0, 'x_aln_ch'], [0, 'y_aln_ch']]
Emits : []


Name : y_reads
Inputs : [[0, 'y_aln_ch']]
Outputs : [[0, 'y_result_ch']]
Emits : []


Name : x_reads
Inputs : [[0, 'x_aln_ch']]
Outputs : [[0, 'x_result_ch']]
Emits : []


