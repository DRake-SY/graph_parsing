Name : checkfiles_fastq
Inputs : [[0, 'fastq_ch']]
Outputs : [[0, 'checkfiles_fastq_complete_ch'], [1, 'move_fastqc_ch']]
Emits : []


Name : move_fastq
Inputs : [[0, 'checkfiles_fastq_complete_ch'], [1, 'move_fastqc_ch']]
Outputs : [[0, 'move_fastq_complete_ch'], [1, 'fastqc_ch']]
Emits : []


Name : fastqc
Inputs : [[0, 'move_fastq_complete_ch'], [1, 'fastqc_ch']]
Outputs : [[0, 'fastqc_complete_ch'], [1, 'star_ch'], [2, 'salmon_ch'], [3, 'rsem_ch'], [4, 'fastqscreen_ch']]
Emits : []


Name : fastqscreen
Inputs : [[0, 'fastqc_complete_ch'], [1, 'fastqscreen_ch']]
Outputs : [[0, 'fastqscreen_complete_ch']]
Emits : []


Name : star
Inputs : [[0, 'fastqscreen_complete_ch'], [1, 'star_ch']]
Outputs : [[0, 'star_complete_ch_1']]
Emits : []


Name : checkfiles_bam
Inputs : [[0, 'star_complete_ch_1'], [1, 'bam_checkbam_ch']]
Outputs : [[0, 'checkfiles_bam_complete_ch'], [1, 'bam_indexbam_ch']]
Emits : []


Name : index_bam
Inputs : [[0, 'checkfiles_bam_complete_ch'], [1, 'bam_indexbam_ch']]
Outputs : [[0, 'indexbam_complete_ch'], [1, 'bam_markdups_ch']]
Emits : []


Name : markdups
Inputs : [[0, 'indexbam_complete_ch'], [1, 'bam_markdups_ch']]
Outputs : [[0, 'markdups_complete_ch_1'], [1, 'bam_filter_multimap_ch']]
Emits : []


Name : salmon
Inputs : [[0, 'markdups_complete_ch_1'], [1, 'salmon_ch']]
Outputs : [[0, 'salmon_complete_ch']]
Emits : []


Name : rsem
Inputs : [[0, 'salmon_complete_ch'], [1, 'rsem_ch']]
Outputs : [[0, 'rsem_complete_ch_1']]
Emits : []


Name : bladderreport
Inputs : [[0, 'rsem_complete_ch_1'], [1, 'bam_bladderreport_ch']]
Outputs : [[0, 'bladderreport_complete_ch']]
Emits : []


Name : filter_multimap
Inputs : [[0, 'bladderreport_complete_ch'], [1, 'bam_filter_multimap_ch']]
Outputs : [[0, 'filter_multimap_complete_ch']]
Emits : []


Name : featurecounts
Inputs : [[0, 'filter_multimap_complete_ch'], [1, 'bam_featurecounts_ch']]
Outputs : [[0, 'featurecounts_complete_ch']]
Emits : []


Name : rnaseqmetrics
Inputs : [[0, 'featurecounts_complete_ch'], [1, 'bam_rnaseqmetrics_ch']]
Outputs : [[0, 'rnaseqmetrics_complete_ch']]
Emits : []


Name : qualimap
Inputs : [[0, 'rnaseqmetrics_complete_ch'], [1, 'bam_qualimap_ch']]
Outputs : [[0, 'qualimap_complete_ch']]
Emits : []


Name : rseqc
Inputs : [[0, 'qualimap_complete_ch'], [1, 'bam_rseqc_ch']]
Outputs : [[0, 'rseqc_complete_ch']]
Emits : []


Name : multiqc
Inputs : [[0, 'rseqc_complete_ch']]
Outputs : [[0, 'multiqc_complete_ch']]
Emits : []


Name : md5sum
Inputs : [[0, 'multiqc_complete_ch']]
Outputs : [[0, 'md5sum_complete_ch']]
Emits : []


Name : stage_delivery
Inputs : [[0, 'md5sum_complete_ch']]
Outputs : [[0, 'stage_delivery_complete_ch']]
Emits : []


Name : finalize_pipeline
Inputs : [[0, 'stage_delivery_complete_ch']]
Outputs : [[0, 'finalize_pipeline_complete_ch']]
Emits : []


