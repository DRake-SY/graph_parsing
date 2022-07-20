OPERATION_1 string : sampleToFastqLocationsBunzips = Channel
  .fromPath(params.sampleToFastqsPath)
  .splitCsv(sep: "\t")
  .filter {it.size() == 2}
  .filter{it[1].endsWith(".tar.bz2")}
OPERATION_1 origin : [['params.sampleToFastqsPath', 'A']]
OPERATION_1 gives  : [['sampleToFastqLocationsBunzips', 'P']]


OPERATION_2 string : sampleToFastqLocationsSingle = Channel
  .fromPath(params.sampleToFastqsPath)
  .splitCsv(sep: "\t")
  .filter {it.size() == 2}
  .filter{!it[1].endsWith(".tar.bz2")}
  .filter{!it[1].matches("^sra-single:[DES]RR[0-9]+\$")}
  .filter{!it[1].matches("^sra-paired:[DES]RR[0-9]+\$")}PROCESS DEF prepareReadsSingle
OPERATION_2 origin : [['params.sampleToFastqsPath', 'A']]
OPERATION_2 gives  : [['sampleToFastqLocationsSingle', 'P']]


OPERATION_3 string : sampleToFastqLocationsSingleSra = Channel
  .fromPath(params.sampleToFastqsPath)
  .splitCsv(sep: "\t")
  .filter {it.size() == 2}
  .filter{it[1].matches("^sra-single:[DES]RR[0-9]+\$")}PROCESS DEF prepareReadsSingleSra
OPERATION_3 origin : [['params.sampleToFastqsPath', 'A']]
OPERATION_3 gives  : [['sampleToFastqLocationsSingleSra', 'P']]


OPERATION_4 string : sampleToFastqLocationsPaired = Channel
  .fromPath(params.sampleToFastqsPath)
  .splitCsv(sep: "\t")
  .filter {it.size() == 3}PROCESS DEF prepareReadsPaired
OPERATION_4 origin : [['params.sampleToFastqsPath', 'A']]
OPERATION_4 gives  : [['sampleToFastqLocationsPaired', 'P']]


OPERATION_5 string : sampleToFastqLocationsPairedSra = Channel
  .fromPath(params.sampleToFastqsPath)
  .splitCsv(sep: "\t")
  .filter {it.size() == 2}
  .filter{it[1].matches("^sra-paired:[DES]RR[0-9]+\$")}PROCESS DEF prepareReadsPairedSra
OPERATION_5 origin : [['params.sampleToFastqsPath', 'A']]
OPERATION_5 gives  : [['sampleToFastqLocationsPairedSra', 'P']]


OPERATION_6 string : kneadedReads = kneadedReadsSingle.mix(kneadedReadsPaired).mix(kneadedReadsBunzips).mix(kneadedReadsSingleSra).mix(kneadedReadsPairedSra)
OPERATION_6 origin : [['kneadedReadsSingle', 'P'], ['kneadedReadsPaired', 'P'], ['kneadedReadsBunzips', 'P'], ['kneadedReadsSingleSra', 'P'], ['kneadedReadsPairedSra', 'P']]
OPERATION_6 gives  : [['kneadedReads', 'P']]


