OPERATION_1 string : sequences_sra_ch = Channel.from(file(params.input_file).text).splitCsv(header: true)
OPERATION_1 origin : []
OPERATION_1 gives  : [['sequences_sra_ch', 'P']]


OPERATION_2 string : sequences_local_paired_ch = Channel.fromFilePairs(params.local_reads_paired)
OPERATION_2 origin : [['params.local_reads_paired', 'A']]
OPERATION_2 gives  : [['sequences_local_paired_ch', 'P']]


OPERATION_3 string : sequences_local_single_ch = Channel.fromPath(params.local_reads_single)
OPERATION_3 origin : [['params.local_reads_single', 'A']]
OPERATION_3 gives  : [['sequences_local_single_ch', 'P']]


