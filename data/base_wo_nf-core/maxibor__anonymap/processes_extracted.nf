Name : AdapterRemoval
Inputs : [[0, 'reads_to_trim']]
Outputs : [[0, 'trimmed_reads'], [1, 'adapter_removal_results']]
Emits : []


Name : Bowtie2Align
Inputs : [[0, 'trimmed_reads'], [1, 'bt_index_genome']]
Outputs : [[0, 'alignment_genome'], [1, 'align1_multiqc']]
Emits : []


Name : anonymize
Inputs : [[0, 'alignment_genome']]
Outputs : [[0, 'anonysam']]
Emits : []


