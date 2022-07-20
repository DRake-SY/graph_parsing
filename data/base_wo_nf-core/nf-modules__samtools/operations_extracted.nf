OPERATION_1 string : Channel.value("$workflow.launchDir/$params.refFasta")
        .set { ch_refFasta }
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_refFasta', 'P']]


OPERATION_2 string : Channel.fromFilePairs(params.readsFilePattern)
        .set { ch_in_samtools }
OPERATION_2 origin : [['params.readsFilePattern', 'A']]
OPERATION_2 gives  : [['ch_in_samtools', 'P']]


OPERATION_3 string : Channel.fromPath("${params.bwaMemResultsDir}/*${params.bamFilePattern}")
        .set { ch_in_sort }
OPERATION_3 origin : [['"${params.bwaMemResultsDir}/*${params.bamFilePattern}"', 'A']]
OPERATION_3 gives  : [['ch_in_sort', 'P']]


OPERATION_4 string : Channel.fromPath("${params.gatkMarkDuplicatesSparkResultsDir}/*${params.sortedBamFilePattern}")
        .into { ch_in_index; ch_in_depth }
OPERATION_4 origin : [['"${params.gatkMarkDuplicatesSparkResultsDir}/*${params.sortedBamFilePattern}"', 'A']]
OPERATION_4 gives  : [['ch_in_index', 'P'], ['ch_in_depth', 'P']]


