OPERATION_1 string : Channel
  .fromFilePairs("${params.dataDir}/*_{R,}{1,2}.f{ast,}q.gz")
  .into {readPairsFastQCOriginal; readPairsForTrim}
OPERATION_1 origin : [['"${params.dataDir}/*_{R,}{1,2}.f{ast,}q.gz"', 'A']]
OPERATION_1 gives  : [['readPairsFastQCOriginal', 'P'], ['readPairsForTrim', 'P']]


OPERATION_2 string : readPairsTrimmed.into{readPairsTrimmed4BWA; readPairsTrimmed4blast}
OPERATION_2 origin : [['readPairsTrimmed', 'P']]
OPERATION_2 gives  : [['readPairsTrimmed4BWA', 'P'], ['readPairsTrimmed4blast', 'P']]


OPERATION_3 string : mappedFiles.into{mappedFiles4MACS2; mappedFiles4ATACseqQC}
OPERATION_3 origin : [['mappedFiles', 'P']]
OPERATION_3 gives  : [['mappedFiles4MACS2', 'P'], ['mappedFiles4ATACseqQC', 'P']]


