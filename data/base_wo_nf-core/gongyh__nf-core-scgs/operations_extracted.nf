OPERATION_1 string : ch_multiqc_config1 = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config1', 'P']]


OPERATION_2 string : ch_multiqc_config2 = Channel.fromPath(params.multiqc_config)
OPERATION_2 origin : [['params.multiqc_config', 'A']]
OPERATION_2 gives  : [['ch_multiqc_config2', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { read_files_fastqc; read_files_trimming }
OPERATION_4 origin : [['params.readPaths', 'V']]
OPERATION_4 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_5 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { read_files_fastqc; read_files_trimming }
OPERATION_5 origin : [['params.readPaths', 'V']]
OPERATION_5 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_6 string : Channel
        .fromFilePairs( params.reads, size: single_end ? 1 : 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { read_files_fastqc; read_files_trimming }
OPERATION_6 origin : [['params.reads, size: single_end ? 1 : 2', 'A']]
OPERATION_6 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


OPERATION_8 string : read_files_trimming.map {name, reads -> reads}
        .into { trimmed_reads; trimmed_reads_for_spades; trimmed_reads_for_kraken; trimmed_reads_for_kmer }
OPERATION_8 origin : [['read_files_trimming', 'P']]
OPERATION_8 gives  : [['trimmed_reads', 'P'], ['trimmed_reads_for_spades', 'P'], ['trimmed_reads_for_kraken', 'P'], ['trimmed_reads_for_kmer', 'P']]


OPERATION_9 string : trimmed_reads_for_spades.set { normalized_reads_for_assembly }
OPERATION_9 origin : [['trimmed_reads_for_spades', 'P']]
OPERATION_9 gives  : [['normalized_reads_for_assembly', 'P']]


