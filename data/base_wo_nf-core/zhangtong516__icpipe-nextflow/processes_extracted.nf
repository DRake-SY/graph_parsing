Name : collapse_reads
Inputs : [[0, 'ch_reads']]
Outputs : [[0, 'collapsed_reads'], [1, 'collapsed_read_count']]
Emits : []


Name : trim_adaptor
Inputs : [[0, 'collapsed_reads']]
Outputs : [[0, 'trimmed_reads'], [1, 'trimmed_read_count']]
Emits : []


Name : mapping_rRNA
Inputs : [[0, 'trimmed_reads']]
Outputs : [[0, 'removed_rRNA_fq'], [1, 'mapped_rRNA_sam']]
Emits : []


Name : mapping_smallRNA
Inputs : [[0, 'removed_rRNA_fq']]
Outputs : [[0, 'removed_smallRNA_fq'], [1, 'mapped_smallRNA_sam']]
Emits : []


Name : star_mapping_genome
Inputs : [[0, 'removed_smallRNA_fq']]
Outputs : [[0, 'mapped_bam_for_fpkm'], [1, 'mapped_bam_for_sam2tab'], [2, 'mapped_bam_for_coverage'], [3, 'unsorted_bam'], [4, 'log_progress'], [5, 'log_final'], [6, 'log_out'], [7, 'log_std']]
Emits : []


Name : estimate_rpkm
Inputs : [[0, 'mapped_bam_for_fpkm']]
Outputs : [[0, 'gene_rpkm'], [1, 'txn_rpkm'], [2, 'gene_rpkm_summary'], [3, 'txn_rpkm_summary'], [4, 'isoform_fpkm'], [5, 'isoform_fpkm2'], [6, 'gene_fpkm'], [7, 'skipped_gtf'], [8, 'transcripts_gtf']]
Emits : []


Name : sam2tab
Inputs : [[0, 'mapped_bams']]
Outputs : [[0, 'genome_sam2tab1'], [1, 'genome_sam2tab2'], [2, 'genome_sam2tab3'], [3, 'genome_sam2tab4']]
Emits : []


Name : tab2gTab_single
Inputs : [[0, 'ch_for_genome_SHAPE_single']]
Outputs : [[0, 'single_gTab']]
Emits : []


Name : gTab2RTBD_single
Inputs : [[0, 'single_gTab_rpkm']]
Outputs : [[0, 'single_RTBD'], [1, 'single_shape']]
Emits : []


Name : coverage_rt_count
Inputs : [[0, 'single_RTBD']]
Outputs : [[0, 'single_coverage']]
Emits : []


Name : merge_coverage
Inputs : [[0, 'ch_for_merge_coverage']]
Outputs : []
Emits : []


Name : tab2gTab_merged
Inputs : [[0, 'ch_for_genome_SHAPE']]
Outputs : [[0, 'merged_gTab']]
Emits : []


Name : calculate_shape
Inputs : [[0, 'ch_for_SHAPE']]
Outputs : [[0, 'final_shape']]
Emits : []


Name : generate_bedgraph
Inputs : [[0, 'final_shape']]
Outputs : [[0, 'transcritome_bedgraph']]
Emits : []


