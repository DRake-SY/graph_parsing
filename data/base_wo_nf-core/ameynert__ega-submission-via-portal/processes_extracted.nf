Name : encrypt
Inputs : [[0, 'ch_read_files']]
Outputs : [[0, 'ch_runs_csv_output'], [1, 'ch_upload_input']]
Emits : []


Name : collect_runs_csv
Inputs : [[0, 'ch_runs_csv_output']]
Outputs : [[0, 'runs']]
Emits : []


Name : upload
Inputs : [[0, 'ch_upload_input']]
Outputs : []
Emits : []


