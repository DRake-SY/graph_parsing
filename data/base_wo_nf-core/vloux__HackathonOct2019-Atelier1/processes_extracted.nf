Name : seqkit1
Inputs : [[0, 'data1']]
Outputs : [[0, 'id']]
Emits : []


Name : mergefastq
Inputs : [[0, 'data3']]
Outputs : [[0, 'out_mergefastq_ch']]
Emits : []


Name : seqkit2
Inputs : [[0, 'out_mergefastq_ch']]
Outputs : [[0, 'id']]
Emits : []


