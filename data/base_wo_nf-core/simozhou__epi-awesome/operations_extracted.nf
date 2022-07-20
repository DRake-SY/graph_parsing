OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : Channel
   .fromFilePairs( params.readsPath, size: params.singleEnd ? 1 : 2 )
   .ifEmpty { exit 1, "Cannot find any reads matching: ${params.readsPath}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
   .into { read_files_fastqc; read_files_trimming }
OPERATION_3 origin : [['params.readsPath, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_3 gives  : [['read_files_fastqc', 'P'], ['read_files_trimming', 'P']]


OPERATION_4 string : Channel
    .from(macsconfig.readLines())
    .map { line ->
        list = line.split(',')
        chip_sample_id = list[0]
        ctrl_sample_id = list[1]
        analysis_id = list[2]
        [ chip_sample_id, ctrl_sample_id, analysis_id ]
    }
.set{ macs_para }
OPERATION_4 origin : []
OPERATION_4 gives  : [['macs_para', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


