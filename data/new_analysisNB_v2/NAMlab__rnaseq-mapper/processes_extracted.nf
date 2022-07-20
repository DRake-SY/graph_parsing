Name : indexReference
Inputs : []
Outputs : [[0, 'reference_ch']]
Emits : []


Name : SRA
Inputs : [[0, 'sequences_sra_ch'], [1, 'reference_ch']]
Outputs : [[0, 'abundances_ch'], [1, 'fastqc_ch']]
Emits : []


Name : LocalPaired
Inputs : [[0, 'sequences_local_paired_ch'], [1, 'reference_ch']]
Outputs : [[0, 'abundances_local_paired_ch'], [1, 'fastqc_local_paired_ch']]
Emits : []


Name : LocalSingle
Inputs : [[0, 'sequences_local_single_ch'], [1, 'reference_ch']]
Outputs : [[0, 'abundances_local_single_ch'], [1, 'fastqc_local_single_ch']]
Emits : []


Name : combineAll
Inputs : [[0, 'abundances_ch'], [0, 'abundances_local_paired_ch'], [0, 'abundances_local_single_ch']]
Outputs : [[0, 'combined_ch']]
Emits : []


