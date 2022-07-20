Name : trim_reads_with_fastp
Inputs : [[0, 'reads']]
Outputs : [[0, 'trimmed_reads_channel_r1'], [1, 'trimmed_reads_channel_r2'], [2, 'fastp_html'], [3, 'fastp_json']]
Emits : []


Name : align_reads_with_bwa
Inputs : [[0, 'trimmed_reads_channel_r1'], [1, 'trimmed_reads_channel_r2']]
Outputs : [[0, 'inital_bam_channel'], [1, 'inital_bam_indexes_channel']]
Emits : []


Name : merge_bams_and_remove_duplicates
Inputs : [[0, 'inital_bam_channel'], [1, 'inital_bam_indexes_channel']]
Outputs : [[0, 'mark_duplicates_bam_channel'], [1, 'mark_duplicates_bam_index_channel']]
Emits : []


Name : sort_capture_bed
Inputs : [[0, 'capture_bed']]
Outputs : [[0, 'sorted_capture_bed']]
Emits : []


Name : split_bed_by_chromosome
Inputs : [[0, 'chromosomes_ch'], [1, 'sorted_capture_bed']]
Outputs : [[0, 'per_chromosome_bed_channel']]
Emits : []


Name : call_variants_with_platypus
Inputs : [[0, 'mark_duplicates_bam_channel'], [1, 'mark_duplicates_bam_index_channel'], [2, 'per_chromosome_bed_channel']]
Outputs : [[0, 'per_chromsome_vcf_channel'], [1, 'per_chromsome_vcf_log_channel']]
Emits : []


Name : fix_platypus_headers
Inputs : [[0, 'per_chromsome_vcf_channel']]
Outputs : [[0, 'per_chromsome_vcf_sd_channel']]
Emits : []


Name : collect_per_chromosome_vcfs_split_and_normalise
Inputs : [[0, 'per_chromsome_vcf_sd_channel']]
Outputs : [[0, 'merged_and_normalised_vcf_channel']]
Emits : []


Name : annotate_with_vep
Inputs : [[0, 'merged_and_normalised_vcf_channel']]
Outputs : [[0, 'annotated_vcf']]
Emits : []


Name : get_sample_names_from_vcf
Inputs : [[0, 'annotated_vcf_sample_names']]
Outputs : [[0, 'sample_names_from_vcf']]
Emits : []


Name : create_snp_indel_variant_report
Inputs : [[0, 'annotated_vcf_report'], [1, 'samples_ch']]
Outputs : [[0, 'variant_report_filtered'], [1, 'variant_report_unfiltered']]
Emits : []


