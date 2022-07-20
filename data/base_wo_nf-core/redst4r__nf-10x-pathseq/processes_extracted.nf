Name : pathseqfilter
Inputs : []
Outputs : [[0, 'unpairedbam_filter']]
Emits : []


Name : pathseqbwa
Inputs : [[0, 'unpairedbam_filter']]
Outputs : [[0, 'bwabam']]
Emits : []


Name : pathseqscore
Inputs : [[0, 'bwabam']]
Outputs : []
Emits : []


