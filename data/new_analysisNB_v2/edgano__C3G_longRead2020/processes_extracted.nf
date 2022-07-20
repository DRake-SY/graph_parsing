Name : stringtie
Inputs : [[0, 'bam_ch']]
Outputs : [[0, 'stringtie_ch']]
Emits : []


Name : tablemaker
Inputs : [[0, 'stringtie_ch']]
Outputs : [[0, 'tablemaker_ch']]
Emits : []


Name : ballgown
Inputs : [[0, 'tablemaker_ch']]
Outputs : [[0, 'ballgown_ch']]
Emits : []


Name : postProduceOutputs
Inputs : [[0, 'ballgown_ch']]
Outputs : [[0, 'result_ch']]
Emits : []


