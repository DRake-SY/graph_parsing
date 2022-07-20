Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'raw_reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : trim_samples
Inputs : [[0, 'raw_reads_trimgalore']]
Outputs : [[0, ''], [1, 'trimqc_results'], [2, 'trim_reports']]
Emits : []


Name : index_reference
Inputs : [[0, 'labelled_reference_ch']]
Outputs : [[0, 'bwa_ref_ch'], [1, 'gatk_mutect_reference_ch']]
Emits : []


Name : build_bwa_mem_alignments
Inputs : [[0, 'bwa_mem_input_ch']]
Outputs : [[0, '']]
Emits : []


Name : picard_remove_duplicates
Inputs : [[0, 'built_bam_ch']]
Outputs : [[0, 'bam_no_dup_ch'], [1, 'picardmetrics']]
Emits : []


Name : GATK_mutect
Inputs : [[0, 'GATK_input_mutect_ch']]
Outputs : [[0, 'GATK_output_mutect_ch']]
Emits : []


Name : GATK_realign
Inputs : [[0, 'GATK_input_realign_ch']]
Outputs : [[0, 'GATK_output_realign_ch']]
Emits : []


Name : GATK_recalib
Inputs : [[0, 'GATK_input_recalib_ch']]
Outputs : [[0, '']]
Emits : []


Name : split_bam
Inputs : [[0, 'GATK_output_recalib_ch']]
Outputs : [[0, 'split_bam_ch']]
Emits : []


Name : split_reference
Inputs : [[0, 'reference_tosplit_ch']]
Outputs : [[0, 'split_reference_ch']]
Emits : []


Name : split_fasta_size
Inputs : [[0, 'fastasize_input_ch']]
Outputs : [[0, '']]
Emits : []


Name : build_coverage
Inputs : [[0, 'cov_input_ch']]
Outputs : [[0, ''], [1, '']]
Emits : []


Name : make_mpileup
Inputs : [[0, 'mpileup_input_ch']]
Outputs : [[0, '']]
Emits : []


Name : align_references
Inputs : [[0, 'reference_to_align_ch']]
Outputs : [[0, 'aligned_references_true_ch']]
Emits : []


Name : dummy_align_references
Inputs : [[0, 'ref_dummy_align_ch']]
Outputs : [[0, 'dummy_align_out_ch']]
Emits : []


Name : choose_best_references
Inputs : [[0, 'choose_consensus_input_ch']]
Outputs : [[0, ''], [1, 'chosenfilter_ch']]
Emits : []


Name : make_consensus
Inputs : [[0, 'make_consensus_input_ch']]
Outputs : [[0, 'consensus_to_concat_ch']]
Emits : []


Name : concatenate_consensus
Inputs : [[0, 'grouped_consensus_to_concat_ch']]
Outputs : []
Emits : []


Name : create_filter_sheet
Inputs : [[0, 'chosenfilter_ch']]
Outputs : [[0, 'filter_report']]
Emits : []


Name : call_varscan
Inputs : [[0, 'chosen_varscan_ch']]
Outputs : [[0, 'vcf_varscan_ch']]
Emits : []


Name : call_bcftools
Inputs : [[0, 'chosen_bcftools_ch']]
Outputs : [[0, 'vcf_bcftools_ch']]
Emits : []


Name : vcf_concat
Inputs : [[0, 'vcf_concat_input_ch']]
Outputs : [[0, 'vcf_concat_ch']]
Emits : []


Name : combine_vcf
Inputs : [[0, 'vcf_concat_ch']]
Outputs : [[0, 'combine_vcf_ch']]
Emits : []


Name : get_variant_frequency
Inputs : [[0, 'combine_vcf_ch']]
Outputs : []
Emits : []


Name : plot_graphs
Inputs : [[0, 'Rplotin_ch']]
Outputs : []
Emits : []


Name : get_big_table
Inputs : [[0, 'big_cov_input_ch']]
Outputs : []
Emits : []


Name : count_report
Inputs : [[0, 'count_input_ch']]
Outputs : [[0, 'count_table_ch']]
Emits : []


Name : make_list
Inputs : [[0, 'count_table_ch']]
Outputs : []
Emits : []


Name : extract_fastq
Inputs : [[0, 'gatk_extract_fastq_ch']]
Outputs : []
Emits : []


Name : plot_depth
Inputs : [[0, 'depth_input_ch']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'fastqc_results'], [3, 'trimqc_results'], [4, 'trim_reports'], [5, 'picardmetrics'], [6, 'software_versions_yaml'], [7, 'ch_workflow_summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


