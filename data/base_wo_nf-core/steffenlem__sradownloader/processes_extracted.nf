Name : configuration
Inputs : []
Outputs : [[0, 'config_status']]
Emits : []


Name : get_software_versions
Inputs : [[0, 'config_status']]
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : prefetch
Inputs : [[0, 'config_status'], [2, 'ngc_file']]
Outputs : [[0, 'sra_files']]
Emits : []


Name : fasterqdump
Inputs : [[0, 'sra_files'], [1, 'ngc_file']]
Outputs : [[0, 'fastq_files']]
Emits : []


Name : sort_fastq_files
Inputs : [[0, 'fastq_files']]
Outputs : [[0, 'outfiles']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


