Name : VCFgz
Inputs : [[0, 'BedBimFam']]
Outputs : [[0, 'convertedVcfgzFromBedBimFam']]
Emits : []


Name : Bgzip
Inputs : [[0, 'Vcf']]
Outputs : [[0, 'convertedVcfgzFromVcf']]
Emits : []


Name : splitChromosome
Inputs : [[0, 'NonSplittedVcfgz']]
Outputs : [[0, 'SplittedVcfgzFromNonSplitted']]
Emits : []


Name : decomposeNormalizeAnnotate
Inputs : [[0, 'DatasetChunks']]
Outputs : [[0, 'AnnotatedVCFChunks']]
Emits : []


Name : geminiLoad
Inputs : [[0, 'AnnotatedVCFChunks']]
Outputs : [[0, 'DBChunks']]
Emits : []


