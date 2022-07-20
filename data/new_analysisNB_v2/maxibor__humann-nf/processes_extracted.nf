Name : prepare_humann_db
Inputs : []
Outputs : [[0, 'humann_finished']]
Emits : []


Name : build_metaphlan_db
Inputs : []
Outputs : [[0, 'mpa_db_path_wait']]
Emits : []


Name : AdapterRemoval
Inputs : [[0, 'reads_to_trim']]
Outputs : [[0, ''], [1, 'adapter_removal_results_multiqc']]
Emits : []


Name : metaphlan
Inputs : [[0, 'trimmed_reads_mpa'], [1, 'mpa_db_path_wait']]
Outputs : [[0, 'metaphlan_out'], [1, 'bt2_log']]
Emits : []


Name : humann
Inputs : [[0, 'humann_ch'], [1, 'chocophlanDB'], [2, 'unirefDB']]
Outputs : [[0, 'humann_results']]
Emits : []


