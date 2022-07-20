Name : calc_basic_features_mq
Inputs : [[0, 'result_file']]
Outputs : [[0, 'all_features_ch1'], [1, 'all_features_ch2'], [2, 'all_features_ch3'], [3, 'all_features_ch4']]
Emits : []


Name : xml2mzid
Inputs : [[0, 'result_file']]
Outputs : [[0, 'mzid_file']]
Emits : []


Name : calc_basic_features_xt
Inputs : [[0, 'mzid_file'], [1, 'spectrum_file']]
Outputs : [[0, 'all_features_ch1'], [1, 'all_features_ch2'], [2, 'all_features_ch3'], [3, 'all_features_ch4']]
Emits : []


Name : calc_basic_features
Inputs : [[0, 'result_file'], [1, 'spectrum_file']]
Outputs : [[0, 'all_features_ch1'], [1, 'all_features_ch2'], [2, 'all_features_ch3'], [3, 'all_features_ch4']]
Emits : []


Name : pga_fdr_control
Inputs : [[0, 'all_features_ch1']]
Outputs : [[0, 'pga_results_ch'], [1, 'pga_results_ch2'], [2, 'pga_results_ch3']]
Emits : []


Name : generate_train_prediction_data
Inputs : [[0, 'all_features_ch2'], [1, 'pga_results_ch']]
Outputs : [[0, 'pDeep2_prediction_ch'], [1, 'autoRT_train_ch'], [2, 'autoRT_prediction_ch']]
Emits : []


Name : run_pdeep2
Inputs : [[0, 'pDeep2_prediction_ch']]
Outputs : [[0, 'pDeep2_results_ch']]
Emits : []


Name : process_pDeep2_results
Inputs : [[0, 'pga_results_ch2'], [1, 'spectrum_file'], [2, 'pDeep2_results_ch']]
Outputs : [[0, 'similarity_ch'], [1, 'pDee2_next_ch']]
Emits : []


Name : train_autoRT
Inputs : [[0, 'pDee2_next_ch'], [1, 'autoRT_train_ch']]
Outputs : [[0, 'model_prediction_ch']]
Emits : []


Name : predicte_autoRT
Inputs : [[0, 'autoRT_prediction_ch'], [1, 'autoRT_models_folder']]
Outputs : [[0, 'autoRT_results_ch']]
Emits : []


Name : generate_percolator_input
Inputs : [[0, 'all_features_ch3'], [1, 'pga_results_ch3'], [2, 'autoRT_results_ch'], [3, 'similarity_ch']]
Outputs : [[0, 'percolator_input_ch'], [1, 'percolator_input_ch2']]
Emits : []


Name : run_percolator
Inputs : [[0, 'percolator_input_ch']]
Outputs : [[0, 'percolator_output_ch']]
Emits : []


Name : generate_pdv_input
Inputs : [[0, 'percolator_output_ch'], [1, 'all_features_ch4'], [2, 'percolator_input_ch2']]
Outputs : [[0, 'pdv_input_ch']]
Emits : []


