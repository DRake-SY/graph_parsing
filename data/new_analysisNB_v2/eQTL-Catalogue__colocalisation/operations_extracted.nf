OPERATION_1 string : Channel.fromPath(params.gwas_ss_tsv)
    .ifEmpty { error "Cannot find gwas_vcf: ${params.gwas_vcf}" }
    .splitCsv(header: true, sep: '\t', strip: true)
    .map{row -> [ row.gwas_id, file(row.gwas_vcf)]}
    .set { gwas_vcf_ch }
OPERATION_1 origin : [['params.gwas_ss_tsv', 'A']]
OPERATION_1 gives  : [['gwas_vcf_ch', 'P']]


OPERATION_2 string : Channel.fromPath(params.gwas_lift_chain)
    .ifEmpty { error "Cannot find gwas_vcf: ${params.gwas_lift_chain}" }
    .set { gwas_lift_chain_ch }
OPERATION_2 origin : [['params.gwas_lift_chain', 'A']]
OPERATION_2 gives  : [['gwas_lift_chain_ch', 'P']]


OPERATION_3 string : Channel.fromPath(params.hg38_ref_genome)
    .ifEmpty { error "Cannot find gwas_vcf: ${params.hg38_ref_genome}" }
    .set { hg38_ref_genome_ch }
OPERATION_3 origin : [['params.hg38_ref_genome', 'A']]
OPERATION_3 gives  : [['hg38_ref_genome_ch', 'P']]


OPERATION_4 string : Channel.fromPath(params.qtl_ss_tsv)
    .ifEmpty { error "Cannot find gene_variant_list: ${params.eqtl_summ_stats_path}" }
    .splitCsv(header: true, sep: '\t', strip: true)
    .map{row -> [ row.qtl_subset, file(row.qtl_ss), file(row.qtl_ss_index), file(row.qtl_credible_set_or_perm)]}
    .set{ eqtl_summ_stats_raw_ch }
OPERATION_4 origin : [['params.qtl_ss_tsv', 'A']]
OPERATION_4 gives  : [['eqtl_summ_stats_raw_ch', 'P']]


OPERATION_5 string : eqtl_summ_stats_raw_ch.set { extract_lead_var_pairs_ch }
OPERATION_5 origin : [['eqtl_summ_stats_raw_ch', 'P']]
OPERATION_5 gives  : [['extract_lead_var_pairs_ch', 'P']]


OPERATION_6 string : eqtl_summ_stats_raw_ch.set { eqtl_summ_stats_ch }
OPERATION_6 origin : [['eqtl_summ_stats_raw_ch', 'P']]
OPERATION_6 gives  : [['eqtl_summ_stats_ch', 'P']]


