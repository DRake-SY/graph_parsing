Name : cutadapt
Inputs : [[0, 'samples']]
Outputs : [[0, 'trimmed_fastq'], [1, 'cutadapt_log']]
Emits : []


Name : fastq_screen
Inputs : [[0, 'trimmed_fastq_screen']]
Outputs : [[0, 'fastq_screen_html'], [1, 'fastq_screen_txt']]
Emits : []


Name : rsem_star
Inputs : [[0, 'trimmed_fastq_star']]
Outputs : [[0, 'bam_star'], [1, 'transcript_bam_star'], [2, 'star_results'], [3, 'star_stat']]
Emits : []


Name : dgea
Inputs : [[0, 'r_script'], [1, 'design_file'], [2, 'star_results_dgea']]
Outputs : [[0, 'dgea']]
Emits : []


Name : rsem_star_mbscreen
Inputs : [[0, 'trimmed_fastq_star_mbscreen']]
Outputs : [[0, 'bam_star_mbscreen'], [1, 'transcript_bam_star_mbscreen'], [2, 'results_star_mbscreen'], [3, 'stat_star_mbscreen']]
Emits : []


Name : sort_index_star
Inputs : [[0, 'bam_star_sort']]
Outputs : [[0, 'bam_star_sorted']]
Emits : []


Name : picard_group
Inputs : [[0, 'bam_star_sorted_picard']]
Outputs : [[0, 'picard_rg']]
Emits : []


Name : picard_duplicates
Inputs : [[0, 'picard_rg_duplicate']]
Outputs : [[0, 'picard_dupmarked'], [1, 'picard_duplicate']]
Emits : []


Name : index_picard
Inputs : [[0, 'picard_dupmarked_indexing']]
Outputs : [[0, 'bai_picard']]
Emits : []


Name : picard_complexity
Inputs : [[0, 'picard_dupmarked_complexity']]
Outputs : [[0, 'picard_complexity']]
Emits : []


Name : picard_rnaseqmetrics
Inputs : [[0, 'picard_dupmarked_rnaseqmetrics']]
Outputs : [[0, 'picard_rnaseqmetrics']]
Emits : []


Name : picard_multimetrics
Inputs : [[0, 'picard_dupmarked_multimetrics']]
Outputs : [[0, 'picard_multimetrics_pdf'], [1, 'picard_multimetrics_metrics']]
Emits : []


Name : infer_experiment
Inputs : [[0, 'picard_dupmarked_infer_experiment']]
Outputs : [[0, 'infer_experiment']]
Emits : []


Name : junction_annotation
Inputs : [[0, 'picard_dupmarked_junction_annotation']]
Outputs : [[0, 'junction_annotation']]
Emits : []


Name : junction_saturation
Inputs : [[0, 'picard_dupmarked_junction_saturation']]
Outputs : [[0, 'junction_saturation']]
Emits : []


Name : mismatch_profile
Inputs : [[0, 'picard_dupmarked_mismatch_profile']]
Outputs : [[0, 'mismatch_profile']]
Emits : []


Name : read_distribution
Inputs : [[0, 'picard_dupmarked_read_distribution']]
Outputs : [[0, 'read_distribution']]
Emits : []


Name : transcript_integrity_number
Inputs : [[0, 'bai_picard_transcript_integrity_number']]
Outputs : [[0, 'transcript_integrity_number']]
Emits : []


Name : rnaseqc
Inputs : [[0, 'bai_picard_rnaseqc']]
Outputs : [[0, 'rnaseqc']]
Emits : []


Name : multiqc
Inputs : [[0, 'cutadapt_log'], [1, 'fastq_screen_html'], [2, 'fastq_screen_txt'], [3, 'bam_star_multiqc'], [4, 'transcript_bam_star'], [5, 'star_results_multiqc'], [6, 'star_stat'], [7, 'bam_star_sorted_multiqc'], [8, 'picard_rg_multiqc'], [9, 'picard_duplicate'], [10, 'bai_picard_multiqc'], [11, 'picard_complexity'], [12, 'picard_rnaseqmetrics'], [13, 'picard_multimetrics_pdf'], [14, 'picard_multimetrics_metrics'], [15, 'infer_experiment'], [16, 'junction_annotation'], [17, 'junction_saturation'], [18, 'mismatch_profile'], [19, 'read_distribution'], [20, 'transcript_integrity_number'], [21, 'rnaseqc']]
Outputs : [[0, 'multiqc_data'], [1, 'multiqc_report']]
Emits : []


