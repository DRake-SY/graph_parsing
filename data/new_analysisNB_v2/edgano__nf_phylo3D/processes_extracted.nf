Name : run_fastme_tmalign
Inputs : [[0, 'phySeqs']]
Outputs : [[0, 'replicatesOut'], [1, 'newickOut']]
Emits : []


Name : phylo3d_unweighted_d1_ratio
Inputs : [[0, 'fastaSeqs'], [1, 'templates'], [2, 'pdbFiles']]
Outputs : [[0, 'treesOut'], [1, 'matrixOut']]
Emits : []


Name : extr_fastme_per_family_D1_unweighted
Inputs : [[0, 'matrixOut']]
Outputs : [[0, 'splitMatrix']]
Emits : []


Name : fastme_matrices
Inputs : [[0, 'splitMatrix']]
Outputs : [[0, 'matricesOut']]
Emits : []


