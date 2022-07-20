Name : demultiplex
Inputs : [[0, 'multiplexed_reads']]
Outputs : [[0, 'reads']]
Emits : []


Name : demultiplex_porechop
Inputs : [[0, 'multiplexed_reads_porechop']]
Outputs : [[0, 'reads']]
Emits : []


Name : QC
Inputs : [[0, 'reads']]
Outputs : [[0, 'reads_fastqc'], [0, 'qc_results']]
Emits : []


Name : fastqc
Inputs : [[0, 'reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results']]
Outputs : []
Emits : []


Name : kmer_freqs
Inputs : [[0, 'qc_results']]
Outputs : [[0, 'freqs'], [1, 'freqs_qc_results']]
Emits : []


Name : read_clustering
Inputs : [[0, 'freqs'], [1, 'freqs_qc_results']]
Outputs : [[0, 'clustering_out']]
Emits : []


Name : split_by_cluster
Inputs : [[0, 'clustering_out']]
Outputs : [[0, 'cluster_reads']]
Emits : []


Name : read_correction
Inputs : [[0, 'cluster_reads']]
Outputs : [[0, 'corrected_reads']]
Emits : []


Name : draft_selection
Inputs : [[0, 'corrected_reads']]
Outputs : [[0, 'draft']]
Emits : []


Name : racon_pass
Inputs : [[0, 'draft']]
Outputs : [[0, 'racon_output']]
Emits : []


Name : medaka_pass
Inputs : [[0, 'racon_output']]
Outputs : [[0, 'final_consensus']]
Emits : []


Name : consensus_classification
Inputs : [[0, 'final_consensus']]
Outputs : [[1, 'classifications_ch']]
Emits : []


Name : join_results
Inputs : [[0, 'classifications_ch']]
Outputs : [[0, 'output_table_ch']]
Emits : []


Name : get_abundances
Inputs : [[0, 'output_table_ch']]
Outputs : [[0, 'abundance_table_ch']]
Emits : []


Name : plot_abundances
Inputs : [[0, 'abundance_table_ch']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


