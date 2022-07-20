Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : longranger
Inputs : [[0, 'read_files_longranger']]
Outputs : [[0, 'longranger_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'longranger_results'], [2, 'software_versions_yaml'], [3, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


