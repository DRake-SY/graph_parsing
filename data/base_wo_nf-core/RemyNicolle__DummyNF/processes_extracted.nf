Name : buildIndex
Inputs : [[0, 'params'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'index_ch']]
Emits : []


Name : doSTAR
Inputs : [[0, 'index_ch'], [1, 'samples_ch']]
Outputs : [[0, 'bam_ch'], [1, 'starlog_ch']]
Emits : []


Name : CountNagreg
Inputs : [[0, 'index_ch'], [1, 'bam_ch'], [2, 'starlog_ch'], [3, 'params']]
Outputs : [[0, 'countout'], [1, 'seqsumout'], [2, 'annotout']]
Emits : []


