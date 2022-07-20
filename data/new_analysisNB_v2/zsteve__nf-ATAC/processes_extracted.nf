Name : sampleFastQC
Inputs : [[0, 'readPairOut_FQC']]
Outputs : [[1, 'fastQCReport']]
Emits : []


Name : sampleCutadapt
Inputs : [[0, 'readPairOut']]
Outputs : [[1, 'trimmedPairOut']]
Emits : []


Name : sampleMapToReference
Inputs : [[0, 'trimmedPairOut']]
Outputs : [[1, 'mappedSamOut']]
Emits : []


Name : sampleSamToBam
Inputs : [[0, 'mappedSamOut']]
Outputs : [[2, 'mappedBamOut_getStat'], [2, 'mappedBamOut'], [3, 'mappedBamOut_QC']]
Emits : []


Name : sampleGetMapStats
Inputs : [[0, 'mappedBamOut_getStat']]
Outputs : [[2, 'flagStatOut']]
Emits : []


Name : sampleFilterMMMR
Inputs : [[0, 'mappedBamOut']]
Outputs : [[1, 'filteredMMMROut']]
Emits : []


Name : sampleFilterDedup
Inputs : [[0, 'filteredMMMROut']]
Outputs : [[1, 'filteredDedupOut_makeTags'], [1, 'filteredDedupOut_callPeaks_MACS']]
Emits : []


Name : sampleMakeTags
Inputs : [[0, 'filteredDedupOut_makeTags']]
Outputs : [[0, 'makeTagsOut'], [0, 'makeTagsOut_callPeaks_homer']]
Emits : []


Name : sampleMakeUCSCTrack
Inputs : [[0, 'makeTagsOut']]
Outputs : [[1, 'makeUCSCTrackOut']]
Emits : []


Name : sampleMACS2CallPeaks
Inputs : [[0, 'filteredDedupOut_callPeaks_MACS']]
Outputs : [[1, 'outputMACS2_xlsPeaks']]
Emits : []


Name : sampleHomerCallPeaks
Inputs : [[0, 'makeTagsOut_callPeaks_homer']]
Outputs : [[1, 'outputHomerFindpeaks']]
Emits : []


Name : sampleAnnotatePeaks
Inputs : [[0, 'outputMACS2_xlsPeaks']]
Outputs : [[1, 'outputAnnotatePeaks']]
Emits : []


Name : subsetBam
Inputs : [[0, 'mappedBamOut_QC']]
Outputs : [[1, 'subsetBamOut_QC']]
Emits : []


Name : createQCReport
Inputs : [[0, 'subsetBamOut_QC']]
Outputs : []
Emits : []


