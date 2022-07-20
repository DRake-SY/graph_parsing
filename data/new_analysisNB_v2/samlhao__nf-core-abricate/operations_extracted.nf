OPERATION_1 string : Channel
        .fromPath(params.assemblies)
        .set{asm_ch}
OPERATION_1 origin : [['params.assemblies', 'A']]
OPERATION_1 gives  : [['asm_ch', 'P']]


OPERATION_2 string : Channel
        .empty()
        .set{asm_ch}
OPERATION_2 origin : []
OPERATION_2 gives  : [['asm_ch', 'P']]


OPERATION_3 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { read_files_fastqc; read_files_trimming }
OPERATION_3 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_3 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_4 string : Channel
        .empty()
        .set { assembled_ch }
OPERATION_4 origin : []
OPERATION_4 gives  : [['assembled_ch', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


