Name : blast_swissprot
Inputs : [[0, 'query_ch']]
Outputs : [[0, 'match_ch']]
Emits : []


Name : collect
Inputs : [[0, 'match_ch']]
Outputs : [[0, 'last_leg']]
Emits : []


Name : sortSwiss
Inputs : [[0, 'last_leg']]
Outputs : [[0, 'Complete']]
Emits : []


