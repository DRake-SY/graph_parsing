Name : create_files
Inputs : [[0, 'file_create']]
Outputs : [[0, 'text_files']]
Emits : []


Name : txt_to_csv
Inputs : [[0, 'text_files']]
Outputs : [[0, 'csv_files']]
Emits : []


Name : csv_to_tsv
Inputs : [[0, 'csv_files']]
Outputs : [[0, 'tsv_files']]
Emits : []


Name : tsv_to_psv
Inputs : [[0, 'tsv_files']]
Outputs : [[0, 'psv_files']]
Emits : []


Name : merge
Inputs : [[0, 'psv_files']]
Outputs : [[0, 'result']]
Emits : []


Name : test_mount
Inputs : [[0, 'result']]
Outputs : [[0, 'fin_res']]
Emits : []


