OPERATION_1 string : Channel
    .fromPath(params.reference)
    .ifEmpty { exit 1, "Error: Cannot find reference file : ${params.reference}" }
    .set { ch_input_reference }
OPERATION_1 origin : [['params.reference', 'A']]
OPERATION_1 gives  : [['ch_input_reference', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.annotation)
    .ifEmpty { exit 1, "Error: Cannot find annotation file : ${params.annotation}" }
    .set { ch_input_gtf }
OPERATION_2 origin : [['params.annotation', 'A']]
OPERATION_2 gives  : [['ch_input_gtf', 'P']]


OPERATION_3 string : Channel
      .from(params.read_length.toString().split(','))
      .set { ch_read_length }
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_read_length', 'P']]


OPERATION_4 string : Channel
      .from((params.read_length_from..params.read_length_to).by(params.read_length_by))
      .set { ch_read_length }
OPERATION_4 origin : []
OPERATION_4 gives  : [['ch_read_length', 'P']]


