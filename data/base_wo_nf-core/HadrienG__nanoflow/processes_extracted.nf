Name : adapter_trimming
Inputs : []
Outputs : [[0, 'trimmed_reads']]
Emits : []


Name : assembly
Inputs : [[0, 'trimmed_for_assembly']]
Outputs : [[0, 'assembly']]
Emits : []


Name : consensus
Inputs : [[0, 'trimmed_for_consensus'], [1, 'assembly']]
Outputs : [[0, 'assembly_consensus']]
Emits : []


Name : polishing
Inputs : [[0, 'assembly_consensus'], [2, 'params']]
Outputs : [[0, 'assembly_polished']]
Emits : []


