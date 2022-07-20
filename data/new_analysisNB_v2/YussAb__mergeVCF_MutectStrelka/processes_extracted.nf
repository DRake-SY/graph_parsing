Name : illuminaMerge_snvIndels
Inputs : [[0, 'samples_ch1']]
Outputs : [[0, 'illuminamerge_ch']]
Emits : []


Name : mutect_preprocess
Inputs : [[0, 'samples_ch2']]
Outputs : [[0, 'mutectprocessed_ch']]
Emits : []


Name : combineVCF
Inputs : [[0, 'samples_ch3'], [1, 'mutectprocessed_ch'], [2, 'illuminamerge_ch']]
Outputs : [[0, 'combinevcf_ch']]
Emits : []


Name : dataNormalization
Inputs : [[0, 'combinevcf_ch'], [1, 'samples_ch4']]
Outputs : [[0, 'normalized_ch']]
Emits : []


