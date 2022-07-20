Name : fastp
Inputs : [[0, 'trim_ch']]
Outputs : [[0, 'tread1_ch'], [1, 'tread2_ch'], [2, 'fastpresult']]
Emits : []


Name : metaflye_assembly
Inputs : [[0, 'longread_ch']]
Outputs : [[0, 'assembly_result'], [1, 'graph_ch']]
Emits : []


Name : ntedit_polish
Inputs : [[0, 'tread1_ch'], [1, 'tread2_ch'], [2, 'graph_ch']]
Outputs : []
Emits : []


