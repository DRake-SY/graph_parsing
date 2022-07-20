Name : ScatterIntervals
Inputs : [[0, 'scattered_intervals_ref']]
Outputs : [[0, 'scattered_intervals']]
Emits : []


Name : SkipIntervals
Inputs : [[0, 'scattered_intervals']]
Outputs : [[0, 'skipped_intervals']]
Emits : []


Name : MakeIntervals
Inputs : [[0, 'intervals_input'], [1, 'skipped_intervals']]
Outputs : [[0, 'expanded_intervals']]
Emits : []


Name : fastqc
Inputs : [[0, 'reads_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : gunzip_dbsnp
Inputs : [[0, 'dbsnp_gz'], [1, 'dbsnp_idx_gz']]
Outputs : [[0, 'dbsnp'], [0, 'dbsnp_variantrecalibrator_snps'], [0, 'dbsnp_variantrecalibrator_indels'], [1, 'dbsnp_idx'], [1, 'dbsnp_idx_variantrecalibrator_snps'], [1, 'dbsnp_idx_variantrecalibrator_indels']]
Emits : []


Name : gunzip_golden_indel
Inputs : [[0, 'golden_indel_gz'], [1, 'golden_indel_idx_gz']]
Outputs : [[0, 'golden_indel'], [0, 'golden_indel_variantrecalibrator_indels'], [1, 'golden_indel_idx'], [1, 'golden_indel_idx_variantrecalibrator_indels']]
Emits : []


Name : BWA
Inputs : [[0, 'bwa']]
Outputs : [[0, 'sam']]
Emits : []


Name : BWA_sort
Inputs : [[0, 'sam']]
Outputs : [[0, 'bam_sort'], [0, 'bam_sort_qc']]
Emits : []


Name : RunBamQCmapped
Inputs : [[0, 'bam_sort_qc']]
Outputs : [[0, 'bamQCmappedReport']]
Emits : []


Name : MarkDuplicatesSpark
Inputs : [[0, 'bam_sort']]
Outputs : [[0, 'bam_markdup_baserecalibrator'], [0, 'bam_markdup_applybqsr'], [1, 'markdup_multiqc']]
Emits : []


Name : BaseRecalibratorSpark
Inputs : [[0, 'baserecalibrator']]
Outputs : [[0, 'baserecalibrator_table'], [1, 'baseRecalibratorReport']]
Emits : []


Name : ApplyBQSRSpark
Inputs : [[0, 'applybqsr']]
Outputs : [[0, 'bam_bqsr']]
Emits : []


Name : IndexBam
Inputs : [[0, 'bam_bqsr']]
Outputs : [[0, 'indexed_bam_bqsr'], [0, 'indexed_bam_qc'], [0, 'indexed_bam_structural_variantcaller']]
Emits : []


Name : RunBamQCrecalibrated
Inputs : [[0, 'indexed_bam_qc']]
Outputs : [[0, 'bamQCrecalibratedReport']]
Emits : []


