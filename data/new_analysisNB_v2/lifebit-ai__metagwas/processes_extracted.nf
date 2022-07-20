Name : run_metal
Inputs : [[0, 'all_input_studies_ch']]
Outputs : [[0, 'results_ch']]
Emits : []


Name : mama_calculate_ldscores
Inputs : [[0, 'ch_ancestry_sample_file'], [1, 'ch_snp_ancestry_file'], [2, 'ch_merged_ref_panel']]
Outputs : [[0, 'ch_mama_ldscores']]
Emits : []


Name : run_mama
Inputs : [[0, 'ch_ss_1'], [1, 'ch_ss_2'], [2, 'ch_mama_ldscores']]
Outputs : [[0, 'ch_mama_results']]
Emits : []


