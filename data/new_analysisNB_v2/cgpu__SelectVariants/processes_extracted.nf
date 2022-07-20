Name : SelectSNPsPASS
Inputs : [[0, 'vcf_filtered_for_select_variants'], [1, 'idx_vcf_filtered_for_select_variants'], [2, 'fasta_select_variants_PASS'], [3, 'fai_select_variants_PASS'], [4, 'dict_select_variants_PASS']]
Outputs : [[0, 'vcf_SNPs_PASS_for_vcf2maf'], [0, 'vcf_SNP_count_info_channel'], [1, 'idx_vcf_SNPs_PASS_for_vcf2maf']]
Emits : []


Name : Vcf2maf
Inputs : [[0, 'vcf_SNPs_PASS_for_vcf2maf'], [1, 'idx_vcf_SNPs_PASS_for_vcf2maf'], [2, 'fasta_vcf2maf'], [3, 'fai_vcf2maf'], [4, 'dict_vcf2maf']]
Outputs : [[0, 'vcf2maf_annotated_files_channel'], [1, 'maf_SNP_count_info_channel']]
Emits : []


Name : CountSNPs
Inputs : [[0, 'vcf_SNP_count_info_channel'], [1, 'maf_SNP_count_info_channel']]
Outputs : [[0, 'counts_of_snps_channel']]
Emits : []


