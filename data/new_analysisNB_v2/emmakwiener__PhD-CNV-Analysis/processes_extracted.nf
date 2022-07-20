Name : runManta
Inputs : [[0, 'ref'], [1, 'refi'], [2, 'pairs']]
Outputs : [[0, 'mantaOutput']]
Emits : []


Name : combineNewSiteVCFs
Inputs : [[0, 'mantaOutput']]
Outputs : [[0, 'mergedVCF']]
Emits : []


Name : graphTyper
Inputs : [[0, 'bams'], [1, 'ref'], [2, 'refi'], [3, 'mergedVCF'], [4, 'chroms']]
Outputs : [[0, 'calledIndivVCFs']]
Emits : []


Name : mergeCalledByChromosome
Inputs : [[0, 'calledIndivVCFs']]
Outputs : [[0, 'chromResult']]
Emits : []


Name : mergeAllChroms
Inputs : [[0, 'chromResult']]
Outputs : [[0, 'allResult']]
Emits : []


