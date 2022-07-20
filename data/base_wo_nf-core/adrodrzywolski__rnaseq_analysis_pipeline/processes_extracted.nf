Name : reference_index
Inputs : [[0, 'genome']]
Outputs : [[0, 'hisat2_index']]
Emits : []


Name : raw_fastqc
Inputs : [[0, 'reads_raw_fastqc']]
Outputs : [[0, 'result_raw_fastqc']]
Emits : []


Name : trim_raw_reads
Inputs : [[0, 'reads_trim_raw_reads']]
Outputs : [[0, 'result_trim_raw_reads'], [0, 'result_trim_raw_reads_align']]
Emits : []


Name : trimmed_fastqc
Inputs : [[0, 'result_trim_raw_reads']]
Outputs : [[0, 'result_trimmed_fastqc']]
Emits : []


Name : hisat2
Inputs : [[0, 'hisat2_index'], [1, 'result_trim_raw_reads_align']]
Outputs : [[0, 'fresh_bams'], [1, 'hisat2_summary']]
Emits : []


Name : fixmate_bam
Inputs : [[0, 'fresh_bams']]
Outputs : [[0, 'fixed_bam']]
Emits : []


Name : sort_bam
Inputs : [[0, 'fixed_bam']]
Outputs : [[0, 'fixed_sorted_bam'], [0, 'fixed_sorted_bam_fc'], [0, 'fixed_sorted_bam_bamqual'], [0, 'fixed_sorted_bam_raport']]
Emits : []


Name : index_bam
Inputs : [[0, 'fixed_sorted_bam']]
Outputs : [[0, 'indexof_fixed_sorted_bam']]
Emits : []


Name : feature_count
Inputs : [[0, 'annotation_hisat2'], [1, 'fixed_sorted_bam_fc'], [2, 'indexof_fixed_sorted_bam']]
Outputs : [[0, 'feature_count_result_summary'], [1, 'feature_count_result']]
Emits : []


Name : bam_qual
Inputs : [[0, 'annotation_bq'], [1, 'fixed_sorted_bam_bamqual']]
Outputs : [[0, 'bam_qual_result']]
Emits : []


Name : make_report
Inputs : [[0, 'fixed_sorted_bam_raport'], [1, 'bam_qual_result'], [2, 'hisat2_summary'], [3, 'result_raw_fastqc'], [4, 'result_trimmed_fastqc'], [5, 'feature_count_result_summary'], [6, 'feature_count_result']]
Outputs : [[0, 'multiqc_report']]
Emits : []


