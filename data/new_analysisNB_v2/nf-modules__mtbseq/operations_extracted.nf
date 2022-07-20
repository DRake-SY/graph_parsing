OPERATION_1 string : ch_refFILE = Channel.value("$baseDir/refFILE")
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_refFILE', 'P']]


OPERATION_2 string : Channel.fromFilePairs(inputRawFilePattern)
        .into { ch_in_PROCESS }
OPERATION_2 origin : [['inputRawFilePattern', 'A']]
OPERATION_2 gives  : [['ch_in_PROCESS', 'P']]


