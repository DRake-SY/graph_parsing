Name : get_reference
Inputs : []
Outputs : [[0, 'reference'], [1, 'reference_dict'], [2, 'reference_fai']]
Emits : []


Name : get_dbSNP
Inputs : []
Outputs : [[0, 'dbsnp'], [1, 'dbsnp_idx']]
Emits : []


Name : get_golden_indel
Inputs : []
Outputs : [[0, 'golden_indel'], [1, 'golden_indel_idx']]
Emits : []


Name : get_hapmap
Inputs : []
Outputs : [[0, 'hapmap'], [1, 'hapmap_idx']]
Emits : []


Name : get_omni
Inputs : []
Outputs : [[0, 'omni'], [1, 'omni_idx']]
Emits : []


Name : get_phase1_SNPs
Inputs : []
Outputs : [[0, 'phase1_snps'], [1, 'phase1_snps_idx']]
Emits : []


Name : get_BWA_index
Inputs : []
Outputs : [[0, 'bwa_index']]
Emits : []


Name : trim
Inputs : [[0, 'fastq1'], [1, 'fastq2']]
Outputs : [[0, 'trim1'], [1, 'trim2']]
Emits : []


Name : BWA
Inputs : [[0, 'reference'], [1, 'bwa_index'], [2, 'trim1'], [3, 'trim2']]
Outputs : [[0, 'samfile']]
Emits : []


Name : BWA_sort
Inputs : [[0, 'samfile']]
Outputs : [[0, 'bam_sort']]
Emits : []


Name : MarkDuplicates
Inputs : [[0, 'bam_sort']]
Outputs : [[0, 'bam_markdup']]
Emits : []


Name : BaseRecalibrator
Inputs : [[0, 'reference'], [1, 'reference_fai'], [2, 'reference_dict'], [3, 'bam_markdup'], [4, 'dbsnp'], [5, 'dbsnp_idx'], [6, 'golden_indel'], [7, 'golden_indel_idx']]
Outputs : [[0, 'BaseRecalibrator_table']]
Emits : []


Name : ApplyBQSR
Inputs : [[0, 'BaseRecalibrator_table'], [1, 'bam_markdup']]
Outputs : [[0, 'bam_bqsr']]
Emits : []


Name : HaplotypeCaller
Inputs : [[0, 'reference'], [1, 'reference_fai'], [2, 'reference_dict'], [3, 'bam_bqsr']]
Outputs : [[0, 'haplotypecaller_gvcf']]
Emits : []


Name : GenotypeGVCFs
Inputs : [[0, 'reference'], [1, 'reference_fai'], [2, 'reference_dict'], [3, 'haplotypecaller_gvcf']]
Outputs : [[0, 'haplotypecaller_vcf']]
Emits : []


Name : VariantRecalibrator_SNPs
Inputs : [[0, 'reference'], [1, 'reference_fai'], [2, 'reference_dict'], [3, 'haplotypecaller_vcf'], [4, 'hapmap'], [5, 'hapmap_idx'], [6, 'omni'], [7, 'omni_idx'], [8, 'phase1_snps'], [9, 'phase1_snps_idx'], [10, 'dbsnp'], [11, 'dbsnp_idx']]
Outputs : [[0, 'variantrecalibrator_recal'], [1, 'variantrecalibrator_recal_idx'], [2, 'variantrecalibrator_tranches']]
Emits : []


Name : ApplyVQSR_SNPs
Inputs : [[0, 'haplotypecaller_vcf'], [1, 'variantrecalibrator_recal'], [2, 'variantrecalibrator_recal_idx'], [3, 'variantrecalibrator_tranches']]
Outputs : [[0, 'recalibrated_snps_raw_indels']]
Emits : []


Name : VariantRecalibrator_INDELs
Inputs : [[0, 'reference'], [1, 'reference_fai'], [2, 'reference_dict'], [3, 'recalibrated_snps_raw_indels'], [4, 'dbsnp'], [5, 'dbsnp_idx'], [6, 'golden_indel'], [7, 'golden_indel_idx']]
Outputs : [[0, 'variantrecalibrator_indel_recal'], [1, 'variantrecalibrator_indel_recal_idx'], [2, 'variantrecalibrator_indel_tranches']]
Emits : []


Name : ApplyVQSR_INDELs
Inputs : [[0, 'recalibrated_snps_raw_indels'], [1, 'variantrecalibrator_indel_recal'], [2, 'variantrecalibrator_indel_recal_idx'], [3, 'variantrecalibrator_indel_tranches']]
Outputs : [[0, 'recalibrated_variants_vcf']]
Emits : []


Name : copy
Inputs : [[0, 'recalibrated_variants_vcf']]
Outputs : []
Emits : []


