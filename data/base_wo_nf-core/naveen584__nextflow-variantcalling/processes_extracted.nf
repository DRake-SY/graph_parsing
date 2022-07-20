Name : genomePreparation
Inputs : [[0, 'g']]
Outputs : [[0, 'genome_dir']]
Emits : []


Name : runStar
Inputs : [[0, 'genome_dir_1'], [1, 'r1'], [2, 'r2']]
Outputs : [[0, 'star_rundir']]
Emits : []


Name : runGatk
Inputs : [[0, 'genome_dir_2'], [1, 'star_rundir']]
Outputs : [[0, 'bam'], [1, 'metrics'], [2, 'variants'], [3, 'indels']]
Emits : []


