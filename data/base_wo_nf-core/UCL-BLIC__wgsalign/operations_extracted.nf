OPERATION_1 string : bwa_index = Channel
        .fromPath(params.bwa_index)
        .ifEmpty { exit 1, "BWA index not found: ${params.bwa_index}" }
OPERATION_1 origin : [['params.bwa_index', 'A']]
OPERATION_1 gives  : [['bwa_index', 'P']]


OPERATION_2 string : Channel
     .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
     .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
     .into { read_files_fastqc; read_files_trimming }
OPERATION_2 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_2 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : trimmed_reads = read_files_trimming
OPERATION_4 origin : [['read_files_trimming', 'P']]
OPERATION_4 gives  : [['trimmed_reads', 'P']]


