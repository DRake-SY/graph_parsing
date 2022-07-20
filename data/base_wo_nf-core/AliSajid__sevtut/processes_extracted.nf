Name : runMakeBlastDB
Inputs : [[0, 'genomefile_ch']]
Outputs : [[0, 'dbName_ch'], [1, 'dbDir_ch']]
Emits : []


Name : runBlast
Inputs : [[0, 'dbDir_ch'], [1, 'dbName_ch'], [2, 'queryFile_ch']]
Outputs : [[0, 'blast_output_ch']]
Emits : []


