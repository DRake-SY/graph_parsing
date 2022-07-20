OPERATION_1 string : bt2_indices = Channel.fromPath( "${params.bt2index}*.bt2" ).toList()
OPERATION_1 origin : [['"${params.bt2index}*.bt2"', 'A']]
OPERATION_1 gives  : [['bt2_indices', 'P']]


OPERATION_2 string : bt2_indices = Channel.from(params.readPaths).map{ file(it) }.toList()
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['bt2_indices', 'P']]


OPERATION_3 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_3 origin : [['params.readPaths', 'V']]
OPERATION_3 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_4 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_4 origin : [['params.readPaths', 'V']]
OPERATION_4 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_5 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_5 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_5 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_6 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_6 origin : [['summary', 'P']]
OPERATION_6 gives  : []


