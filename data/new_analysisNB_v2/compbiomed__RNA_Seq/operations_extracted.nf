OPERATION_1 string : Channel.from(inputFile)
  .splitCsv(sep: '\t', header: true)
  .into {
    readInput_to_runFastQC
    readInput_to_runSTAR1pass
    readInput_to_runSTAR2pass
  }
OPERATION_1 origin : [['inputFile', 'V']]
OPERATION_1 gives  : []


