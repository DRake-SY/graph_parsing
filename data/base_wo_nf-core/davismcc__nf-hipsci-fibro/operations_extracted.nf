OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
    .into { read_files_fastqc }
OPERATION_1 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_1 gives  : [['read_files_fastqc', 'P']]


OPERATION_2 string : Channel
    .fromPath( params.bams )
    .ifEmpty { exit 1, "Cannot find any bams matching: ${params.bams}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
    .into { read_files_bams }
OPERATION_2 origin : [['params.bams', 'A']]
OPERATION_2 gives  : [['read_files_bams', 'P']]


OPERATION_3 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_3 origin : [['summary', 'P']]
OPERATION_3 gives  : []


