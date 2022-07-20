Name : concatenate_fasta_plasmid
Inputs : [[0, 'recipients_ch'], [1, 'plasmids_ch']]
Outputs : [[0, 'readsim_ch']]
Emits : []


Name : simulate_reads
Inputs : [[0, 'readsim_ch']]
Outputs : [[0, 'fastp_ch']]
Emits : []


Name : fastp
Inputs : [[0, 'fastp_ch']]
Outputs : [[0, 'assembly_ch']]
Emits : []


Name : unicycler
Inputs : [[0, 'assembly_ch']]
Outputs : [[0, '']]
Emits : []


Name : quast
Inputs : [[0, 'quast_ch']]
Outputs : [[1, 'quast_log_ch']]
Emits : []


Name : abricate
Inputs : [[0, 'abricate_ch']]
Outputs : [[0, 'amr_ch']]
Emits : []


Name : sort_genes
Inputs : [[0, 'amr_ch']]
Outputs : []
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


