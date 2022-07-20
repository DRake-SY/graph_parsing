Name : LCRfilterVCF
Inputs : [[0, 'vcfToAnnotate']]
Outputs : [[0, 'lcrfilteredvcf']]
Emits : []


Name : siftAddCosmic
Inputs : [[0, 'lcrfilteredvcf']]
Outputs : [[0, 'filteredcosmicvcf']]
Emits : []


Name : finishVCF
Inputs : [[0, 'filteredcosmicvcf']]
Outputs : [[0, 'finishedFile'], [1, 'finishedVCFFile']]
Emits : []


Name : publishVCF
Inputs : [[0, 'finishedVCFFile']]
Outputs : [[0, 'publishedVCF']]
Emits : []


