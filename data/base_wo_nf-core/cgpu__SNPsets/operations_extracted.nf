OPERATION_1 string : Channel.fromPath("${params.inputdir}/*.vcf")
        .ifEmpty { exit 1, "--inputdir  not found or is missing required .vcf files" }
        .collect()
        .set { vcf_for_create_union_vcf  }
OPERATION_1 origin : [['"${params.inputdir}/*.vcf"', 'A']]
OPERATION_1 gives  : [['vcf_for_create_union_vcf', 'P']]


OPERATION_2 string : Channel.fromPath("${params.inputdir}/*.idx")
        .ifEmpty { exit 1, "--inputdir not found or is missing required .idx files" }
        .collect()
        .set { idx_vcf_for_create_union_vcf  }
OPERATION_2 origin : [['"${params.inputdir}/*.idx"', 'A']]
OPERATION_2 gives  : [['idx_vcf_for_create_union_vcf', 'P']]


OPERATION_3 string : Channel.fromPath(params.fasta)
       .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
       .set { fasta_for_create_union_vcf }
OPERATION_3 origin : [['params.fasta', 'A']]
OPERATION_3 gives  : [['fasta_for_create_union_vcf', 'P']]


OPERATION_4 string : Channel.fromPath(params.fai)
       .ifEmpty { exit 1, "fasta index file not found: ${params.fai}" }
       .set {  fai_for_create_union_vcf  }
OPERATION_4 origin : [['params.fai', 'A']]
OPERATION_4 gives  : [['fai_for_create_union_vcf', 'P']]


OPERATION_5 string : Channel.fromPath(params.dict)
       .ifEmpty { exit 1, "dict annotation file not found: ${params.dict}" }
       .set { dict_for_create_union_vcf }
OPERATION_5 origin : [['params.dict', 'A']]
OPERATION_5 gives  : [['dict_for_create_union_vcf', 'P']]


OPERATION_6 string : Channel.from( 1..minimumN_value_integer )
       .into { minimumN_value_range_channel ; minimumN_value_range_channel_to_check}
OPERATION_6 origin : [['1..minimumN_value_integer', 'V']]
OPERATION_6 gives  : [['minimumN_value_range_channel', 'P'], ['minimumN_value_range_channel_to_check', 'P']]


OPERATION_7 string : vcf_and_idx_channel = vcf_for_create_union_vcf.combine(idx_vcf_for_create_union_vcf)
OPERATION_7 origin : [['vcf_for_create_union_vcf', 'P'], ['idx_vcf_for_create_union_vcf', 'P']]
OPERATION_7 gives  : [['vcf_and_idx_channel', 'P']]


OPERATION_8 string : minN_vcf_idx_combined_channel = minimumN_value_range_channel.combine(vcf_and_idx_channel)
OPERATION_8 origin : [['minimumN_value_range_channel', 'P'], ['vcf_and_idx_channel', 'P']]
OPERATION_8 gives  : [['minN_vcf_idx_combined_channel', 'P']]


OPERATION_9 string : minN_vcf_idx_combined_channel.into{minN_vcf_idx_combined_channel_to_use ; minN_vcf_idx_combined_channel_to_inspect}
OPERATION_9 origin : [['minN_vcf_idx_combined_channel', 'P']]
OPERATION_9 gives  : [['minN_vcf_idx_combined_channel_to_use', 'P'], ['minN_vcf_idx_combined_channel_to_inspect', 'P']]


OPERATION_10 string : minN_vcf_idx_combined_channel_to_inspect.map{ it ->  tuple(it[0], it[1..-1])  }.view()
OPERATION_10 origin : [['minN_vcf_idx_combined_channel_to_inspect', 'P']]
OPERATION_10 gives  : []


