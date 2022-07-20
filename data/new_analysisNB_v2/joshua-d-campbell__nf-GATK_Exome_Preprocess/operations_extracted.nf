OPERATION_1 string : Channel.from(inputFile)
       .splitCsv(sep: '\t', header: inputFileHeader)
       .into { readPairsFastQC; readPairsFastqToSam }
OPERATION_1 origin : [['inputFile', 'V']]
OPERATION_1 gives  : [['readPairsFastQC', 'P'], ['readPairsFastqToSam', 'P']]


OPERATION_2 string : runBWAOutput_grouped_by_sample = runBWAOutput.groupTuple(by: [0,1])
OPERATION_2 origin : [['runBWAOutput', 'P']]
OPERATION_2 gives  : [['runBWAOutput_grouped_by_sample', 'P']]


OPERATION_3 string : runMarkDuplicatesOutput_grouped_by_sample = runMarkDuplicatesOutput.groupTuple(by: [0])
OPERATION_3 origin : [['runMarkDuplicatesOutput', 'P']]
OPERATION_3 gives  : [['runMarkDuplicatesOutput_grouped_by_sample', 'P']]


OPERATION_4 string : runIndelRealignerOutput_split = runIndelRealignerOutput.map { indivID, file -> tuple(indivID, file.baseName.replaceAll(".dedup.realign", ""), file) }
OPERATION_4 origin : [['runIndelRealignerOutput', 'P']]
OPERATION_4 gives  : [['runIndelRealignerOutput_split', 'P']]


OPERATION_5 string : FastQCOutput_grouped_by_indiv = FastQCOutput.groupTuple(by: [0])
OPERATION_5 origin : [['FastQCOutput', 'P']]
OPERATION_5 gives  : [['FastQCOutput_grouped_by_indiv', 'P']]


OPERATION_6 string : runMarkDuplicatesOutput_QC_grouped_by_indiv = runMarkDuplicatesOutput_QC.groupTuple(by: [0])
OPERATION_6 origin : [['runMarkDuplicatesOutput_QC', 'P']]
OPERATION_6 gives  : [['runMarkDuplicatesOutput_QC_grouped_by_indiv', 'P']]


OPERATION_7 string : CollectMultipleMetricsOutput_grouped_by_indiv = CollectMultipleMetricsOutput.groupTuple(by: [0])
OPERATION_7 origin : [['CollectMultipleMetricsOutput', 'P']]
OPERATION_7 gives  : [['CollectMultipleMetricsOutput_grouped_by_indiv', 'P']]


OPERATION_8 string : HybridCaptureMetricsOutput_grouped_by_indiv = HybridCaptureMetricsOutput.groupTuple(by: [0])
OPERATION_8 origin : [['HybridCaptureMetricsOutput', 'P']]
OPERATION_8 gives  : [['HybridCaptureMetricsOutput_grouped_by_indiv', 'P']]


OPERATION_9 string : runOxoGMetricsOutput_grouped_by_indiv = runOxoGMetricsOutput.groupTuple(by: [0])
OPERATION_9 origin : [['runOxoGMetricsOutput', 'P']]
OPERATION_9 gives  : [['runOxoGMetricsOutput_grouped_by_indiv', 'P']]


