Name : RawFASTQC
Inputs : [[0, 'read1_ch']]
Outputs : [[0, 'fastqc_results_ch']]
Emits : []


Name : BuildHISat2Index
Inputs : [[0, 'params']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : Trimming
Inputs : [[0, 'raw_reads_trimgalore']]
Outputs : [[0, 'trimgalore_reads'], [1, 'trimgalore_reads_for_alignment'], [2, 'trimgalore_results']]
Emits : []


Name : Trimmed_Reads_FASTQC
Inputs : [[0, 'trimgalore_reads']]
Outputs : [[0, 'fastqc_trimmed_results_ch']]
Emits : []


Name : Hisat2_align
Inputs : [[0, 'params'], [1, 'index_ch'], [2, 'raw_reads_for_hisat2']]
Outputs : [[0, 'hisat2_sam'], [1, 'hisat2_mapstats']]
Emits : []


Name : SAM2BAM
Inputs : [[0, 'hisat2_sam']]
Outputs : [[0, 'sorted_bam_for_feature_count'], [1, 'sorted_bam_indices_for_feature_count'], [2, 'bam_flagstat'], [3, 'sorted_bam_for_qualimap'], [4, 'sorted_bam_indices_for_qualimap']]
Emits : []


Name : Feature_count
Inputs : [[0, 'params'], [1, 'sorted_bam_for_feature_count'], [2, 'sorted_bam_indices_for_feature_count']]
Outputs : [[0, 'geneCounts'], [1, 'featureCounts_logs']]
Emits : []


Name : QC_Using_Qualimap
Inputs : [[0, 'params'], [1, 'sorted_bam_for_qualimap'], [2, 'sorted_bam_indices_for_qualimap']]
Outputs : [[0, 'qualimap_output'], [1, 'qualimap_output_txt']]
Emits : []


