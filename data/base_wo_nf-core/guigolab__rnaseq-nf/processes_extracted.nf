Name : genomeIndex
Inputs : [[0, 'genomeFile'], [1, 'annotationFile']]
Outputs : [[0, 'genomeIndexChannel']]
Emits : []


Name : transcriptomeIndex
Inputs : [[0, 'genomeFile'], [1, 'annotationFile']]
Outputs : [[0, 'transcriptomeIndexChannel']]
Emits : []


Name : mapping
Inputs : [[0, 'genomeIndexChannel'], [1, 'readsChannel']]
Outputs : [[0, 'genomeAlignmentsChannel'], [1, 'transcriptomeAlignmentsChannel'], [2, 'prefix']]
Emits : []


Name : quantification
Inputs : [[0, 'transcriptomeIndexChannel'], [1, 'transcriptomeAlignmentsChannel']]
Outputs : [[0, 'geneQuantificationChannel'], [1, 'isoformQuantificationChannel']]
Emits : []


Name : matrix
Inputs : [[0, 'units'], [1, 'geneQuantificationChannel']]
Outputs : [[0, 'outputMatrix']]
Emits : []


