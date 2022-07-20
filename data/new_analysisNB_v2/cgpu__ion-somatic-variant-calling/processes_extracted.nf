Name : gunzip_dbsnp
Inputs : [[0, 'dbsnp_gz'], [1, 'dbsnp_idx_gz']]
Outputs : [[0, 'dbsnp'], [0, 'dbsnp_variantrecalibrator_snps'], [0, 'dbsnp_variantrecalibrator_indels'], [1, 'dbsnp_idx'], [1, 'dbsnp_idx_variantrecalibrator_snps'], [1, 'dbsnp_idx_variantrecalibrator_indels']]
Emits : []


Name : gunzip_golden_indel
Inputs : [[0, 'golden_indel_gz'], [1, 'golden_indel_idx_gz']]
Outputs : [[0, 'golden_indel'], [0, 'golden_indel_variantrecalibrator_indels'], [1, 'golden_indel_idx'], [1, 'golden_indel_idx_variantrecalibrator_indels']]
Emits : []


Name : BAM_sort
Inputs : [[0, 'bams']]
Outputs : [[0, 'bam_sort'], [0, 'bam_sort_qc'], [0, 'bam_sort_baserecalibrator'], [0, 'bam_sort_applybqsr']]
Emits : []


Name : RunBamQCmapped
Inputs : [[0, 'bam_sort_qc']]
Outputs : [[0, 'bamQCmappedReport']]
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
Inputs : [[0, 'bam_haplotypecaller'], [1, 'fasta_haplotypecaller'], [2, 'fai_haplotypecaller'], [3, 'dict_haplotypecaller'], [4, 'intervals_haplotypecaller']]
Outputs : [[0, 'haplotypecaller_gvcf'], [1, 'index'], [2, 'name_mergevcfs']]
Emits : []


Name : run_mutect2_tumor_only_mode
Inputs : [[0, 'bamsNormal_PoN_bam'], [1, 'bamsNormal_PoN_bai'], [2, 'ref_mutect2_tum_only_mode_channel'], [3, 'ref_index_mutect2_tum_only_mode_channel'], [4, 'ref_dict_mutect2_tum_only_mode_channel'], [5, 'interval_list_mutect2_tum_only_mode_channel']]
Outputs : [[0, 'vcf_for_create_GenomicsDB_channel'], [1, 'vcf_tbi_for_create_GenomicsDB_channel']]
Emits : []


Name : create_GenomicsDB
Inputs : [[0, 'vcf_for_create_GenomicsDB_channel'], [1, 'vcf_tbi_for_create_GenomicsDB_channel'], [2, 'ref_for_create_GenomicsDB_channel'], [3, 'ref_index_for_create_GenomicsDB_channel'], [4, 'ref_dict_for_create_GenomicsDB_channel'], [5, 'interval_list_create_GenomicsDB_channel']]
Outputs : [[0, 'pon_db_for_create_somatic_PoN']]
Emits : []


Name : create_somatic_PoN
Inputs : [[0, 'pon_db_for_create_somatic_PoN'], [1, 'ref_create_somatic_PoN'], [2, 'ref_index_create_somatic_PoN'], [3, 'ref_dict_create_somatic_PoN'], [4, 'af_only_gnomad_vcf_channel_PoN'], [5, 'af_only_gnomad_vcf_idx_channel_PoN']]
Outputs : [[0, 'pon_vcf_gz_for_PoN_results_channel'], [1, 'pon_vcf_gz_tbi_for_PoN_results_channel']]
Emits : []


Name : Mutect2
Inputs : [[0, 'combined_bam_mutect'], [1, 'fasta_mutect'], [2, 'fai_mutect'], [3, 'dict_mutect'], [4, 'intervals_mutect'], [5, 'af_only_gnomad_vcf_channel'], [6, 'af_only_gnomad_vcf_idx_channel'], [7, 'pon_vcf_gz_for_PoN_results_channel'], [8, 'pon_vcf_gz_tbi_for_PoN_results_channel']]
Outputs : [[0, 'vcf_for_filter_mutect_calls'], [1, 'idx_vcf_for_filter_mutect_calls'], [2, 'stats_vcf_for_filter_mutect_calls']]
Emits : []


Name : FilterMutectCalls
Inputs : [[0, 'vcf_for_filter_mutect_calls'], [1, 'idx_vcf_for_filter_mutect_calls'], [2, 'stats_vcf_for_filter_mutect_calls'], [3, 'fasta_filter_mutect_calls'], [4, 'fai_filter_mutect_calls'], [5, 'dict_filter_mutect_calls']]
Outputs : [[0, 'vcf_filtered_for_vcf2maf'], [1, 'idx_vcf_filtered_for_vcf2maf'], [2, 'filterStats_vcf_filtered_for_vcf2maf']]
Emits : []


Name : Vcf2maf
Inputs : [[0, 'vcf_filtered_for_vcf2maf'], [1, 'idx_vcf_filtered_for_vcf2maf'], [2, 'fasta_vcf2maf'], [3, 'fai_vcf2maf'], [4, 'dict_vcf2maf']]
Outputs : [[0, 'vcf2maf_annotated_files_channel']]
Emits : []


Name : multiqc
Inputs : [[0, 'bamQCmappedReport'], [1, 'bamQCrecalibratedReport'], [2, 'baseRecalibratorReport']]
Outputs : [[0, 'multiqc_report']]
Emits : []


