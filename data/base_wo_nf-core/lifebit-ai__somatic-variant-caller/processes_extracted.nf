Name : BedToIntervalList
Inputs : [[0, 'bed_interval'], [1, 'dict_interval']]
Outputs : [[0, 'interval_list']]
Emits : []


Name : gunzip_dbsnp
Inputs : [[0, 'dbsnp_gz'], [1, 'dbsnp_idx_gz']]
Outputs : [[0, 'dbsnp'], [0, 'dbsnp_variantrecalibrator_snps'], [0, 'dbsnp_variantrecalibrator_indels'], [1, 'dbsnp_idx'], [1, 'dbsnp_idx_variantrecalibrator_snps'], [1, 'dbsnp_idx_variantrecalibrator_indels']]
Emits : []


Name : gunzip_golden_indel
Inputs : [[0, 'golden_indel_gz'], [1, 'golden_indel_idx_gz']]
Outputs : [[0, 'golden_indel'], [0, 'golden_indel_variantrecalibrator_indels'], [1, 'golden_indel_idx'], [1, 'golden_indel_idx_variantrecalibrator_indels']]
Emits : []


Name : fastqc
Inputs : [[0, 'reads']]
Outputs : [[0, 'fastqc_results']]
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


Name : MarkDuplicates
Inputs : [[0, 'bam_sort']]
Outputs : [[0, 'bam_markdup_baserecalibrator'], [0, 'bam_markdup_applybqsr'], [1, 'markDuplicatesReport']]
Emits : []


Name : BaseRecalibrator
Inputs : [[0, 'baserecalibrator']]
Outputs : [[0, 'baserecalibrator_table'], [1, 'baseRecalibratorReport']]
Emits : []


Name : ApplyBQSR
Inputs : [[0, 'applybqsr']]
Outputs : [[0, 'bam_for_qc'], [0, 'bam_haplotypecaller'], [0, 'bam_mutect']]
Emits : []


Name : RunBamQCrecalibrated
Inputs : [[0, 'bam_for_qc']]
Outputs : [[0, 'bamQCrecalibratedReport']]
Emits : []


Name : HaplotypeCaller
Inputs : [[0, 'haplotypecaller']]
Outputs : [[0, 'haplotypecaller_gvcf'], [1, 'index'], [2, 'name_mergevcfs']]
Emits : []


Name : MergeVCFs
Inputs : [[0, 'haplotypecaller_gvcf'], [1, 'index'], [2, 'name_mergevcfs']]
Outputs : [[0, 'mergevcfs']]
Emits : []


Name : Mutect2
Inputs : [[0, 'mutect']]
Outputs : [[0, 'vcf_variant_eval']]
Emits : []


Name : Manta
Inputs : [[0, 'manta']]
Outputs : [[0, 'manta_results']]
Emits : []


Name : kraken2
Inputs : [[0, 'reads_kraken']]
Outputs : [[0, 'kraken_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'fastqc_results'], [1, 'markDuplicatesReport'], [2, 'bamQCmappedReport'], [3, 'bamQCrecalibratedReport'], [4, 'baseRecalibratorReport']]
Outputs : [[0, 'multiqc_report']]
Emits : []


