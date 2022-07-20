Name : runFastQC
Inputs : [[0, 'ReadPairsToQual']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : runMultiQC
Inputs : [[0, 'fastqc_files']]
Outputs : []
Emits : []


Name : bbduk
Inputs : [[0, 'ReadPairs'], [1, 'adapters_ref'], [2, 'artifacts_ref'], [3, 'phix174ill_ref']]
Outputs : [[0, 'filteredReadsforQC']]
Emits : []


Name : runFastQC_postfilterandtrim
Inputs : [[0, 'filteredReadsforQC']]
Outputs : [[0, 'fastqc_files_2']]
Emits : []


Name : runMultiQC_postfilterandtrim
Inputs : [[0, 'fastqc_files_2']]
Outputs : []
Emits : []


