Name : find_barcode_pairs
Inputs : [[0, 'ch_barcode_pairs_list']]
Outputs : [[0, 'ch_barcode_pairs']]
Emits : []


Name : gunzip_gencome_fasta
Inputs : [[0, 'ch_genome_fasta']]
Outputs : [[0, 'ch_genome_fasta_uncompressed']]
Emits : []


Name : lima
Inputs : [[0, 'ch_ccs_reads'], [1, 'ch_barcodes']]
Outputs : [[0, 'ch_individual_lima_bam']]
Emits : []


Name : merge
Inputs : [[0, 'ch_lima_grouped_by_barcode'], [1, 'ch_barcode_pairs_use']]
Outputs : [[0, 'ch_merged_reads']]
Emits : []


Name : refine
Inputs : [[0, 'ch_merged_reads'], [1, 'ch_barcodes']]
Outputs : [[0, 'ch_refined_reads'], [1, 'ch_refined_flnc_report']]
Emits : []


Name : cluster
Inputs : [[0, 'ch_refined_reads']]
Outputs : [[0, 'ch_clustered_reads']]
Emits : []


Name : align
Inputs : [[0, 'ch_clustered_reads'], [1, 'ch_genome_fasta_uncompressed']]
Outputs : [[1, 'ch_aligned_reads']]
Emits : []


Name : collapse
Inputs : [[0, 'ch_aligned_reads']]
Outputs : [[1, 'ch_collapsed_fasta']]
Emits : []


Name : collapsed_rename_fasta
Inputs : [[0, 'ch_collapsed_fasta']]
Outputs : []
Emits : []


