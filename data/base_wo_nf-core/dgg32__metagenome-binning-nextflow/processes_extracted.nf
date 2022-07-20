Name : fastp
Inputs : [[0, 'read_pairs']]
Outputs : [[0, 'fastp_out_ch']]
Emits : []


Name : megahit
Inputs : [[0, 'fastp_out_ch']]
Outputs : [[0, 'megahit_result_ch']]
Emits : []


Name : maxbin
Inputs : [[0, 'megahit_result_ch']]
Outputs : [[0, 'maxbin_result_ch']]
Emits : []


Name : checkm
Inputs : [[0, 'maxbin_result_ch']]
Outputs : [[0, 'checkm_result_ch']]
Emits : []


