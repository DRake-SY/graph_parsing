OPERATION_1 string : Channel
      .fromPath(params.csv, checkIfExists: true)
      .splitCsv(header:false)
      .map { row -> [file(row[0]), row[1]] }
      .ifEmpty { exit 1, "params.csv was empty - no input files supplied" }
      .groupTuple(by: [1])
      .into{reads_ch; print_ch}
OPERATION_1 origin : [['params.csv, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['reads_ch', 'P'], ['print_ch', 'P']]


