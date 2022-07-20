OPERATION_1 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; ch_read_files_trimming;  }
OPERATION_1 origin : [['params.readPaths', 'V']]
OPERATION_1 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P'], ['', 'P']]


OPERATION_2 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_2 origin : [['params.readPaths', 'V']]
OPERATION_2 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_3 string : Channel
        .fromFilePairs(params.reads, size: params.single_end ? 1 : 2)
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_3 origin : [['params.reads, size: params.single_end ? 1 : 2', 'A']]
OPERATION_3 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_4 string : bt_indices = Channel
        .fromPath("${params.bt_index}*", checkIfExists: true)
        .ifEmpty { exit 1, "Bowtie2 index directory not found: " }
OPERATION_4 origin : [['"${params.bt_index}*", checkIfExists: true', 'A']]
OPERATION_4 gives  : [['bt_indices', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


