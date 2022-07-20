Name : real
Inputs : [[0, 'read_files_real']]
Outputs : [[0, 'real_output']]
Emits : []


Name : split_chr
Inputs : [[0, 'fasta_split_chr']]
Outputs : [[0, 'chrs']]
Emits : []


Name : isosegmenter
Inputs : [[0, 'chr']]
Outputs : [[0, 'iso'], [0, 'iso_mk_gene_exp_input']]
Emits : []


Name : no_reads
Inputs : [[0, 'iso_no_reads']]
Outputs : [[0, 'csv']]
Emits : []


Name : mk_gene_exp_input
Inputs : [[0, 'iso_mk_gene_exp_input'], [1, 'csv']]
Outputs : [[0, 'gene_exp']]
Emits : []


Name : gene_exp
Inputs : [[0, 'gene_exp']]
Outputs : [[0, 'results']]
Emits : []


