OPERATION_1 string : left = Channel.watchPath("./aaa/*")
OPERATION_1 origin : [['"./aaa/*"', 'A']]
OPERATION_1 gives  : [['left', 'P']]


OPERATION_2 string : right = Channel.from(['Z', 6], ['Y', 5], ['X', 4])
OPERATION_2 origin : [["['Z', 6], ['Y', 5], ['X', 4]", 'V']]
OPERATION_2 gives  : [['right', 'P']]


OPERATION_3 string : l1 = left.map{
        id = it.getName()
  
  [id, id]

}
OPERATION_3 origin : [['left', 'P']]
OPERATION_3 gives  : [['l1', 'P']]


OPERATION_4 string : l1.join(right, remainder:true).println()
OPERATION_4 origin : [['l1', 'P']]
OPERATION_4 gives  : []


