OPERATION_1 string : Channel.fromFilePairs("${params.inputDir}/${params.filenamePattern}", size: 2).into { fastqPairs; fastqPairs2 }
OPERATION_1 origin : [['"${params.inputDir}/${params.filenamePattern}", size: 2', 'A']]
OPERATION_1 gives  : [['fastqPairs', 'P'], ['fastqPairs2', 'P']]


OPERATION_2 string : fastqPairs2.flatMap{ sampleID, fastqList ->
        return(fastqList)
    }
    .set { allFastqs }
OPERATION_2 origin : [['fastqPairs2', 'P']]
OPERATION_2 gives  : [['allFastqs', 'P']]


OPERATION_3 string : allFastqs.filter(~/.*\.gz$/).set { allFastqGz }
OPERATION_3 origin : [['allFastqs', 'P']]
OPERATION_3 gives  : [['allFastqGz', 'P']]


