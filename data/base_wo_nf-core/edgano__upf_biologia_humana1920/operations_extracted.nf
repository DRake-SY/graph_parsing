OPERATION_1 string : Channel
  .fromPath(params.genomeFa)
  .map { item -> [ item.baseName, item] }
  .set { genome }
OPERATION_1 origin : [['params.genomeFa', 'A']]
OPERATION_1 gives  : [['genome', 'P']]


OPERATION_2 string : Channel
  .fromPath(params.index)
  .map { item -> [ item.baseName, item] }
  .set { index }
OPERATION_2 origin : [['params.index', 'A']]
OPERATION_2 gives  : [['index', 'P']]


