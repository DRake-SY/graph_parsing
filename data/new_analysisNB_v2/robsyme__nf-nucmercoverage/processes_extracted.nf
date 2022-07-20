Name : makeGenomeFiles
Inputs : [[0, 'genomes1']]
Outputs : [[0, 'genomeFiles']]
Emits : []


Name : nucmer
Inputs : [[0, 'genomePairs']]
Outputs : [[0, 'rawDeltas'], [1, 'fltDeltas']]
Emits : []


Name : showcoords
Inputs : [[0, 'rawDeltas'], [0, 'fltDeltas']]
Outputs : [[0, 'rawBed']]
Emits : []


Name : genomeCoverage
Inputs : [[0, 'rawBed']]
Outputs : [[0, 'genomeCoverages']]
Emits : []


Name : plotCoverages
Inputs : [[0, 'plottingInputs']]
Outputs : [[0, 'outputSVGs']]
Emits : []


