Name : subsample
Inputs : [[0, 'ch_subsample']]
Outputs : [[0, 'ch_fastqc_pre_trim'], [0, 'ch_trimmomatic_input']]
Emits : []


Name : fastqc_pre_trim
Inputs : [[0, 'ch_fastqc_pre_trim']]
Outputs : [[0, 'ch_fastqc_pre_trim_output']]
Emits : []


Name : trimmomatic
Inputs : [[0, 'ch_trimmomatic_input']]
Outputs : [[0, 'ch_rcorrect'], [0, 'ch_fastqc_post_trim']]
Emits : []


Name : fastqc_post_trim
Inputs : [[0, 'ch_fastqc_post_trim']]
Outputs : [[0, 'ch_fastqc_post_trim_output']]
Emits : []


Name : rcorrector
Inputs : [[0, 'ch_rcorrect']]
Outputs : [[0, 'ch_bowtie2_silva_mapping']]
Emits : []


Name : bowtie2_silva_mapping
Inputs : [[0, 'ch_bowtie2_silva_mapping']]
Outputs : [[0, 'ch_trinity'], [0, 'ch_fastqc_post_correct'], [0, 'ch_sub_for_tax'], [0, 'ch_bowtie2_mapping_stats_reads'], [0, 'ch_rsem_reads']]
Emits : []


Name : fastqc_post_correct
Inputs : [[0, 'ch_fastqc_post_correct']]
Outputs : [[0, 'ch_fastqc_post_correct_output']]
Emits : []


Name : sub_for_tax
Inputs : [[0, 'ch_sub_for_tax']]
Outputs : [[0, 'ch_mmseq_create_query_dbs']]
Emits : []


Name : no_sub_for_tax
Inputs : [[0, 'ch_sub_for_tax']]
Outputs : [[0, 'ch_mmseq_create_query_dbs']]
Emits : []


Name : mmseq_create_query_dbs
Inputs : [[0, 'ch_mmseq_create_query_dbs']]
Outputs : [[0, 'ch_mmseq_taxonomy']]
Emits : []


Name : mmseq_taxonomy
Inputs : [[0, 'ch_mmseq_taxonomy']]
Outputs : [[2, 'ch_mmseq_taxonomy_out']]
Emits : []


Name : trinity
Inputs : [[0, 'ch_trinity']]
Outputs : [[0, 'ch_trinity_stats'], [0, 'ch_busco'], [0, 'ch_assembly_bowtie_db'], [0, 'ch_rsem_assemblies'], [0, 'ch_ExN50_assembly'], [1, 'ch_abund_to_matrix_gene_map']]
Emits : []


Name : trinity_stats
Inputs : [[0, 'ch_busco']]
Outputs : [[0, 'ch_trinity_stats_out']]
Emits : []


Name : busco
Inputs : [[0, 'ch_trinity_stats']]
Outputs : [[0, 'ch_busco_out']]
Emits : []


Name : assembly_bowtie_db
Inputs : [[0, 'ch_assembly_bowtie_db']]
Outputs : [[0, 'ch_bowtie2_mapping_stats_indexed_assembly']]
Emits : []


Name : bowtie2_mapping_stats_reads
Inputs : [[0, 'ch_bowtie2_mapping_stats_indexed_assembly'], [0, 'ch_bowtie2_mapping_stats_reads']]
Outputs : []
Emits : []


Name : rsem
Inputs : [[0, 'ch_rsem_assemblies'], [0, 'ch_rsem_reads']]
Outputs : [[0, 'ch_abund_to_matrix_results'], [1, 'ch_abund_to_matrix_gen_results_out']]
Emits : []


Name : abund_to_matrix
Inputs : [[0, 'ch_abund_to_matrix_results'], [0, 'ch_abund_to_matrix_gene_map']]
Outputs : [[0, 'ch_abund_to_matrix_out_out'], [1, 'ch_ExN50_matrix']]
Emits : []


Name : ExN50
Inputs : [[0, 'ch_ExN50_matrix'], [0, 'ch_ExN50_assembly']]
Outputs : [[0, 'ch_ExN50_out']]
Emits : []


