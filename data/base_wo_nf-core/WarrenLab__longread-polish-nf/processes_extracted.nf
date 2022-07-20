Name : faidx
Inputs : [[0, 'reference']]
Outputs : [[0, 'referenceFaidx']]
Emits : []


Name : align
Inputs : [[0, 'reference'], [1, 'readsToAlign']]
Outputs : [[0, 'aligned']]
Emits : []


Name : mergeBams
Inputs : [[0, 'aligned']]
Outputs : [[0, 'alignedAll'], [1, 'alignedAllBai']]
Emits : []


Name : racon
Inputs : [[0, 'contigsRefBam'], [1, 'reference']]
Outputs : [[0, 'corrected']]
Emits : []


Name : catContigs
Inputs : [[0, 'corrected']]
Outputs : [[0, 'correctedCatted']]
Emits : []


