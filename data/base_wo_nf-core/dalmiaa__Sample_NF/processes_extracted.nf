Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'output_docs']]
Outputs : []
Emits : []


