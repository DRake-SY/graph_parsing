OPERATION_1 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\n" }
        .into { read_files_fastqc; read_files_trimming }
OPERATION_1 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_1 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


