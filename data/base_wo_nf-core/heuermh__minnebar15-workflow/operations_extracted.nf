OPERATION_1 string : logFiles = Channel.fromPath("${params.logs}/**.log")
OPERATION_1 origin : [['"${params.logs}/**.log"', 'A']]
OPERATION_1 gives  : [['logFiles', 'P']]


OPERATION_2 string : toArchive, toFilter = logFiles.into(2)
OPERATION_2 origin : [['logFiles', 'P']]
OPERATION_2 gives  : [['toArchive', 'P'], ['toFilter', 'P']]


