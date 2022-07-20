OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { read_files_fastqc; read_files_trimming }
OPERATION_3 origin : [['params.readPaths', 'V']]
OPERATION_3 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_4 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { read_files_fastqc; read_files_trimming }
OPERATION_4 origin : [['params.readPaths', 'V']]
OPERATION_4 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_5 string : Channel
        .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { read_files_fastqc; read_files_trimming }
OPERATION_5 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_5 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_6 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_6 origin : [['summary', 'P']]
OPERATION_6 gives  : []


