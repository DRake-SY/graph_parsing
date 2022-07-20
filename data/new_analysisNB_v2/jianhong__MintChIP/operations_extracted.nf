OPERATION_1 string : Channel
  .fromFilePairs("${params.dataDir}/*_{R,}{1,2}.f{ast,}q.gz")
  .set {readPairs}
OPERATION_1 origin : [['"${params.dataDir}/*_{R,}{1,2}.f{ast,}q.gz"', 'A']]
OPERATION_1 gives  : [['readPairs', 'P']]


OPERATION_2 string : Channel.from(inputs).into{inputCh; inputChcp}
OPERATION_2 origin : [['inputs', 'V']]
OPERATION_2 gives  : [['inputCh', 'P'], ['inputChcp', 'P']]


OPERATION_3 string : readPairs.into{readPairsFastQCOriginal; readPairsDemultiplex}
OPERATION_3 origin : [['readPairs', 'P']]
OPERATION_3 gives  : [['readPairsFastQCOriginal', 'P'], ['readPairsDemultiplex', 'P']]


OPERATION_4 string : readPairsDemultiedTrimmingL.flatten()
  .merge(readPairsDemultiedTrimmingR.flatten())
  .into{readPairsDemultiedTrimPF; readPairsDemultiedTrimFlat}
OPERATION_4 origin : [['readPairsDemultiedTrimmingL', 'P']]
OPERATION_4 gives  : [['readPairsDemultiedTrimPF', 'P'], ['readPairsDemultiedTrimFlat', 'P']]


OPERATION_5 string : readPairsTrimmed.into{readPairsFastQCTrimmed; readPairsRunMapping}
OPERATION_5 origin : [['readPairsTrimmed', 'P']]
OPERATION_5 gives  : [['readPairsFastQCTrimmed', 'P'], ['readPairsRunMapping', 'P']]


OPERATION_6 string : mappedFiles.into{mappedFiles1; mappedFiles2; mappedFiles3; mappedFiles4}
OPERATION_6 origin : [['mappedFiles', 'P']]
OPERATION_6 gives  : [['mappedFiles1', 'P'], ['mappedFiles2', 'P'], ['mappedFiles3', 'P'], ['mappedFiles4', 'P']]


OPERATION_7 string : inputChFile = inputChcp.map{it-> "${it[2]}%${it[3]}"}.flatten().cross(mappedFiles2.map{it -> ["${it[1]}%${it[0]}", it]})
  .map{it -> it[1]}
OPERATION_7 origin : [['inputChcp', 'P']]
OPERATION_7 gives  : [['inputChFile', 'P']]


OPERATION_8 string : mappedPair = mappedFiles1.map{it -> ["${it[1]}%${it[0]}", it]}.cross(inputCh.map{it-> ["${it[0]}%${it[1]}", "${it[2]}%${it[3]}"]})
  .map{it -> [it[1][1], it[0][1]]}
OPERATION_8 origin : [['mappedFiles1', 'P']]
OPERATION_8 gives  : [['mappedPair', 'P']]


OPERATION_9 string : forHomerWithInput = inputChFile.cross(mappedPair)
  .map{it -> [it[0][1], it[1][1]]}.map{it->it.flatten()}
OPERATION_9 origin : [['inputChFile', 'P'], ['mappedPair', 'P']]
OPERATION_9 gives  : [['forHomerWithInput', 'P']]


OPERATION_10 string : forHomerWithoutInput = mappedFiles3.filter{it->!(it[0] in withInput)}
OPERATION_10 origin : [['mappedFiles3', 'P']]
OPERATION_10 gives  : [['forHomerWithoutInput', 'P']]


