Name : downloadFastQ
Inputs : [[0, 'allLines']]
Outputs : [[0, 'fastqgz']]
Emits : []


Name : downloadChr
Inputs : [[0, 'chromo']]
Outputs : [[0, 'chromofagz']]
Emits : []


Name : indexGenome
Inputs : [[0, 'chromofagz']]
Outputs : [[0, 'indexgenome']]
Emits : []


Name : downloadGtf
Inputs : []
Outputs : [[0, 'gtf']]
Emits : []


Name : mapFastQ
Inputs : [[0, 'indexgenome'], [1, 'fastqgz']]
Outputs : [[0, 'bam_indexBamFiles'], [0, 'bam_countReads']]
Emits : []


Name : indexBamFiles
Inputs : [[0, 'bam_indexBamFiles']]
Outputs : [[0, 'bamindex']]
Emits : []


Name : countReads
Inputs : [[0, 'bam_countReads'], [1, 'gtf']]
Outputs : [[0, 'counts'], [1, 'summary']]
Emits : []


Name : statAnalysis
Inputs : [[0, 'counts'], [1, 'typedata']]
Outputs : [[0, 'individuals'], [1, 'volcanoplot'], [2, 'restot'], [3, 'res']]
Emits : []


