Name : Genotypelikelihoods
Inputs : [[0, 'bams_ch']]
Outputs : [[0, 'GL_ch']]
Emits : []


Name : NGSadmix
Inputs : [[0, 'GL_ch1'], [1, 'k_list']]
Outputs : [[0, 'admixture_ch']]
Emits : []


Name : PCAngsd
Inputs : [[0, 'GL_ch2']]
Outputs : [[0, 'covariance_ch']]
Emits : []


Name : NGSadmix_plot
Inputs : [[0, 'k_list'], [1, 'admix_comb']]
Outputs : []
Emits : []


Name : PCAngsd_plot
Inputs : [[0, 'covariance_comb']]
Outputs : []
Emits : []


