Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : validate_sketch_value
Inputs : [[0, 'sketch_num_hashes'], [1, 'sketch_num_hashes_log2'], [2, 'sketch_scaled'], [3, 'sketch_scaled_log2']]
Outputs : [[0, 'ch_sketch_value_unparsed'], [1, 'ch_sketch_style_unparsed']]
Emits : []


Name : make_protein_index
Inputs : [[0, 'ch_reference_proteome_fasta']]
Outputs : [[0, 'ch_orpheum_bloom_filter']]
Emits : []


Name : tenx_tgz_extract_bam
Inputs : [[0, 'tenx_tgz_ch']]
Outputs : [[0, 'tenx_bam_for_unaligned_fastq_ch'], [0, 'tenx_bam_for_aligned_fastq_ch'], [1, 'bai'], [2, 'tenx_bam_barcodes_ch']]
Emits : []


Name : samtools_fastq_aligned
Inputs : [[0, 'tenx_bam_for_unaligned_fastq_ch']]
Outputs : [[0, 'tenx_reads_aligned_counting_ch'], [0, 'tenx_reads_aligned_concatenation_ch']]
Emits : []


Name : samtools_fastq_unaligned
Inputs : [[0, 'tenx_bam_for_aligned_fastq_ch']]
Outputs : [[0, 'tenx_reads_unaligned_ch']]
Emits : []


Name : count_umis_per_cell
Inputs : [[0, 'tenx_reads_aligned_counting_ch']]
Outputs : [[0, 'umis_per_cell'], [1, 'good_barcodes_unfiltered_ch']]
Emits : []


Name : extract_per_cell_fastqs
Inputs : [[0, 'tenx_reads_with_good_barcodes_ch']]
Outputs : [[0, 'per_cell_fastqs_ch_possibly_empty'], [1, 'ch_fastq_id_to_cell_id_is_aligned']]
Emits : []


Name : fastp
Inputs : [[0, 'ch_read_files_trimming_to_trim']]
Outputs : [[0, 'ch_reads_all_trimmed'], [1, 'ch_fastp_results'], [2, 'ch_fastp_html']]
Emits : []


Name : subsample_input
Inputs : [[0, 'subsample_ch_reads_for_ribosomal_removal']]
Outputs : [[0, 'ch_reads_for_ribosomal_removal']]
Emits : []


Name : sortmerna_index
Inputs : [[0, 'sortmerna_fasta']]
Outputs : [[0, 'sortmerna_db_name'], [1, 'sortmerna_db_fasta'], [2, 'sortmerna_db']]
Emits : []


Name : sortmerna
Inputs : [[0, 'ch_reads_for_ribosomal_removal'], [1, 'sortmerna_db_name'], [2, 'sortmerna_db_fasta'], [3, 'sortmerna_db']]
Outputs : [[0, 'ch_reads_to_translate'], [1, 'sortmerna_logs']]
Emits : []


Name : translate
Inputs : [[0, 'ch_orpheum_bloom_filter'], [1, 'ch_reads_to_translate']]
Outputs : [[0, 'ch_noncoding_nucleotides_potentially_empty'], [1, 'ch_translated_protein_seqs'], [2, 'ch_translatable_nucleotide_seqs'], [3, 'ch_coding_scores_csv'], [4, 'ch_coding_scores_json']]
Emits : []


Name : ska_compute_sketch
Inputs : [[0, 'ksizes'], [1, 'ch_reads_to_sketch']]
Outputs : [[0, 'ska_sketches']]
Emits : []


Name : sourmash_compute_sketch_fastx_nucleotide
Inputs : [[0, 'track_abundance'], [1, 'sketch_value_parsed'], [2, 'sketch_style_parsed'], [3, 'ch_reads_to_sketch']]
Outputs : [[0, 'ch_sourmash_sig_describe_nucleotides'], [1, 'sourmash_sketches_all_nucleotide']]
Emits : []


Name : sourmash_compute_sketch_fastx_peptide
Inputs : [[0, 'track_abundance'], [1, 'sketch_value_parsed'], [2, 'sketch_style_parsed'], [3, 'ch_protein_seq_to_sketch']]
Outputs : [[0, 'ch_sourmash_sig_describe_peptides'], [1, 'sourmash_sketches_all_peptide']]
Emits : []


Name : sourmash_sig_merge
Inputs : [[0, 'ch_sourmash_sketches_to_merge']]
Outputs : [[0, 'ch_sourmash_sig_describe_merged'], [1, 'ch_sourmash_sketches_merged'], [1, 'ch_sourmash_sketches_merged_to_view'], [1, 'ch_sourmash_sketches_merged_for_moltypes_ksizes']]
Emits : []


Name : ska_compare_sketches
Inputs : [[0, 'ska_sketches']]
Outputs : []
Emits : []


Name : sourmash_compare_sketches
Inputs : [[0, 'ch_sourmash_sketches_to_compare']]
Outputs : [[0, 'csv']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_sourmash_sig_describe_merged'], [2, 'ch_sourmash_sig_describe_peptides'], [3, 'ch_sourmash_sig_describe_nucleotides'], [4, 'ch_fastp_results'], [5, 'sortmerna_logs'], [6, 'ch_software_versions_yaml'], [7, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


