OPERATION_1 string : data = Channel.create()
OPERATION_1 origin : []
OPERATION_1 gives  : [['data', 'P']]


OPERATION_2 string : data.into { data1; data2; data3 }
OPERATION_2 origin : [['data', 'P']]
OPERATION_2 gives  : [['data1', 'P'], ['data2', 'P'], ['data3', 'P']]


OPERATION_3 string : data2.println{ "Sample : " + it }
OPERATION_3 origin : [['data2', 'P']]
OPERATION_3 gives  : []


