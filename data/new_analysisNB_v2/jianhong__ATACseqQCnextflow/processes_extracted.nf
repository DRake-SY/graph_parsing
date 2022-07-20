Name : runFastQCOriginal
Inputs : [[0, 'readPairsFastQCOriginal']]
Outputs : [[0, 'fastqcOutputOriginal']]
Emits : []


Name : runTrimming
Inputs : [[0, 'readPairsForTrim']]
Outputs : [[0, 'readPairsTrimmed'], [1, 'trim_galoreOut']]
Emits : []


Name : runBWA_1
Inputs : [[0, 'readPairsTrimmed4BWA']]
Outputs : [[0, 'mappedFiles']]
Emits : []


Name : runBlast
Inputs : [[0, 'readPairsTrimmed4blast']]
Outputs : [[0, 'blastnFiles']]
Emits : []


Name : runBWA
Inputs : [[0, 'mappedFiles4MACS2']]
Outputs : [[0, 'macs2'], [1, 'bedgraph']]
Emits : []


Name : runBigWig
Inputs : [[0, 'bedgraph']]
Outputs : [[0, 'bigwig']]
Emits : []


Name : runATACseqQC
Inputs : [[0, 'mappedFiles4ATACseqQC']]
Outputs : [[0, 'ATACseqQCout'], [1, 'ATACseqQCbam']]
Emits : []


