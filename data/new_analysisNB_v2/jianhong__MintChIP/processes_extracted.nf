Name : runFastQCOriginal
Inputs : [[0, 'readPairsFastQCOriginal']]
Outputs : [[0, 'fastqcOutputOriginal']]
Emits : []


Name : runDemultiplex
Inputs : [[0, 'readPairsDemultiplex'], [1, 'barcode']]
Outputs : [[0, 'jemultiplexerStats'], [1, 'readPairsDemultiedTrimmingL'], [2, 'readPairsDemultiedTrimmingR']]
Emits : []


Name : runFastQCdemultiplex
Inputs : [[0, 'readPairsDemultiedTrimPF']]
Outputs : [[0, 'fastqcOutputDemultiplex']]
Emits : []


Name : runTrimming
Inputs : [[0, 'readPairsDemultiedTrimFlat']]
Outputs : [[0, 'readPairsTrimmed'], [1, 'readUnpairesTrimmed']]
Emits : []


Name : runFastQCTrimmed
Inputs : [[0, 'readPairsFastQCTrimmed']]
Outputs : [[0, 'fastqcOutputTrimmed']]
Emits : []


Name : runBWA
Inputs : [[0, 'readPairsRunMapping']]
Outputs : [[0, 'mappedFiles']]
Emits : []


Name : runHOMERwithoutInput
Inputs : [[0, 'forHomerWithoutInput']]
Outputs : [[0, 'homerFiles0'], [1, 'ChIPQCwithoutInput']]
Emits : []


Name : runHOMERwithInput
Inputs : [[0, 'forHomerWithInput']]
Outputs : [[0, 'homerFiles1'], [1, 'homerFiles2'], [2, 'homerFiles3'], [3, 'homerFiles4'], [4, 'ChIPQCwithInput']]
Emits : []


Name : runChIPQC1sampleWithoutInput
Inputs : [[0, 'ChIPQCwithoutInput']]
Outputs : [[0, 'chipqcFiles1']]
Emits : []


Name : runChIPQC1sampleWithInput
Inputs : [[0, 'ChIPQCwithInput']]
Outputs : [[0, 'chipqcFiles2']]
Emits : []


