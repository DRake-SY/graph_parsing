OPERATION_1 string : Channel
        .fromFilePairs(params.reads, checkIfExists: true)
        .ifEmpty { exit 1, help_message("No pairs of reads were found: ${params.reads}")}
        .into { reads_raw_fastqc; reads_trim_raw_reads }
OPERATION_1 origin : [['params.reads, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['reads_raw_fastqc', 'P'], ['reads_trim_raw_reads', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.genome as String, checkIfExists: true)
    .ifEmpty { exit 1, help_message("No reference was found: ${params.genome}")}
    .set { genome }
OPERATION_2 origin : [['params.genome as String, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['genome', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.annotation as String, checkIfExists: true)
    .ifEmpty { exit 1, help_message("No annotation file was found: ${params.annotation}")}
    .into {annotation_bq ; annotation_hisat2}
OPERATION_3 origin : [['params.annotation as String, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['annotation_bq', 'P'], ['annotation_hisat2', 'P']]


