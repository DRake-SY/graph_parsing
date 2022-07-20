Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : SRAdb
Inputs : [[0, 'keyword_channel'], [1, 'sradb_file']]
Outputs : [[0, 'prefiltered_runs']]
Emits : []


Name : keyword_filtering
Inputs : [[0, 'prefiltered_runs'], [1, 'blacklist_file'], [2, 'classes_keywords_file']]
Outputs : [[0, 'outfiles']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


