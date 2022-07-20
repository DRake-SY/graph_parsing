Name : scatterPhenotypes
Inputs : [[0, 'ch_pheno']]
Outputs : [[0, 'traits']]
Emits : []


Name : filterGenotypes
Inputs : [[0, 'ch_geno'], [1, 'ch_traitsplit']]
Outputs : [[0, 'ch_filtered']]
Emits : []


Name : runGWAS
Inputs : [[0, 'ch_filtered']]
Outputs : [[0, 'ch_pvals']]
Emits : []


Name : plotGWAS
Inputs : [[0, 'ch_pvals']]
Outputs : [[0, 'ch_plots']]
Emits : []


