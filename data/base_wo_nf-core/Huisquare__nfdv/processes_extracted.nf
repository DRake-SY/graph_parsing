Name : preprocessFASTA
Inputs : [[0, 'fasta']]
Outputs : [[0, 'fastaChannel']]
Emits : []


Name : preprocessBAM
Inputs : [[0, 'bamChannel']]
Outputs : [[0, 'completeChannel']]
Emits : []


Name : makeExamples
Inputs : [[0, 'all_fa_bam']]
Outputs : [[0, 'examples']]
Emits : []


Name : call_variants
Inputs : [[0, 'examples']]
Outputs : [[0, 'called_variants']]
Emits : []


Name : postprocess_variants
Inputs : [[0, 'called_variants']]
Outputs : [[0, 'postout']]
Emits : []


