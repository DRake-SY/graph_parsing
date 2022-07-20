OPERATION_1 string : Channel
  .fromFilePairs( params.input, size: 1 )
  .ifEmpty { exit 1, "Cannot find any files matching ${params.input}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!" }
  .set { input_ch }
OPERATION_1 origin : [['params.input, size: 1', 'A']]
OPERATION_1 gives  : [['input_ch', 'P']]


