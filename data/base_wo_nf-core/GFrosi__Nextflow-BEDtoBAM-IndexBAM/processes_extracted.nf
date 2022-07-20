Name : unzipBed
Inputs : [[0, 'fileSample']]
Outputs : [[0, 'unzipbedout']]
Emits : []


Name : bedToBam
Inputs : [[0, 'unzipbedout']]
Outputs : [[0, 'bedtobamout']]
Emits : []


Name : sortedBam
Inputs : [[0, 'bedtobamout']]
Outputs : [[0, 'sortbamout']]
Emits : []


Name : indexBam
Inputs : [[0, 'sortbamout']]
Outputs : []
Emits : []


