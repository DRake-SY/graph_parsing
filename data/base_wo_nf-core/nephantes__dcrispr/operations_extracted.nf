OPERATION_1 string : Channel.value(params.mate).into{g_2_mate_g0_11;g_2_mate_g0_16;g_2_mate_g0_18;g_2_mate_g0_19;g_2_mate_g0_20;g_2_mate_g0_21;g_2_mate_g0_24;g_2_mate_g0_23;g_2_mate_g0_28;g_2_mate_g0_31}
OPERATION_1 origin : [['params.mate', 'V']]
OPERATION_1 gives  : [['g_2_mate_g0_11', 'P'], ['g_2_mate_g0_16', 'P'], ['g_2_mate_g0_18', 'P'], ['g_2_mate_g0_19', 'P'], ['g_2_mate_g0_20', 'P'], ['g_2_mate_g0_21', 'P'], ['g_2_mate_g0_24', 'P'], ['g_2_mate_g0_23', 'P'], ['g_2_mate_g0_28', 'P'], ['g_2_mate_g0_31', 'P']]


OPERATION_2 string : Channel.value(params.countPrefix).set{g_10_text_g_5}
OPERATION_2 origin : [['params.countPrefix', 'V']]
OPERATION_2 gives  : [['g_10_text_g_5', 'P']]


OPERATION_3 string : Channel.value(params.sample_label).into{g_11_text_g_5;g_11_text_g_7}
OPERATION_3 origin : [['params.sample_label', 'V']]
OPERATION_3 gives  : [['g_11_text_g_5', 'P'], ['g_11_text_g_7', 'P']]


OPERATION_4 string : Channel.value(params.testPrefix).set{g_12_text_g_7}
OPERATION_4 origin : [['params.testPrefix', 'V']]
OPERATION_4 gives  : [['g_12_text_g_7', 'P']]


OPERATION_5 string : undefined. (prevents errors)
OPERATION_5 origin : [['undefined', 'P']]
OPERATION_5 gives  : []


