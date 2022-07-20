Name : makeEsd
Inputs : [[0, 'params']]
Outputs : [[0, 'targets_esd']]
Emits : []


Name : makeEsi
Inputs : [[0, 'targets_esd'], [1, 'params']]
Outputs : [[0, 'targets_esi']]
Emits : []


Name : exonerate
Inputs : [[0, 'proteins'], [1, 'targets_esd'], [2, 'params'], [3, 'targets_esi']]
Outputs : [[0, 'alignments_ch']]
Emits : []


Name : makeGff
Inputs : [[0, 'alignments_ch']]
Outputs : [[0, 'fixed_ch']]
Emits : []


Name : makeResult
Inputs : [[0, 'results']]
Outputs : []
Emits : []


