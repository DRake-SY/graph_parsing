OPERATION_1 string : ref_ch = Channel.fromPath( params.fastas )
OPERATION_1 origin : [['params.fastas', 'A']]
OPERATION_1 gives  : [['ref_ch', 'P']]


OPERATION_2 string : Channel.fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\n" +\
            "NB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\n" +\
            "If this is single-end data, please specify --singleEnd on the command line." }
        .into { reads_ch; reads_fastqc_ch }
OPERATION_2 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_2 gives  : [['reads_ch', 'P'], ['reads_fastqc_ch', 'P']]


