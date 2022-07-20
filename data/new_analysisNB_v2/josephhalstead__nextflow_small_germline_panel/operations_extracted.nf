OPERATION_1 string : Channel
  .fromFilePairs(params.samples, flat: true) 
  .set { reads }
OPERATION_1 origin : [['params.samples, flat: true', 'A']]
OPERATION_1 gives  : [['reads', 'P']]


OPERATION_2 string : chromosomes_ch = Channel
    .from( params.chromosomes)
OPERATION_2 origin : [['params.chromosomes', 'V']]
OPERATION_2 gives  : [['chromosomes_ch', 'P']]


OPERATION_3 string : annotated_vcf.into {
  annotated_vcf_report
  annotated_vcf_sample_names
}
OPERATION_3 origin : [['annotated_vcf', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : sample_names_from_vcf.splitCsv(header:['col1']).map{ row-> tuple(row.col1)}.set { samples_ch }
OPERATION_4 origin : [['sample_names_from_vcf', 'P']]
OPERATION_4 gives  : [['samples_ch', 'P']]


