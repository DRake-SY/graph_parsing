Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml'], [3, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


Name : trim_galore
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, ''], [1, ''], [2, 'trimming_logs']]
Emits : []


Name : megahit
Inputs : [[0, 'trimmed_fwdreads_megahit'], [1, 'trimmed_revreads_megahit']]
Outputs : []
Emits : []


Name : trinity
Inputs : [[0, 'trimmed_fwdreads_trinity'], [1, 'trimmed_revreads_trinity']]
Outputs : []
Emits : []


