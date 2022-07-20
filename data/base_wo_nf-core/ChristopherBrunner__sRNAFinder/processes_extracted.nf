Name : createsRNAbedFile
Inputs : [[0, 'lengthGenome_sRNAbed'], [1, 'windowSize'], [2, 'step']]
Outputs : [[0, 'sRNAWindowsBED']]
Emits : []


Name : createProteinBEDFile
Inputs : [[0, 'gffFile']]
Outputs : [[0, 'proteinCodingBED']]
Emits : []


Name : runsRNACharP
Inputs : [[0, 'sRNACharP_nf'], [1, 'nextflow_sRNACharP_config']]
Outputs : [[0, 'sRNACharPresult']]
Emits : []


Name : runsRNARanking
Inputs : [[0, 'sRNACharPresult'], [1, 'RF_classifier4sRNA_R'], [2, 'RF_classifier4sRNA_rds']]
Outputs : [[0, 'sRNARankingResult']]
Emits : []


Name : joinScoreAndCoordinates
Inputs : [[0, 'sRNARankingResult'], [1, 'sRNAWindowsBEDJoin']]
Outputs : [[0, 'sRNARankingJoined']]
Emits : []


Name : plotGenomesRNAs
Inputs : [[0, 'sRNARankingJoinedPlot'], [1, 'lengthGenomePlot'], [2, 'windowSize'], [3, 'step']]
Outputs : [[0, 'GenomePlotsRNA'], [1, 'GenomePlotNosRNA']]
Emits : []


Name : filterGenomeWindows
Inputs : [[0, 'sRNARankingJoinedFilter'], [1, 'lengthGenomeFilter'], [2, 'windowSize'], [3, 'step']]
Outputs : [[0, 'pipelineRerun']]
Emits : []


