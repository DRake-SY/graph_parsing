Name : sampleSeq
Inputs : [[0, 'ch_raw_reads_seqtk']]
Outputs : [[0, 'md5']]
Emits : []


Name : md5sum
Inputs : [[0, 'md5']]
Outputs : [[0, 'md5cat']]
Emits : []


Name : md5sum_collect
Inputs : [[0, 'md5cat']]
Outputs : []
Emits : []


