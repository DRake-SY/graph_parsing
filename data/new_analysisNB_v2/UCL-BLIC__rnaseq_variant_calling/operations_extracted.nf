OPERATION_1 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_trimgalore; }
OPERATION_1 origin : [['params.readPaths', 'V']]
OPERATION_1 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimgalore', 'P'], ['', 'P']]


OPERATION_2 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { raw_reads_fastqc; raw_reads_trimgalore; }
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimgalore', 'P'], ['', 'P']]


OPERATION_3 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { raw_reads_fastqc; raw_reads_trimgalore; }
OPERATION_3 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_3 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimgalore', 'P'], ['', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : star_aligned
    .filter { logs, bams -> check_log(logs) }
    .flatMap {  logs, bams -> bams }
.into { bam_markduplicates }
OPERATION_5 origin : [['star_aligned', 'P']]
OPERATION_5 gives  : [['bam_markduplicates', 'P']]


