OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: -1 )
    .ifEmpty { error "Cannot find any reads matching: ${params.reads}" }
    .into { read_filesA; read_filesB }
OPERATION_1 origin : [['params.reads, size: -1', 'A']]
OPERATION_1 gives  : [['read_filesA', 'P'], ['read_filesB', 'P']]


OPERATION_2 string : indexes
    .combine(read_filesA)
    .set { read_files_and_index }
OPERATION_2 origin : [['indexes', 'P'], ['read_filesA', 'P']]
OPERATION_2 gives  : [['read_files_and_index', 'P']]


OPERATION_3 string : quantification_multiQC_ch
  .mix(fastqc_multiQC_ch)
  .collect()
  .set {multiQC_ch}
OPERATION_3 origin : [['quantification_multiQC_ch', 'P'], ['fastqc_multiQC_ch', 'P']]
OPERATION_3 gives  : [['multiQC_ch', 'P']]


