Name : bamcaller
Inputs : [[0, 'bamfiles_ch'], [1, 'params'], [2, 'scaffolds_bamcaller_ch'], [3, 'params'], [4, 'params']]
Outputs : [[0, 'mask_indiv'], [1, 'vcf_bamcalled']]
Emits : []


Name : multihet_single
Inputs : [[0, 'params'], [1, 'multihet_in']]
Outputs : [[0, 'msmc_in']]
Emits : []


Name : msmc
Inputs : [[0, 'params'], [1, 'msmc_in']]
Outputs : []
Emits : []


