OPERATION_1 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_1 origin : [['summary', 'P']]
OPERATION_1 gives  : []


OPERATION_2 string : ch_samplesheet
  .splitCsv(header:true, sep:',')
  .map{ count_bam(it) }
  .set { ch_bam_count }
OPERATION_2 origin : [['ch_samplesheet', 'P']]
OPERATION_2 gives  : [['ch_bam_count', 'P']]


OPERATION_3 string : ch_samplesheet_count
     .splitCsv(header:true, sep:',')
     .map { validate_input(it) }
     .set { ch_samtools }
OPERATION_3 origin : [['ch_samplesheet_count', 'P']]
OPERATION_3 gives  : [['ch_samtools', 'P']]


