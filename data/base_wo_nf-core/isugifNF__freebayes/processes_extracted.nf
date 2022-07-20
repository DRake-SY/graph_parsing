Name : createFastaIndex
Inputs : [[0, 'genome_samtools']]
Outputs : [[0, 'freebayes_fai'], [1, 'freebayes_fai2']]
Emits : []


Name : createIntervals
Inputs : [[0, 'freebayes_fai2']]
Outputs : [[0, 'freebayes_regions']]
Emits : []


Name : runFreebayes
Inputs : [[0, 'freebayes_fai'], [1, 'genome_freebayes'], [2, 'freebayes_regions']]
Outputs : [[0, 'window_vcf']]
Emits : []


Name : combineVCF
Inputs : [[0, 'window_vcf']]
Outputs : []
Emits : []


