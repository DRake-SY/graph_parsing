OPERATION_1 string : Channel
    .fromPath(params.table_vcf_location)
    .ifEmpty { exit 1, "Cannot find input file : ${params.table_vcf_location}" }
    .splitCsv(skip:1)
    .map {file_name, vcf, vcf_idx -> [ file_name, file(vcf), file(vcf_idx) ] }
    .take( params.number_of_files_to_process )
    .set { ch_input_list }
OPERATION_1 origin : [['params.table_vcf_location', 'A']]
OPERATION_1 gives  : [['ch_input_list', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.region_file_location)
    .ifEmpty { exit 1, "Cannot find input file : ${params.region_file_location}" }
    .set { ch_region_file }
OPERATION_2 origin : [['params.region_file_location', 'A']]
OPERATION_2 gives  : [['ch_region_file', 'P']]


OPERATION_3 string : ch_reformatted = ch_input_list
OPERATION_3 origin : [['ch_input_list', 'P']]
OPERATION_3 gives  : [['ch_reformatted', 'P']]


