Name : get_run_name
Inputs : []
Outputs : [[0, 'ch_run_name']]
Emits : []


Name : get_run_id
Inputs : []
Outputs : [[0, 'ch_run_id']]
Emits : []


Name : get_samples
Inputs : [[0, 'ch_run_id']]
Outputs : [[0, 'ch_samples']]
Emits : []


Name : download
Inputs : [[0, 'ch_biosamples1'], [1, 'ch_run_name1']]
Outputs : [[3, 'ch_sample_files1']]
Emits : []


Name : download_dragen
Inputs : [[0, 'ch_biosamples2'], [1, 'ch_run_name2']]
Outputs : [[3, 'ch_sample_files2']]
Emits : []


Name : collect_samples
Inputs : [[0, 'ch_run_name3'], [1, 'ch_sample_files1']]
Outputs : [[0, 'sample_file']]
Emits : []


