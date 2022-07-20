OPERATION_1 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_1 origin : [['summary', 'P']]
OPERATION_1 gives  : []


OPERATION_2 string : ch_samplesheet
  .splitCsv(header:true, sep:',')
  .map { validate_input(it) }
  .into { ch_subset
          ch_fastq }
OPERATION_2 origin : [['ch_samplesheet', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : ch_subset
    .into { ch_trimming }
OPERATION_3 origin : [['ch_subset', 'P']]
OPERATION_3 gives  : [['ch_trimming', 'P']]


