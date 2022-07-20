OPERATION_1 string : numbers = Channel.from(1..100)
OPERATION_1 origin : [['1..100', 'V']]
OPERATION_1 gives  : [['numbers', 'P']]


OPERATION_2 string : numbers1 = Channel.from(101..200)
OPERATION_2 origin : [['101..200', 'V']]
OPERATION_2 gives  : [['numbers1', 'P']]


OPERATION_3 string : numbers2 = Channel.from(201..300)
OPERATION_3 origin : [['201..300', 'V']]
OPERATION_3 gives  : [['numbers2', 'P']]


OPERATION_4 string : debug.println()
OPERATION_4 origin : [['debug', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : debug1.println()
OPERATION_5 origin : [['debug1', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : debug2.println()
OPERATION_6 origin : [['debug2', 'P']]
OPERATION_6 gives  : []


