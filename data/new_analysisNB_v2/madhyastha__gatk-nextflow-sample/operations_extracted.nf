OPERATION_1 string : ref_dbsnp = Channel
  .fromPath("${params.dbsnp}*")
  .toList()
OPERATION_1 origin : [['"${params.dbsnp}*"', 'A']]
OPERATION_1 gives  : [['ref_dbsnp', 'P']]


OPERATION_2 string : ref_golden_indel = Channel
  .fromPath("${params.golden_indel}*")
  .toList()
OPERATION_2 origin : [['"${params.golden_indel}*"', 'A']]
OPERATION_2 gives  : [['ref_golden_indel', 'P']]


OPERATION_3 string : ref_indices = Channel
  .fromPath("${params.reference}*")
  .toList()
OPERATION_3 origin : [['"${params.reference}*"', 'A']]
OPERATION_3 gives  : [['ref_indices', 'P']]


OPERATION_4 string : ref_dict = Channel
  .fromPath("${params.dict}")
  .toList()
OPERATION_4 origin : [['"${params.dict}"', 'A']]
OPERATION_4 gives  : [['ref_dict', 'P']]


OPERATION_5 string : reads = Channel
  .fromPath("${params.input}/${sample_id}_*{1,2}*{fastq.gz}")
  .toList()
OPERATION_5 origin : [['"${params.input}/${sample_id}_*{1,2}*{fastq.gz}"', 'A']]
OPERATION_5 gives  : [['reads', 'P']]


OPERATION_6 string : chromosomes = Channel.fromList( params.chromosomes.tokenize(',') )
OPERATION_6 origin : []
OPERATION_6 gives  : [['chromosomes', 'P']]


OPERATION_7 string : chromosomes.into { chromosomes_mpileup; chromosomes_call }
OPERATION_7 origin : [['chromosomes', 'P']]
OPERATION_7 gives  : [['chromosomes_mpileup', 'P'], ['chromosomes_call', 'P']]


