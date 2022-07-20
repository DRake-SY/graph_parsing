OPERATION_1 string : Channel.fromPath(params.rawdata_dir)
  .map { file -> tuple(file.baseName, file) }
  .set { genomes }
OPERATION_1 origin : [['params.rawdata_dir', 'A']]
OPERATION_1 gives  : [['genomes', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


