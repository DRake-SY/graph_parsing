OPERATION_1 string : Channel
    .fromPath(params.input)
    .ifEmpty { exit 1, "Cannot find input file : ${params.input}" }
    .splitCsv(header:true)
    .map{ row -> file(row.bam) }
    .set { ch_input }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['ch_input', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.reference)
    .ifEmpty { exit 1, "Cannot find input file : ${params.reference}" }
    .set { ch_reference }
OPERATION_2 origin : [['params.reference', 'A']]
OPERATION_2 gives  : [['ch_reference', 'P']]


OPERATION_3 string : ch_input.into{ch_input_0;
              ch_input_1;
              ch_input_2;
              ch_input_3;
              ch_input_4;
              ch_input_5;
              ch_input_6;
              ch_input_7;
              ch_input_8;
              ch_input_9;
              ch_input_10;
              ch_input_11}
OPERATION_3 origin : [['ch_input', 'P']]
OPERATION_3 gives  : [['ch_input_0', 'P'], ['ch_input_1', 'P'], ['ch_input_2', 'P'], ['ch_input_3', 'P'], ['ch_input_4', 'P'], ['ch_input_5', 'P'], ['ch_input_6', 'P'], ['ch_input_7', 'P'], ['ch_input_8', 'P'], ['ch_input_9', 'P'], ['ch_input_10', 'P'], ['ch_input_11', 'P']]


OPERATION_4 string : ch_reference.into{ch_reference_0;
                  ch_reference_1;
                  ch_reference_2;
                  ch_reference_3;
                  ch_reference_4;
                  ch_reference_5;
                  ch_reference_6;
                  ch_reference_7;
                  ch_reference_8;
                  ch_reference_9;
                  ch_reference_10;
                  ch_reference_11}
OPERATION_4 origin : [['ch_reference', 'P']]
OPERATION_4 gives  : [['ch_reference_0', 'P'], ['ch_reference_1', 'P'], ['ch_reference_2', 'P'], ['ch_reference_3', 'P'], ['ch_reference_4', 'P'], ['ch_reference_5', 'P'], ['ch_reference_6', 'P'], ['ch_reference_7', 'P'], ['ch_reference_8', 'P'], ['ch_reference_9', 'P'], ['ch_reference_10', 'P'], ['ch_reference_11', 'P']]


