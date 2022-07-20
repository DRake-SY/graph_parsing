Name : PREPAREDBREMOTE_MINIMAP
Inputs : [[0, 'ch_humanGenomeUri']]
Outputs : [[0, 'ch_prepareDb_humanDepletion']]
Emits : []


Name : PREPAREDBLOCAL_MINIMAP
Inputs : [[0, 'ch_humanGenomeUri']]
Outputs : [[0, 'ch_prepareDb_humanDepletion']]
Emits : []


Name : DEPLETEHUMAN_MINIMAP
Inputs : [[0, 'ch_inputReads'], [0, 'ch_prepareDb_humanDepletion']]
Outputs : [[0, 'ch_depleteHuman_trimReads']]
Emits : []


Name : TRIMREADS_TRIMGALORE
Inputs : [[0, 'ch_depleteHuman_trimReads']]
Outputs : [[0, 'ch_trimReads_insertSize'], [0, 'ch_trimReads_sampleComposition'], [1, 'ch_trimReads_qcSummary']]
Emits : []


Name : INSERTSIZE_BBMERGE
Inputs : [[0, 'ch_trimReads_insertSize']]
Outputs : [[0, 'ch_insertSize_qcSummary']]
Emits : []


Name : PREPAREDBREMOTE_CENTRIFUGE
Inputs : [[0, 'ch_centrifugeDbUri']]
Outputs : [[0, 'ch_prepareDb_sampleComposition']]
Emits : []


Name : PREPAREDLOCAL_CENTRIFUGE
Inputs : [[0, 'ch_centrifugeDbUri']]
Outputs : [[0, 'ch_prepareDb_sampleComposition']]
Emits : []


Name : SAMPLECOMPOSITION_CENTRIFUGE
Inputs : [[0, 'ch_trimReads_sampleComposition']]
Outputs : [[0, 'ch_sampleComposition_compositionSummary']]
Emits : []


Name : QCSUMMARY_MULTIQC
Inputs : [[0, 'ch_insertSize_qcSummary'], [1, 'ch_trimReads_qcSummary']]
Outputs : []
Emits : []


Name : PREPAREDB_KRONA
Inputs : [[0, 'ch_kronaDummy']]
Outputs : [[0, 'ch_prepareDb_sampleCompSummary']]
Emits : []


Name : SAMPLECOMPSUMMARY_KRONA
Inputs : [[0, 'ch_sampleComposition_compositionSummary'], [1, 'ch_prepareDb_sampleCompSummary']]
Outputs : []
Emits : []


