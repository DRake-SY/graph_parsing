Name : preprocessFASTA
Inputs : [[0, 'fasta'], [1, 'fai'], [2, 'fastagz'], [3, 'gzfai'], [4, 'gzi']]
Outputs : [[0, 'fastaChannel']]
Emits : []


Name : preprocessBAM
Inputs : [[0, 'bamChannel']]
Outputs : [[0, 'completeChannel']]
Emits : []


Name : makeExamples_with_bed
Inputs : [[0, 'all_fa_bam'], [1, 'bedfile']]
Outputs : [[0, 'examples']]
Emits : []


Name : makeExamples
Inputs : [[0, 'all_fa_bam']]
Outputs : [[0, 'examples']]
Emits : []


Name : call_variants
Inputs : [[0, 'examples'], [1, 'model']]
Outputs : [[0, 'called_variants']]
Emits : []


Name : postprocess_variants
Inputs : [[0, 'called_variants']]
Outputs : [[0, 'postout']]
Emits : []


