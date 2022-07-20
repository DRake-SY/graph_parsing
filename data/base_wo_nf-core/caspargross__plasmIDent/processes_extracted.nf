Name : filter_reads
Inputs : [[0, 'samples']]
Outputs : [[0, 'samples_filtered']]
Emits : []


Name : save_plasmids
Inputs : [[0, 'contigs_3']]
Outputs : []
Emits : []


Name : pad_plasmids
Inputs : [[0, 'contigs_2']]
Outputs : [[0, 'contigs_padded']]
Emits : []


Name : combine_padded_contigs
Inputs : [[0, 'contigs_padded']]
Outputs : [[0, 'assembly_padded']]
Emits : []


Name : map_longreads
Inputs : [[0, 'to_mapping']]
Outputs : [[0, 'bam_lr']]
Emits : []


Name : find_ovlp_reads
Inputs : [[0, 'contigs']]
Outputs : [[0, 'circos_reads']]
Emits : []


Name : identify_resistance_genes
Inputs : [[0, 'samples_rgi']]
Outputs : [[0, 'from_rgi']]
Emits : []


Name : format_data_rgi
Inputs : [[0, 'rgi_txt']]
Outputs : [[0, 'circos_data_rgi']]
Emits : []


Name : mos_depth
Inputs : [[0, 'bam_cov']]
Outputs : [[1, 'cov_bed']]
Emits : []


Name : format_data_cov
Inputs : [[0, 'cov_bed']]
Outputs : [[0, 'cov_formated']]
Emits : []


Name : calcGC
Inputs : [[0, 'gc_padded']]
Outputs : [[0, 'table_data_gc'], [1, 'circos_data_gc']]
Emits : []


Name : glimmer
Inputs : [[0, 'samples_glimmer']]
Outputs : [[0, 'genes_glimmer']]
Emits : []


Name : format_glimmer
Inputs : [[0, 'genes_glimmer']]
Outputs : [[0, 'circos_data_genes']]
Emits : []


Name : circos
Inputs : [[0, 'combined_data']]
Outputs : []
Emits : []


Name : table
Inputs : [[0, 'table_data']]
Outputs : []
Emits : []


