OPERATION_1 string : Channel
    .fromPath(params.input_tsv)
    .ifEmpty { exit 1, "Cannot find input file : ${params.input_tsv}" }
    .splitCsv(skip:1, sep:'\t')
    .map { participant_id, participant_type, bam -> [ participant_id, participant_type, bam ] }
    .into { ch_input; ch_input_to_view }
OPERATION_1 origin : [['params.input_tsv', 'A']]
OPERATION_1 gives  : [['ch_input', 'P'], ['ch_input_to_view', 'P']]


OPERATION_2 string : ch_reference_tar_gz = Channel.value(file(params.reference_tar_gz))
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_reference_tar_gz', 'P']]


OPERATION_3 string : ch_input_to_view.view()
OPERATION_3 origin : [['ch_input_to_view', 'P']]
OPERATION_3 gives  : []


