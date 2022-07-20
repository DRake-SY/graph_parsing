OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : Channel
   .fromFilePairs( params.reads, size: 3 )
   .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
   .into { read_files_fastqc; read_files_longranger }
OPERATION_3 origin : [['params.reads, size: 3', 'A']]
OPERATION_3 gives  : [['read_files_fastqc', 'P'], ['read_files_longranger', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


