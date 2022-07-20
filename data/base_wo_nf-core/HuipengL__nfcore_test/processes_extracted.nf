Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_results'], [3, 'ch_software_versions_yaml'], [4, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


