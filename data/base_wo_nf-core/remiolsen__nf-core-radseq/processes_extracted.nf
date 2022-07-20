Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : trimmomatic
Inputs : [[0, 'read_files_trim']]
Outputs : [[0, 'trimP_files'], [1, 'trim_logs']]
Emits : []


Name : process_radtags
Inputs : [[0, 'trimP_files']]
Outputs : [[1, 'processed_reads'], [1, 'read_files_fastqc'], [2, 'population_names'], [2, 'fastqc_names']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc'], [1, 'fastqc_names']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : denovo_stacks
Inputs : [[0, 'processed_reads'], [1, 'run_params'], [2, 'population_names']]
Outputs : [[0, 'denovo_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_config'], [1, 'fastqc_results'], [2, 'trim_logs'], [3, 'denovo_results'], [4, 'software_versions_yaml']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'output_docs']]
Outputs : []
Emits : []


