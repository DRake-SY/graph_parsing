Name : preprocess_genome
Inputs : [[0, 'fasta'], [1, 'fai'], [2, 'fastagz'], [3, 'gzfai'], [4, 'gzi']]
Outputs : [[0, 'fastaChannel']]
Emits : []


Name : preprocess_bam
Inputs : [[0, 'bamChannel'], [1, 'fastaChannel']]
Outputs : [[0, 'completeChannel']]
Emits : []


Name : run_variant_caller
Inputs : [[0, 'all_fa_bam']]
Outputs : [[0, 'methods_result']]
Emits : []


