Name : software_check
Inputs : []
Outputs : []
Emits : []


Name : runMakeBlastDB
Inputs : [[0, 'genomefile']]
Outputs : [[0, 'dbName_ch'], [1, 'dbDir_ch']]
Emits : []


Name : runBlast
Inputs : [[0, 'Query_chunks'], [1, 'dbDir_ch'], [2, 'dbName_ch']]
Outputs : [[0, 'blast_output']]
Emits : []


