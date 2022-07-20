Name : fastqc
Inputs : [[0, 'qc_read_pairs']]
Outputs : [[0, 'fastqc_channel']]
Emits : []


Name : bbduk_trim
Inputs : [[0, 'read_pairs'], [1, 'polyA_reference'], [2, 'truseq_adapters_reference'], [3, 'truseq_rna_adapters_reference'], [4, 'rRNA_reference']]
Outputs : [[0, 'trimmed_reads_channel'], [1, 'trimmed_reads_qc_channel'], [2, 'waste_channel'], [3, 'contamination_channel'], [4, 'sample_name_channel']]
Emits : []


Name : salmon_align
Inputs : [[0, 'salmon_index_ch'], [1, 'sample_name_channel'], [2, 'trimmed_reads_channel']]
Outputs : [[0, 'aligned_channel']]
Emits : []


Name : multiqc
Inputs : [[0, 'aligned_channel'], [1, 'fastqc_channel'], [2, 'trimmed_reads_qc_channel'], [3, 'waste_channel'], [4, 'contamination_channel']]
Outputs : []
Emits : []


