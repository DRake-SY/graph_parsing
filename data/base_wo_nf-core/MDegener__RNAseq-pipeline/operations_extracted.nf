OPERATION_1 string : Channel
        .fromFilePairs(params.inFiles, size: -1)
        .ifEmpty {error"Cannot find any files matching: ${params.inFiles}"}
        .into { read_files_1; read_files_2 }
OPERATION_1 origin : [['params.inFiles, size: -1', 'A']]
OPERATION_1 gives  : [['read_files_1', 'P'], ['read_files_2', 'P']]


OPERATION_2 string : Channel
        .fromFilePairs(params.inFiles, size: -1)
        .ifEmpty {error"Cannot find any files matching: ${params.inFiles}"}
        .into { bam_miso; bam_rnaseqc }
OPERATION_2 origin : [['params.inFiles, size: -1', 'A']]
OPERATION_2 gives  : [['bam_miso', 'P'], ['bam_rnaseqc', 'P']]


