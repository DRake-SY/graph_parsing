OPERATION_1 string : input = Channel.fromPath("$baseDir/input.txt").splitText()
OPERATION_1 origin : [['"$baseDir/input.txt"', 'A']]
OPERATION_1 gives  : [['input', 'P']]


OPERATION_2 string : ch_decoded.toSortedList().flatten().subscribe { print it }
OPERATION_2 origin : [['ch_decoded', 'P']]
OPERATION_2 gives  : []


