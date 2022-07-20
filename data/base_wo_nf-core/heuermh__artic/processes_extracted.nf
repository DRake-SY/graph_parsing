Name : CHECK_SAMPLESHEET
Inputs : [[0, 'ch_input']]
Outputs : [[0, 'ch_samplesheet_reformat']]
Emits : []


Name : FASTQC
Inputs : [[0, 'ch_reads_fastqc']]
Outputs : [[0, 'ch_fastqc_reports_mqc']]
Emits : []


Name : NANOPLOT
Inputs : [[0, 'ch_reads_nanoplot']]
Outputs : []
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : MULTIQC
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_reports_mqc'], [3, 'ch_software_versions_yaml'], [4, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


