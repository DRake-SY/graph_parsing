OPERATION_1 string : ch_add_exclusions = Channel.value('TRUE')
OPERATION_1 origin : [["'TRUE'", 'V']]
OPERATION_1 gives  : [['ch_add_exclusions', 'P']]


OPERATION_2 string : ch_add_exclusions = Channel.value('FALSE')
OPERATION_2 origin : [["'FALSE'", 'V']]
OPERATION_2 gives  : [['ch_add_exclusions', 'P']]


OPERATION_3 string : ch_firth_regression = Channel.value('TRUE')
OPERATION_3 origin : [["'TRUE'", 'V']]
OPERATION_3 gives  : [['ch_firth_regression', 'P']]


OPERATION_4 string : ch_firth_regression = Channel.value('FALSE')
OPERATION_4 origin : [["'FALSE'", 'V']]
OPERATION_4 gives  : [['ch_firth_regression', 'P']]


OPERATION_5 string : ch_samples_to_combine_vcfs = Channel.fromPath(params.input_samplefile)
OPERATION_5 origin : [['params.input_samplefile', 'A']]
OPERATION_5 gives  : [['ch_samples_to_combine_vcfs', 'P']]


OPERATION_6 string : ch_samples_to_combine_vcfs = Channel.fromPath(params.input_phenofile)
OPERATION_6 origin : [['params.input_phenofile', 'A']]
OPERATION_6 gives  : [['ch_samples_to_combine_vcfs', 'P']]


OPERATION_7 string : ch_samples_to_combine_vcfs = Channel.fromPath(params.input_phenofile)
OPERATION_7 origin : [['params.input_phenofile', 'A']]
OPERATION_7 gives  : [['ch_samples_to_combine_vcfs', 'P']]


OPERATION_8 string : ch_samples_to_combine_vcfs = Channel.fromPath(params.input_samplefile)
OPERATION_8 origin : [['params.input_samplefile', 'A']]
OPERATION_8 gives  : [['ch_samples_to_combine_vcfs', 'P']]


OPERATION_9 string : ch_pheno_for_assoc_test = Channel.fromPath(params.input_phenofile)
OPERATION_9 origin : [['params.input_phenofile', 'A']]
OPERATION_9 gives  : [['ch_pheno_for_assoc_test', 'P']]


OPERATION_10 string : ch_codes_pheno = Channel.value(file(params.input_id_code_count))
OPERATION_10 origin : []
OPERATION_10 gives  : [['ch_codes_pheno', 'P']]


OPERATION_11 string : ch_codes_pheno = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['ch_codes_pheno', 'P']]


OPERATION_12 string : ch_gwas_input = Channel.value(file(params.gwas_input))
OPERATION_12 origin : []
OPERATION_12 gives  : [['ch_gwas_input', 'P']]


OPERATION_13 string : ch_gwas_input = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['ch_gwas_input', 'P']]


OPERATION_14 string : Channel.fromPath(params.agg_vcf_file_list)
           .ifEmpty { exit 1, "VCF file containing  not found: ${params.agg_vcf_file_list}" }
           .into {ch_vcf_file; ch_vcfs_to_split; ch_index_to_split}
OPERATION_14 origin : [['params.agg_vcf_file_list', 'A']]
OPERATION_14 gives  : [['ch_vcf_file', 'P'], ['ch_vcfs_to_split', 'P'], ['ch_index_to_split', 'P']]


OPERATION_15 string : Channel
    .fromFilePairs("${params.plink_input}",size:3, flat : true)
    .ifEmpty { exit 1, "PLINK files not found: ${params.plink_input}" }
    .set { plinkCh }
OPERATION_15 origin : [['"${params.plink_input}",size:3, flat : true', 'A']]
OPERATION_15 gives  : [['plinkCh', 'P']]


OPERATION_16 string : Channel.fromPath(params.individual_vcf_file_list)
           .ifEmpty { exit 1, "VCF file containing  not found: ${params.individual_vcf_file_list}" }
           .into { ch_vcf_file; ch_vcfs_to_split }
OPERATION_16 origin : [['params.individual_vcf_file_list', 'A']]
OPERATION_16 gives  : [['ch_vcf_file', 'P'], ['ch_vcfs_to_split', 'P']]


OPERATION_17 string : Channel.fromPath(params.fam)
    .ifEmpty { exit 1, "FAM file (w/ header) containing phenotype info not found: ${params.fam}" }
    .set { ch_fam }
OPERATION_17 origin : [['params.fam', 'A']]
OPERATION_17 gives  : [['ch_fam', 'P']]


OPERATION_18 string : Channel.fromPath(params.bed)
        .ifEmpty { exit 1, "PLINK binary pedigree file not found: ${params.bed}" }
        .set { ch_bed }
OPERATION_18 origin : [['params.bed', 'A']]
OPERATION_18 gives  : [['ch_bed', 'P']]


OPERATION_19 string : Channel.fromPath(params.bim)
        .ifEmpty { exit 1, "PLINK BIM file not found: ${params.bim}" }
        .set { ch_bim }
OPERATION_19 origin : [['params.bim', 'A']]
OPERATION_19 gives  : [['ch_bim', 'P']]


OPERATION_20 string : Channel.fromPath(params.snps)
    .ifEmpty { exit 1, "SNPs of interest file not found: ${params.snps}" }
    .set { ch_snps }
OPERATION_20 origin : [['params.snps', 'A']]
OPERATION_20 gives  : [['ch_snps', 'P']]


OPERATION_21 string : Channel.fromPath(params.covariate_file)
    .ifEmpty { exit 1, "File with covariates not found: ${params.covariate_file}" }
    .set { ch_covariate_file }
OPERATION_21 origin : [['params.covariate_file', 'A']]
OPERATION_21 gives  : [['ch_covariate_file', 'P']]


OPERATION_22 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_22 origin : [['summary', 'P']]
OPERATION_22 gives  : []


OPERATION_23 string : ch_vcfs_to_split
        .splitCsv(header: true)
        .map{ row -> [file(row.vcf)] }
        .set { ch_vcfs }
OPERATION_23 origin : [['ch_vcfs_to_split', 'P']]
OPERATION_23 gives  : [['ch_vcfs', 'P']]


OPERATION_24 string : ch_index_to_split
        .splitCsv(header: true)
        .map{ row -> [file(row.index)] }
        .set { ch_indexes }
OPERATION_24 origin : [['ch_index_to_split', 'P']]
OPERATION_24 gives  : [['ch_indexes', 'P']]


OPERATION_25 string : ch_vcfs_to_split
        .splitCsv(header: true)
        .map{ row -> [file(row.vcf)] }
        .into { ch_vcfs; ch_vcf_ind }
OPERATION_25 origin : [['ch_vcfs_to_split', 'P']]
OPERATION_25 gives  : [['ch_vcfs', 'P'], ['ch_vcf_ind', 'P']]


