OPERATION_1 string : gen = Channel.from(1..10)
OPERATION_1 origin : [['1..10', 'V']]
OPERATION_1 gives  : [['gen', 'P']]


OPERATION_2 string : transformed1.into{consolidate1; twotransform}
OPERATION_2 origin : [['transformed1', 'P']]
OPERATION_2 gives  : [['consolidate1', 'P'], ['twotransform', 'P']]


OPERATION_3 string : consolidate1.collectFile(name: "consolidate1.txt",  newLine: false)
OPERATION_3 origin : [['consolidate1', 'P']]
OPERATION_3 gives  : []


