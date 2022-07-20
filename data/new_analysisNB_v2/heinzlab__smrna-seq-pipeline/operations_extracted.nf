OPERATION_1 string : bt2_indices = Channel.fromPath( "${params.bt2index}*.bt2" ).toList()
OPERATION_1 origin : [['"${params.bt2index}*.bt2"', 'A']]
OPERATION_1 gives  : [['bt2_indices', 'P']]


OPERATION_2 string : bt2_indices = Channel.from(params.readPaths).map{ file(it) }.toList()
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['bt2_indices', 'P']]


OPERATION_3 string : Channel
        .from(params.readPaths)
        .map { file(it) }
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_3 origin : [['params.readPaths', 'V']]
OPERATION_3 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_4 string : Channel
        .fromPath( params.reads )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
        .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_4 origin : [['params.reads', 'A']]
OPERATION_4 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


