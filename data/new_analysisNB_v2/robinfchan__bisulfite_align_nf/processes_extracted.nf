Name : fastqc
Inputs : [[0, 'ch_read_files_for_fastqc']]
Outputs : [[0, 'ch_fastqc_results_for_multiqc']]
Emits : []


Name : trim_galore
Inputs : [[0, 'ch_read_files_for_trim_galore']]
Outputs : [[0, 'ch_trimmed_reads_for_alignment'], [1, 'ch_trim_galore_results_for_multiqc']]
Emits : []


Name : nugen_trim
Inputs : [[0, 'ch_trimmed_reads_for_alignment']]
Outputs : [[0, 'ch_nugen_trimmed_reads_for_alignment']]
Emits : []


Name : bismark_align
Inputs : [[0, 'ch_final_trimmed_reads_for_alignment'], [0, 'ch_trimmed_reads_for_alignment_preproc'], [1, 'ch_bismark_index_for_bismark_align']]
Outputs : [[0, 'ch_bam_for_bismark_deduplicate'], [0, 'ch_bam_for_bismark_summary'], [0, 'ch_bam_for_preseq'], [1, 'ch_bismark_align_log_for_bismark_report'], [1, 'ch_bismark_align_log_for_bismark_summary'], [1, 'ch_bismark_align_log_for_multiqc']]
Emits : []


Name : bismark_deduplicate
Inputs : [[0, 'ch_bam_for_bismark_deduplicate'], [0, 'ch_bam_for_bismark_deduplicate_preproc']]
Outputs : [[0, 'ch_bam_dedup_for_bismark_methXtract'], [0, 'ch_bam_dedup_for_qualimap'], [1, 'ch_bismark_dedup_log_for_bismark_report'], [1, 'ch_bismark_dedup_log_for_bismark_summary'], [1, 'ch_bismark_dedup_log_for_multiqc']]
Emits : []


Name : bismark_methXtract
Inputs : [[0, 'ch_bam_dedup_for_bismark_methXtract'], [1, 'ch_bismark_index_for_bismark_methXtract']]
Outputs : [[0, 'ch_bismark_splitting_report_for_bismark_report'], [0, 'ch_bismark_splitting_report_for_bismark_summary'], [0, 'ch_bismark_splitting_report_for_multiqc'], [1, 'ch_bismark_mbias_for_bismark_report'], [1, 'ch_bismark_mbias_for_bismark_summary'], [1, 'ch_bismark_mbias_for_multiqc']]
Emits : []


Name : bismark_report
Inputs : [[0, 'ch_bismark_logs_for_bismark_report']]
Outputs : [[0, 'ch_bismark_reports_results_for_multiqc']]
Emits : []


Name : bismark_summary
Inputs : [[0, 'ch_bam_for_bismark_summary'], [1, 'ch_bismark_align_log_for_bismark_summary'], [2, 'ch_bismark_dedup_log_for_bismark_summary'], [3, 'ch_bismark_splitting_report_for_bismark_summary'], [4, 'ch_bismark_mbias_for_bismark_summary']]
Outputs : [[0, 'ch_bismark_summary_results_for_multiqc']]
Emits : []


Name : qualimap
Inputs : [[0, 'ch_bam_dedup_for_qualimap']]
Outputs : [[0, 'ch_qualimap_results_for_multiqc']]
Emits : []


Name : preseq
Inputs : [[0, 'ch_bam_for_preseq']]
Outputs : [[0, 'preseq_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_fastqc_results_for_multiqc'], [1, 'ch_trim_galore_results_for_multiqc'], [2, 'ch_bismark_align_log_for_multiqc'], [3, 'ch_bismark_dedup_log_for_multiqc'], [4, 'ch_bismark_splitting_report_for_multiqc'], [5, 'ch_bismark_mbias_for_multiqc'], [6, 'ch_bismark_reports_results_for_multiqc'], [7, 'ch_bismark_summary_results_for_multiqc'], [8, 'ch_qualimap_results_for_multiqc'], [9, 'preseq_results']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


