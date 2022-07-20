OPERATION_1 string : ch_dummy1.view().into { ch_into_trim1; ch_switch1 }
OPERATION_1 origin : [['ch_dummy1', 'P']]
OPERATION_1 gives  : [['ch_into_trim1', 'P'], ['ch_switch1', 'P']]


OPERATION_2 string : ch_dummy2.view().into { ch_into_trim2; ch_switch2 }
OPERATION_2 origin : [['ch_dummy2', 'P']]
OPERATION_2 gives  : [['ch_into_trim2', 'P'], ['ch_switch2', 'P']]


OPERATION_3 string : ch_switch1.until{params.trim}.mix(ch_trimlq1).set{ch_into_alignment1}
OPERATION_3 origin : [['ch_switch1', 'P'], ['ch_trimlq1', 'P']]
OPERATION_3 gives  : [['ch_into_alignment1', 'P']]


OPERATION_4 string : ch_switch2.until{params.trim}.mix(ch_trimlq2).set{ch_into_alignment2}
OPERATION_4 origin : [['ch_switch2', 'P'], ['ch_trimlq2', 'P']]
OPERATION_4 gives  : [['ch_into_alignment2', 'P']]


