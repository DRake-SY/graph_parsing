Name : sRNA_Detect
Inputs : [[0, 'alignmentFileList'], [1, 'indexFileList']]
Outputs : [[0, 'sRNADetected']]
Emits : []


Name : sort_sRNA
Inputs : [[0, 'sRNADetected'], [1, 'rawGenomeAnnotation']]
Outputs : [[0, 'sort_sRNA'], [1, 'annotatedTranscript']]
Emits : []


Name : filter_sorted_sRNA
Inputs : [[0, 'sort_sRNA'], [1, 'annotatedTranscript']]
Outputs : [[0, 'overlapped_sRNA']]
Emits : []


Name : separate_overlapped_sRNA
Inputs : [[0, 'overlapped_sRNA'], [1, 'annotatedTranscript']]
Outputs : []
Emits : []


