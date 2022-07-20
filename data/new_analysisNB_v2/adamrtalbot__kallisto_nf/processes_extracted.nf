Name : makeReference
Inputs : [[0, 'cdna_fasta']]
Outputs : [[0, 'kallisto_index']]
Emits : []


Name : quantReads
Inputs : [[0, 'kallisto_index'], [1, 'read_pairs']]
Outputs : [[0, 'kallist_out']]
Emits : []


Name : tximport
Inputs : [[0, 'kallist_out']]
Outputs : [[0, 'kallisto_gathered']]
Emits : []


