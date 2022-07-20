OPERATION_1 string : Channel
    .fromPath(params.deg)
    .map { file -> tuple(file.baseName, file)  }
    .into {deg_ch; deg_info}
OPERATION_1 origin : [['params.deg', 'A']]
OPERATION_1 gives  : [['deg_ch', 'P'], ['deg_info', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.bg)
    .set { bg_ch }
OPERATION_2 origin : [['params.bg', 'A']]
OPERATION_2 gives  : [['bg_ch', 'P']]


OPERATION_3 string : deg_info.println()
OPERATION_3 origin : [['deg_info', 'P']]
OPERATION_3 gives  : []


