OPERATION_1 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_1 origin : [['summary', 'P']]
OPERATION_1 gives  : []


OPERATION_2 string : ch_samplesheet
 .splitCsv(header:true, sep:',')
 .map { validate_input(it) }
 .into { ch_prepare_file
           ch_samplesheet_cell_ranger
         ch_fastq }
OPERATION_2 origin : [['ch_samplesheet', 'P']]
OPERATION_2 gives  : []


