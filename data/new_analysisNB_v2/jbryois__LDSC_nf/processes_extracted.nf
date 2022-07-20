Name : Split_input_beds_per_chr
Inputs : [[0, 'bedfiles']]
Outputs : [[0, 'InputBedsPerChr']]
Emits : []


Name : Get_LD_scores
Inputs : [[0, 'ch_chr']]
Outputs : [[0, 'LDscores']]
Emits : []


Name : Get_pLDSC_Results
Inputs : [[0, 'LDscores_join']]
Outputs : [[0, '']]
Emits : []


Name : Clean_results_h2_enrichment
Inputs : [[0, 'Results_ch_h2']]
Outputs : [[0, 'CleanResultsH2']]
Emits : []


Name : Clean_results_tissue_association
Inputs : [[0, 'Results_ch_tissue']]
Outputs : [[0, 'CleanResultsZ']]
Emits : []


