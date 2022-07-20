OPERATION_1 string : Channel.fromPath(params.csv)
    .splitCsv(header:true, sep:',')
    .map { row -> [ row.SampleName, [ file("${params.dir}/${row.R1}", checkIfExists: true), file("${params.dir}/${row.R2}", checkIfExists: true) ] ] }
    .into { ch_raw_reads_seqtk }
OPERATION_1 origin : [['params.csv', 'A']]
OPERATION_1 gives  : [['ch_raw_reads_seqtk', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


