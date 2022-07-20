Name : trim_fastq
Inputs : [[0, 'sample_fastqs_ch']]
Outputs : [[0, ''], [1, 'log_cutadapt']]
Emits : []


Name : fastqc
Inputs : [[0, 'trim_fastqc']]
Outputs : []
Emits : []


Name : align_trimmed_fastq
Inputs : [[0, 'trimmed_reads_fq']]
Outputs : [[0, 'aligned_ch'], [1, 'log_bowtie']]
Emits : []


Name : sort_alignment
Inputs : [[0, 'aligned_ch']]
Outputs : [[0, 'sorted_align_ch']]
Emits : []


Name : flag_pcr_dupes
Inputs : [[0, 'sorted_align_ch']]
Outputs : [[0, ''], [1, 'log_sorted_metrics'], [2, 'log_picard']]
Emits : []


Name : rm_dupe_reads
Inputs : [[0, 'sorted_marked_bam_rmdup_ch']]
Outputs : [[0, 'sorted_rmdup_bam_ch']]
Emits : []


Name : calc_mtdna_filter_chrm
Inputs : [[0, 'sorted_rmdup_bam_ch']]
Outputs : [[0, 'mtdna_filter_bams_ch'], [1, 'log_mtdna_content']]
Emits : []


Name : filter_rmmulti_shift
Inputs : [[0, 'mtdna_filter_bams_ch']]
Outputs : [[0, 'shift_tmp_bams_ch'], [1, 'sort_rm_dup_chrm_multi_filter_ch']]
Emits : []


Name : filter_rmmulti_sieve
Inputs : [[0, 'shift_tmp_bams_ch']]
Outputs : [[0, 'shift_bams_ch']]
Emits : []


Name : filter_rmmulti_sort
Inputs : [[0, 'shift_bams_ch']]
Outputs : [[0, '']]
Emits : []


Name : chain_convert_peak_b6
Inputs : [[0, 'sort_rm_dup_chrm_mult_filt_shift_chain_file']]
Outputs : [[0, 'bam_peak_b6_mm10_ch']]
Emits : []


Name : chain_sort_coords
Inputs : [[0, 'bam_peak_b6_mm10_ch']]
Outputs : [[0, '']]
Emits : []


Name : chain_extract_badreads_b6
Inputs : [[0, 'bams_sort_mm10_extract_ch']]
Outputs : [[0, 'bad_reads_ch']]
Emits : []


Name : chain_bad_to_uniq_reads
Inputs : [[0, 'bad_reads_ch']]
Outputs : [[0, 'read_uniq_ch']]
Emits : []


Name : chain_filter_reads_b6
Inputs : [[0, 'bams_sort_mm10_filter_ch'], [1, 'read_uniq_ch']]
Outputs : [[0, 'bam_mm10_ch']]
Emits : []


Name : chain_sort_fixmate_bam
Inputs : [[0, 'bam_mm10_ch']]
Outputs : [[0, 'sort_rm_dup_chrm_multi_filter_shifted_mm10_chain']]
Emits : []


Name : non_chain_reindex
Inputs : [[0, 'sort_rm_dup_chrm_mult_filt_shift_chain_null']]
Outputs : [[0, 'sort_rm_dup_chrm_multi_filter_shifted_mm10_non_chain']]
Emits : []


Name : peak_calling
Inputs : [[0, 'processed_bams_ch_peak_calling']]
Outputs : [[0, '']]
Emits : []


Name : bam_coverage_bigwig
Inputs : [[0, 'processed_bams_ch_bigwig']]
Outputs : []
Emits : []


Name : frip_reads_in_peaks
Inputs : [[0, 'peak_frip_reads_ch'], [1, 'processed_bams_ch_frip_reads']]
Outputs : [[0, 'reads_peaks_bams_ch']]
Emits : []


Name : final_calc_frip
Inputs : [[0, 'reads_peaks_bams_ch'], [1, 'processed_bams_ch_final_calc_frip']]
Outputs : [[0, 'log_fraction_reads']]
Emits : []


Name : peak_coverage
Inputs : [[0, 'peak_call_cvg_ch']]
Outputs : [[0, 'peak_cvg_saf_ch']]
Emits : []


Name : feature_counts
Inputs : [[0, 'peak_cvg_saf_ch'], [1, 'processed_bams_ch_feature_counts']]
Outputs : [[0, 'feat_count_ch']]
Emits : []


Name : feature_count_to_bed
Inputs : [[0, 'feat_count_ch']]
Outputs : []
Emits : []


Name : quality_checks
Inputs : [[0, 'sort_rm_dup_chrm_multi_filter_ch']]
Outputs : [[0, 'frag_len_count_ch']]
Emits : []


Name : frag_len_plot
Inputs : [[0, 'frag_len_count_ch']]
Outputs : []
Emits : []


Name : library_complexity
Inputs : [[0, 'sorted_marked_bam_lib_cmplx_ch']]
Outputs : [[0, 'tmp_bams_ch']]
Emits : []


Name : calc_pbc_metrics
Inputs : [[0, 'tmp_bams_ch']]
Outputs : [[0, 'log_pbc_qc']]
Emits : []


Name : logparser
Inputs : [[0, 'log_cutadapt'], [1, 'log_bowtie'], [2, 'log_sorted_metrics'], [3, 'log_mtdna_content'], [4, 'log_pbc_qc'], [5, 'log_fraction_reads']]
Outputs : []
Emits : []


