OPERATION_1 string : Channel.value("$workflow.launchDir/$params.refFasta")
        .set { ch_refFasta }
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_refFasta', 'P']]


OPERATION_2 string : Channel.fromPath("${params.markDuplicatesSparkResultsDir}/*${params.sortedBamFilePattern}")
        .set { ch_in_haplotypeCaller }
OPERATION_2 origin : [['"${params.markDuplicatesSparkResultsDir}/*${params.sortedBamFilePattern}"', 'A']]
OPERATION_2 gives  : [['ch_in_haplotypeCaller', 'P']]


OPERATION_3 string : Channel.fromPath("${params.bwaMemResultsDir}/*${params.samFilePattern}")
        .set { ch_in_markDuplicatesSpark }
OPERATION_3 origin : [['"${params.bwaMemResultsDir}/*${params.samFilePattern}"', 'A']]
OPERATION_3 gives  : [['ch_in_markDuplicatesSpark', 'P']]


