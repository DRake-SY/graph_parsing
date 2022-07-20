OPERATION_1 string : Channel
    .fromPath(params.original_fastqs, checkIfExists: true)
    .map { file -> tuple(file.name, file) }
    .set { original_fastqs }
OPERATION_1 origin : [['params.original_fastqs, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['original_fastqs', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.generated_fastqs, checkIfExists: true)                                           
    .map { file -> tuple(file.name, file) }
    .set { generated_fastqs }
OPERATION_2 origin : [['params.generated_fastqs, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['generated_fastqs', 'P']]


OPERATION_3 string : generated_fastqs.mix(original_fastqs_updated_header)
                .set { to_be_sorted_fastqs }
OPERATION_3 origin : [['generated_fastqs', 'P'], ['original_fastqs_updated_header', 'P']]
OPERATION_3 gives  : [['to_be_sorted_fastqs', 'P']]


