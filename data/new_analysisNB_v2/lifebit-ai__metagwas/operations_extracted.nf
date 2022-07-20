OPERATION_1 string : Channel
    .fromPath(params.studies, checkIfExists: true)
    .ifEmpty { exit 1, "List of studies to analyze not found: ${params.studies}" }
    .splitCsv(header:true)
    .map{ row -> file(row.study) }
    .flatten()
    .set { all_input_studies_ch }
OPERATION_1 origin : [['params.studies, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['all_input_studies_ch', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.ancestry_sample_file, checkIfExists: true)
    .ifEmpty { exit 1, "Sample file with ancestries not found: ${params.ancestry_sample_file}" }
    .set { ch_ancestry_sample_file }
OPERATION_2 origin : [['params.ancestry_sample_file, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_ancestry_sample_file', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.snp_ancestry_file, checkIfExists: true)
    .ifEmpty { exit 1, "SNP file with ancestries not found: ${params.snp_ancestry_file}" }
    .set { ch_snp_ancestry_file }
OPERATION_3 origin : [['params.snp_ancestry_file, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['ch_snp_ancestry_file', 'P']]


OPERATION_4 string : Channel
    .fromFilePairs(params.merged_ref_panel, size:3, flat : true)
    .ifEmpty { exit 1, "Ref panel plink files not found: ${params.merged_ref_panel}" }
    .set { ch_merged_ref_panel }
OPERATION_4 origin : [['params.merged_ref_panel, size:3, flat : true', 'A']]
OPERATION_4 gives  : [['ch_merged_ref_panel', 'P']]


OPERATION_5 string : Channel
    .fromPath(params.ss_1)
    .ifEmpty { exit 1, "Ref panel plink files not found: ${params.merged_ref_panel}" }
    .set { ch_ss_1 }
OPERATION_5 origin : [['params.ss_1', 'A']]
OPERATION_5 gives  : [['ch_ss_1', 'P']]


OPERATION_6 string : Channel
    .fromPath(params.ss_2)
    .ifEmpty { exit 1, "Ref panel plink files not found: ${params.merged_ref_panel}" }
    .set { ch_ss_2 }
OPERATION_6 origin : [['params.ss_2', 'A']]
OPERATION_6 gives  : [['ch_ss_2', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


