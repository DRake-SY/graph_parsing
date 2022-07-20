Name : Merge
Inputs : [[0, 'inputMerge']]
Outputs : [[0, 'inputBioBloom']]
Emits : []


Name : Bloomfilter
Inputs : [[0, 'inputBioBloom']]
Outputs : [[0, 'outputBloomfilter']]
Emits : []


Name : resultBiobloom
Inputs : [[0, 'outputBloomfilter']]
Outputs : [[0, 'inputFastp']]
Emits : []


Name : runFastp
Inputs : [[0, 'inputFastp']]
Outputs : [[0, 'inputPathoscopeMap'], [1, 'fastp_logs']]
Emits : []


Name : runMultiQCFastq
Inputs : [[0, 'fastp_logs']]
Outputs : [[0, 'runMultiQCFastqOutput']]
Emits : []


Name : runPathoscopeMap
Inputs : [[0, 'inputPathoscopeMap']]
Outputs : [[0, 'inputPathoscopeId']]
Emits : []


Name : runPathoscopeId
Inputs : [[0, 'inputPathoscopeId']]
Outputs : [[0, 'outputPathoscopeId']]
Emits : []


