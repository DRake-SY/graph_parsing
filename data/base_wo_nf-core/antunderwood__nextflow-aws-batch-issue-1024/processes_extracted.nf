Name : fetch_from_ena
Inputs : [[0, 'accession_numbers']]
Outputs : [[0, 'raw_fastqs']]
Emits : []


Name : determine_min_read_length
Inputs : [[0, 'raw_fastqs_for_length_assessment']]
Outputs : [[0, 'min_read_length_for_trimming'], [0, 'min_read_length_for_assembly']]
Emits : []


Name : qc_pre_trimming
Inputs : [[0, 'raw_fastqs_for_qc']]
Outputs : []
Emits : []


Name : trimming
Inputs : [[0, 'min_read_length_and_raw_fastqs'], [1, 'adapter_file']]
Outputs : [[0, 'trimmed_fastqs_for_qc'], [0, 'trimmed_fastqs_for_correction'], [0, 'trimmed_fastqs_for_genome_size_estimation'], [0, 'trimmed_fastqs_for_base_counting']]
Emits : []


Name : qc_post_trimming
Inputs : [[0, 'trimmed_fastqs_for_qc']]
Outputs : [[1, 'qc_post_trimming_files'], [2, 'fastqc_directories']]
Emits : []


Name : fastqc_multiqc
Inputs : [[0, 'fastqc_directories']]
Outputs : []
Emits : []


Name : genome_size_estimation
Inputs : [[0, 'trimmed_fastqs_for_genome_size_estimation']]
Outputs : [[0, 'mash_output']]
Emits : []


Name : read_correction
Inputs : [[0, 'trimmed_fastqs_and_genome_size']]
Outputs : [[0, 'read_correction_output'], [1, 'corrected_fastqs_for_merging'], [1, 'corrected_fastqs_for_contamination_check']]
Emits : []


Name : check_for_contamination
Inputs : [[0, 'corrected_fastqs_for_contamination_check']]
Outputs : [[0, 'confindr_files']]
Emits : []


Name : count_number_of_bases
Inputs : [[0, 'trimmed_fastqs_for_base_counting']]
Outputs : [[0, 'seqtk_fqchk_output']]
Emits : []


Name : merge_reads
Inputs : [[0, 'corrected_fastqs_and_genome_size_and_base_count']]
Outputs : [[0, 'merged_fastqs']]
Emits : []


Name : spades_assembly
Inputs : [[0, 'min_read_length_and_raw_fastqs']]
Outputs : [[0, 'scaffolds']]
Emits : []


Name : filter_scaffolds
Inputs : [[0, 'scaffolds']]
Outputs : [[0, 'scaffolds_for_single_analysis'], [0, 'scaffolds_for_qc'], [1, 'scaffolds_for_combined_analysis']]
Emits : []


Name : quast
Inputs : [[0, 'scaffolds_for_single_analysis']]
Outputs : [[0, 'quast_files_for_multiqc'], [1, 'quast_files_for_qualifyr']]
Emits : []


Name : quast_summary
Inputs : [[0, 'scaffolds_for_combined_analysis']]
Outputs : []
Emits : []


Name : quast_multiqc
Inputs : [[0, 'quast_files_for_multiqc']]
Outputs : []
Emits : []


Name : overall_quality
Inputs : [[0, 'qc_conditions_yml'], [1, 'quality_files']]
Outputs : [[1, 'qualifyr_json_files']]
Emits : []


Name : write_assembly_to_dir
Inputs : [[0, 'scaffolds_for_qc']]
Outputs : []
Emits : []


Name : qualifyr_report
Inputs : [[0, 'qualifyr_json_files']]
Outputs : []
Emits : []


