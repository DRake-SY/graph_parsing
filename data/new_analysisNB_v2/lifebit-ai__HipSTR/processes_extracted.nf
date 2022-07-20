Name : preprocess_bam
Inputs : [[0, 'bam']]
Outputs : [[0, 'completeChannel']]
Emits : []


Name : preprocess_genome
Inputs : [[0, 'fastaToFai']]
Outputs : [[0, 'fai']]
Emits : []


Name : hipstr
Inputs : [[0, 'completeChannel'], [1, 'fastaToHipSTR'], [2, 'fai'], [3, 'bed']]
Outputs : [[0, 'results']]
Emits : []


