Name : gather_results
Inputs : [[0, 'QUANT_DIRS']]
Outputs : [[0, 'ALL_RESULTS']]
Emits : []


Name : merge_transcript_to_gene
Inputs : [[0, 'TRANSCRIPT_TO_GENE_MANY']]
Outputs : [[0, 'TRANSCRIPT_TO_GENE']]
Emits : []


Name : find_kallisto_results
Inputs : [[0, 'KALLISTO_RESULTS']]
Outputs : [[0, 'KALLISTO_RESULT_SETS']]
Emits : []


Name : chunk_kallisto
Inputs : [[0, 'KALLISTO_RESULT_SETS']]
Outputs : [[0, 'KALLISTO_CHUNKS']]
Emits : []


Name : kallisto_gene_count_matrix
Inputs : [[0, 'TRANSCRIPT_TO_GENE'], [1, 'FLATTENED_KALLISTO_CHUNKS']]
Outputs : [[0, 'KALLISTO_CHUNK_COUNT_MATRICES'], [1, 'KALLISTO_CHUNK_ABUNDANCE_MATRICES'], [2, 'KALLISTO_CHUNK_STATS']]
Emits : []


Name : alevin_runs
Inputs : [[0, 'ALEVIN_RESULTS']]
Outputs : [[0, 'ALEVIN_RESULTS_BY_LIB']]
Emits : []


Name : alevin_to_mtx
Inputs : [[0, 'FLATTENED_ALEVIN_RESULTS_BY_LIB']]
Outputs : [[0, 'ALEVIN_CHUNK_COUNT_MATRICES']]
Emits : []


Name : alevin_stats
Inputs : [[0, 'FLATTENED_ALEVIN_RESULTS_BY_LIB_FOR_STATS']]
Outputs : [[0, 'ALEVIN_CHUNK_STATS']]
Emits : []


Name : merge_count_chunk_matrices
Inputs : [[0, 'PROTOCOL_COUNT_CHUNKS']]
Outputs : [[0, 'PROTOCOL_COUNT_MATRICES']]
Emits : []


Name : merge_protocol_count_matrices
Inputs : [[0, 'PROTOCOL_COUNT_MATRICES']]
Outputs : [[0, 'EXP_COUNT_MATRICES']]
Emits : []


Name : merge_tpm_chunk_matrices
Inputs : [[0, 'PROTOCOL_KALLISTO_ABUNDANCE_CHUNKS']]
Outputs : [[0, 'protocol']]
Emits : []


