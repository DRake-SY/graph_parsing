OPERATION_1 string : bedfiles = Channel
  .fromPath(params.files)
  .map { file -> [ file.baseName, file] }
OPERATION_1 origin : [['params.files', 'A']]
OPERATION_1 gives  : [['bedfiles', 'P']]


