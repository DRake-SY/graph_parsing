OPERATION_1 string : bwa_index = Channel
        .fromPath(params.bwa_index)
        .ifEmpty { exit 1, "BWA index not found: ${params.bwa_index}" }
OPERATION_1 origin : [['params.bwa_index', 'A']]
OPERATION_1 gives  : [['bwa_index', 'P']]


OPERATION_2 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_3 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_3 origin : [['params.readPaths', 'V']]
OPERATION_3 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_4 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { raw_reads_fastqc; raw_reads_bbduk }
OPERATION_4 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_4 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_bbduk', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


