OPERATION_1 string : Channel.fromPath(params.csv).splitCsv(header: true).set{ assemblyUrlsCsv }
OPERATION_1 origin : [['params.csv', 'A']]
OPERATION_1 gives  : [['assemblyUrlsCsv', 'P']]


OPERATION_2 string : Channel.from( read_lengths ).set{ readLengths }
OPERATION_2 origin : [['read_lengths', 'V']]
OPERATION_2 gives  : [['readLengths', 'P']]


OPERATION_3 string : Channel.fromSRA(params.refreads).set{ referenceFastq }
OPERATION_3 origin : [['params.refreads', 'S']]
OPERATION_3 gives  : [['referenceFastq', 'P']]


OPERATION_4 string : Channel.create().set{ extractRegion }
OPERATION_4 origin : []
OPERATION_4 gives  : [['extractRegion', 'P']]


OPERATION_5 string : Channel.create().set{ simulateReadsNoRegion }
OPERATION_5 origin : []
OPERATION_5 gives  : [['simulateReadsNoRegion', 'P']]


OPERATION_6 string : choiceExtractRegion.choice( extractRegion, simulateReadsNoRegion) { it[4].toLowerCase()  = 0
 } else { 
choiceExtractRegion.choice( extractRegion, simulateReadsNoRegion) { it[4].toLowerCase()  = 1}
 }
OPERATION_6 origin : [['choiceExtractRegion', 'P']]
OPERATION_6 gives  : [['extractRegion', 'P'], ['simulateReadsNoRegion', 'P'], ['extractRegion', 'P'], ['simulateReadsNoRegion', 'P']]


OPERATION_7 string : simulateReadsRegion.mix(
    simulateReadsNoRegion.map { 
        [ it[0], it[1], it[2], it[3] ] 
        }
    ).set{
        getFirstFastaHeader
    }
OPERATION_7 origin : [['simulateReadsRegion', 'P']]
OPERATION_7 gives  : [['getFirstFastaHeader', 'P']]


