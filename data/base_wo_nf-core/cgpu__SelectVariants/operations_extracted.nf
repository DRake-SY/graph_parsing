OPERATION_1 string : Channel.fromPath(params.fasta)
           .ifEmpty { exit 1, "fasta annotation file not found: ${params.fasta}" }
           .into { fasta_select_variants_PASS; fasta_vcf2maf }
OPERATION_1 origin : [['params.fasta', 'A']]
OPERATION_1 gives  : [['fasta_select_variants_PASS', 'P'], ['fasta_vcf2maf', 'P']]


OPERATION_2 string : Channel.fromPath(params.fai)
           .ifEmpty { exit 1, "fasta index file not found: ${params.fai}" }
           .into { fai_select_variants_PASS ; fai_vcf2maf  }
OPERATION_2 origin : [['params.fai', 'A']]
OPERATION_2 gives  : [['fai_select_variants_PASS', 'P'], ['fai_vcf2maf', 'P']]


OPERATION_3 string : Channel.fromPath(params.dict)
           .ifEmpty { exit 1, "dict annotation file not found: ${params.dict}" }
           .into { dict_select_variants_PASS ; dict_vcf2maf }
OPERATION_3 origin : [['params.dict', 'A']]
OPERATION_3 gives  : [['dict_select_variants_PASS', 'P'], ['dict_vcf2maf', 'P']]


OPERATION_4 string : Channel
    .fromPath("${params.inputdir}/*.vcf")
    .set {  vcf_filtered_for_select_variants}
OPERATION_4 origin : [['"${params.inputdir}/*.vcf"', 'A']]
OPERATION_4 gives  : [['vcf_filtered_for_select_variants', 'P']]


OPERATION_5 string : Channel
    .fromPath("${params.inputdir}/*.idx")
    .set {  idx_vcf_filtered_for_select_variants}
OPERATION_5 origin : [['"${params.inputdir}/*.idx"', 'A']]
OPERATION_5 gives  : [['idx_vcf_filtered_for_select_variants', 'P']]


