Name : kallisto_index
Inputs : [[0, 'transcriptome_file']]
Outputs : [[0, 'kallisto_idx_file']]
Emits : []


Name : kallisto_quant
Inputs : [[0, 'raw_reads'], [1, 'kallisto_idx_file']]
Outputs : [[0, 'kallisto_out']]
Emits : []


Name : merge_kallisto_count
Inputs : [[0, 'kallisto_out'], [1, 'gene2tr_file']]
Outputs : [[0, 'tpm_file'], [1, 'count_file']]
Emits : []


