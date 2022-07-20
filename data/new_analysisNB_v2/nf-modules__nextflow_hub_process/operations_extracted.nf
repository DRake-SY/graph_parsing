OPERATION_1 string : Channel.value("$workflow.launchDir/$params.refFasta")
        .set { ch_refFasta }
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_refFasta', 'P']]


OPERATION_2 string : Channel.fromFilePairs(params.readsFilePattern)
        .set { ch_in_PROCESS }
OPERATION_2 origin : [['params.readsFilePattern', 'A']]
OPERATION_2 gives  : [['ch_in_PROCESS', 'P']]


