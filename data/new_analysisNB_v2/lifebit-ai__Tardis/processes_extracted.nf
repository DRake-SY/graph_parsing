Name : preprocess_bam
Inputs : [[0, 'bam']]
Outputs : [[0, 'completeChannel']]
Emits : []


Name : tardis
Inputs : [[0, 'completeChannel'], [1, 'ref'], [2, 'sonic']]
Outputs : [[0, 'results']]
Emits : []


