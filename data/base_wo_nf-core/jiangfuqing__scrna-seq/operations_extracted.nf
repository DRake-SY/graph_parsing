OPERATION_1 string : Channel
        .fromPath(params.gtf)
        .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
        .into { gtf_alevin }
OPERATION_1 origin : [['params.gtf', 'A']]
OPERATION_1 gives  : [['gtf_alevin', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.fasta)
        .ifEmpty { exit 1, "Fasta file not found: ${params.fasta}" }
        .into { fasta_alevin }
OPERATION_2 origin : [['params.fasta', 'A']]
OPERATION_2 gives  : [['fasta_alevin', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.salmon_index)
        .ifEmpty { exit 1, "Salmon index not found: ${params.salmon_index}" }
        .into { salmon_index_alevin }
OPERATION_3 origin : [['params.salmon_index', 'A']]
OPERATION_3 gives  : [['salmon_index_alevin', 'P']]


OPERATION_4 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_4 origin : [['params.multiqc_config', 'A']]
OPERATION_4 gives  : [['ch_multiqc_config', 'P']]


OPERATION_5 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_5 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_5 gives  : [['ch_output_docs', 'P']]


OPERATION_6 string : Channel
             .from(params.readPaths)
             .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
             .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
             .into { read_files_alevin }
OPERATION_6 origin : [['params.readPaths', 'V']]
OPERATION_6 gives  : [['read_files_alevin', 'P']]


OPERATION_7 string : Channel
            .fromFilePairs( params.reads )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
            .set { read_files_alevin }
OPERATION_7 origin : [['params.reads', 'A']]
OPERATION_7 gives  : [['read_files_alevin', 'P']]


OPERATION_8 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_8 origin : [['summary', 'P']]
OPERATION_8 gives  : []


