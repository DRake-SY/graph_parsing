Name : coverage
Inputs : [[0, 'bam'], [1, 'bed']]
Outputs : [[0, 'coverage']]
Emits : []


Name : mean
Inputs : [[0, 'coverage']]
Outputs : [[0, 'average']]
Emits : []


Name : plot
Inputs : [[0, 'all_average']]
Outputs : []
Emits : []


