OPERATION_1 string : Channel
    .fromFilePairs( fastqs )
    .ifEmpty { error "Cannot find any reads matching: ${fastqs}" }
    .set { raw_fastqs }
OPERATION_1 origin : [['fastqs', 'A']]
OPERATION_1 gives  : [['raw_fastqs', 'P']]


OPERATION_2 string : adapter_file.into {adapter_file_1; adapter_file_2}
OPERATION_2 origin : [['adapter_file', 'P']]
OPERATION_2 gives  : [['adapter_file_1', 'P'], ['adapter_file_2', 'P']]


