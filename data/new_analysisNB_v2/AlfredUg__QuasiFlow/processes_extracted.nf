Name : runfastQC
Inputs : [[0, 'read_pairs_ch_1']]
Outputs : [[0, 'fastqc_files']]
Emits : []


Name : runMultiQC
Inputs : [[0, 'fastqc_files']]
Outputs : []
Emits : []


Name : runTrimGalore
Inputs : [[0, 'read_pairs_ch_2']]
Outputs : [[0, 'adaptor_trimmed_ch']]
Emits : []


Name : runHydra
Inputs : [[0, 'read_pairs_ch_3']]
Outputs : [[0, 'cns_sequence_ch'], [1, 'dr_report_ch'], [2, 'dr_report_ch_2'], [3, 'filtered_ch']]
Emits : []


Name : runfastqcOnfiltered
Inputs : [[0, 'filtered_ch']]
Outputs : [[0, 'fastqc_files_post_filter_ch']]
Emits : []


Name : runMultiqcOnfiltered
Inputs : [[0, 'fastqc_files_post_filter_ch']]
Outputs : []
Emits : []


Name : runSierralocal
Inputs : [[0, 'cns_sequence_ch']]
Outputs : [[0, 'cns_json_ch']]
Emits : []


Name : renderReport
Inputs : [[0, 'cns_json_ch'], [1, 'dr_report_ch'], [2, 'params']]
Outputs : [[0, 'final_report_ch']]
Emits : []


