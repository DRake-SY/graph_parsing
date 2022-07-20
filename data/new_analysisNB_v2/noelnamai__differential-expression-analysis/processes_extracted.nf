Name : trim_reads
Inputs : [[0, 'read_pairs_ch']]
Outputs : [[0, 'trimmed_read_pairs_1_ch'], [1, 'trimmed_read_pairs_2_ch']]
Emits : []


Name : check_read_quality
Inputs : [[0, 'trimmed_read_pairs_1_ch']]
Outputs : [[0, 'fastqc_ch']]
Emits : []


Name : convert_gff3_to_gtf
Inputs : [[0, 'gff3']]
Outputs : [[0, 'gtf_1_ch'], [1, 'gtf_2_ch']]
Emits : []


Name : extract_exons_and_ss
Inputs : [[0, 'gtf_1_ch']]
Outputs : [[0, 'extracted_exons_and_ss_ch']]
Emits : []


Name : build_genome_index
Inputs : [[0, 'genome'], [1, 'extracted_exons_and_ss_ch']]
Outputs : [[0, 'genome_index_ch']]
Emits : []


Name : map_reads_to_reference
Inputs : [[0, 'genome'], [1, 'genome_index_ch'], [2, 'trimmed_read_pairs_2_ch']]
Outputs : [[0, 'aligned_sam_ch']]
Emits : []


Name : convert_sam_to_bam
Inputs : [[0, 'aligned_sam_ch']]
Outputs : [[0, 'aligned_bam_ch']]
Emits : []


Name : sort_bam_file
Inputs : [[0, 'aligned_bam_ch']]
Outputs : [[0, 'aligned_sorted_bam_ch']]
Emits : []


Name : generate_raw_counts
Inputs : [[0, 'gtf_2_ch'], [1, 'aligned_sorted_bam_ch']]
Outputs : [[0, 'raw_counts_ch']]
Emits : []


Name : detect_dexp_genes
Inputs : [[0, 'raw_counts_ch']]
Outputs : [[0, 'dgexp_png_tsv_ch']]
Emits : []


