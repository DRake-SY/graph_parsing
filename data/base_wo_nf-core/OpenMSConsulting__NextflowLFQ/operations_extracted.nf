OPERATION_1 string : Channel.fromPath(params.input).map { file -> [file.baseName, file ]}.into { ch_1; ch_2 }
OPERATION_1 origin : [['params.input', 'A']]
OPERATION_1 gives  : [['ch_1', 'P'], ['ch_2', 'P']]


OPERATION_2 string : ch_database = Channel.value(params.database)
OPERATION_2 origin : [['params.database', 'V']]
OPERATION_2 gives  : [['ch_database', 'P']]


OPERATION_3 string : ch_msgfplus = Channel.value(params.msgfplus)
OPERATION_3 origin : [['params.msgfplus', 'V']]
OPERATION_3 gives  : [['ch_msgfplus', 'P']]


OPERATION_4 string : ch_3.into { ch_4; ch_5 }
OPERATION_4 origin : [['ch_3', 'P']]
OPERATION_4 gives  : [['ch_4', 'P'], ['ch_5', 'P']]


OPERATION_5 string : ch_8.into { ch_9; ch_10 }
OPERATION_5 origin : [['ch_8', 'P']]
OPERATION_5 gives  : [['ch_9', 'P'], ['ch_10', 'P']]


OPERATION_6 string : ch_11.into { ch_12; ch_13 }
OPERATION_6 origin : [['ch_11', 'P']]
OPERATION_6 gives  : [['ch_12', 'P'], ['ch_13', 'P']]


OPERATION_7 string : ch_18.into { ch_19; ch_20 }
OPERATION_7 origin : [['ch_18', 'P']]
OPERATION_7 gives  : [['ch_19', 'P'], ['ch_20', 'P']]


