Name : preprocess_bam
Inputs : [[0, 'bam']]
Outputs : [[0, 'completeChannel']]
Emits : []


Name : expansion_hunter
Inputs : [[0, 'completeChannel'], [1, 'fasta'], [2, 'repeat_specs']]
Outputs : [[0, 'results']]
Emits : []


