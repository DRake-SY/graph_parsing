Name : runFastqToSam
Inputs : [[0, 'readPairsFastqToSam']]
Outputs : [[0, 'runFastqToSamOutput']]
Emits : []


Name : runMarkIlluminaAdapters
Inputs : [[0, 'runFastqToSamOutput']]
Outputs : [[0, 'runMarkIlluminaAdaptersOutput']]
Emits : []


Name : runBWA
Inputs : [[0, 'runMarkIlluminaAdaptersOutput']]
Outputs : [[0, 'runBWAOutput']]
Emits : []


Name : runMarkDuplicates
Inputs : [[0, 'runBWAOutput_grouped_by_sample']]
Outputs : [[0, 'runMarkDuplicatesOutput'], [1, 'runMarkDuplicatesOutput_QC']]
Emits : []


Name : runRealignerTargetCreator
Inputs : [[0, 'runMarkDuplicatesOutput_grouped_by_sample']]
Outputs : [[0, 'runRealignerTargetCreatorOutput']]
Emits : []


Name : runIndelRealigner
Inputs : [[0, 'runRealignerTargetCreatorOutput']]
Outputs : [[0, 'runIndelRealignerOutput'], [1, 'runIndelRealignerBAIOutput']]
Emits : []


Name : runBaseRecalibrator
Inputs : [[0, 'runIndelRealignerOutput_split']]
Outputs : [[0, 'runBaseRecalibratorOutput']]
Emits : []


Name : runPrintReads
Inputs : [[0, 'runBaseRecalibratorOutput']]
Outputs : [[0, 'runPrintReadsOutput_for_DepthOfCoverage'], [0, 'runPrintReadsOutput_for_HC_Metrics'], [0, 'runPrintReadsOutput_for_Multiple_Metrics'], [0, 'runPrintReadsOutput_for_OxoG_Metrics'], [1, 'runPrintReadsOutput_for_PostRecal']]
Emits : []


Name : runBaseRecalibratorPostRecal
Inputs : [[0, 'runPrintReadsOutput_for_PostRecal']]
Outputs : [[0, 'runBaseRecalibratorPostRecalOutput_Analyze']]
Emits : []


Name : runAnalyzeCovariates
Inputs : [[0, 'runBaseRecalibratorPostRecalOutput_Analyze']]
Outputs : [[0, 'runAnalyzeCovariatesOutput']]
Emits : []


Name : runDepthOfCoverage
Inputs : [[0, 'runPrintReadsOutput_for_DepthOfCoverage']]
Outputs : [[0, 'DepthOfCoverageOutput']]
Emits : []


Name : runCollectMultipleMetrics
Inputs : [[0, 'runPrintReadsOutput_for_Multiple_Metrics']]
Outputs : [[0, 'CollectMultipleMetricsOutput']]
Emits : []


Name : runHybridCaptureMetrics
Inputs : [[0, 'runPrintReadsOutput_for_HC_Metrics']]
Outputs : [[0, 'HybridCaptureMetricsOutput']]
Emits : []


Name : runOxoGMetrics
Inputs : [[0, 'runPrintReadsOutput_for_OxoG_Metrics']]
Outputs : [[0, 'runOxoGMetricsOutput']]
Emits : []


Name : runFastQC
Inputs : [[0, 'readPairsFastQC']]
Outputs : [[0, 'FastQCOutput'], [1, 'FastQCOutput2']]
Emits : []


Name : runMultiQCFastq
Inputs : [[0, 'FastQCOutput_grouped_by_indiv']]
Outputs : [[0, 'runMultiQCFastqOutput']]
Emits : []


Name : runMultiQCLibrary
Inputs : [[0, 'runMarkDuplicatesOutput_QC_grouped_by_indiv']]
Outputs : [[0, 'runMultiQCLibraryOutput']]
Emits : []


Name : runMultiQCSample
Inputs : [[0, 'CollectMultipleMetricsOutput_grouped_by_indiv'], [1, 'HybridCaptureMetricsOutput_grouped_by_indiv'], [2, 'runOxoGMetricsOutput_grouped_by_indiv']]
Outputs : [[0, 'runMultiQCSampleOutput']]
Emits : []


