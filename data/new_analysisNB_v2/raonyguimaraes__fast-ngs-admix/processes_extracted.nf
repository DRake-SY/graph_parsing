Name : convert_23andMe_to_plink
Inputs : [[0, 'genoChannel']]
Outputs : [[0, 'plinkGenotypes'], [0, 'plinkGenotypesCombine']]
Emits : []


Name : plink
Inputs : [[0, 'plinkGenotypes']]
Outputs : [[0, 'plink'], [0, 'plink2']]
Emits : []


Name : fastNGSadmix
Inputs : [[0, 'fastngsadmix']]
Outputs : [[0, 'fastngsadmix_out']]
Emits : []


Name : iAdmix
Inputs : [[0, 'iadmix']]
Outputs : [[0, 'iadmix_out']]
Emits : []


Name : table_report
Inputs : [[0, 'iadmix_out']]
Outputs : [[0, 'report']]
Emits : []


