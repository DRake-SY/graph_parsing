OPERATION_1 string : Channel
        .fromFilePairs(FOLDER + "/*_R{1,2}_001.fastq.gz", flat: true)
        .set { reads }
OPERATION_1 origin : [['FOLDER + "/*_R{1,2}_001.fastq.gz", flat: true', 'A']]
OPERATION_1 gives  : [['reads', 'P']]


OPERATION_2 string : inputMerge = reads.groupTuple(by: 0)
OPERATION_2 origin : [['reads', 'P']]
OPERATION_2 gives  : [['inputMerge', 'P']]


