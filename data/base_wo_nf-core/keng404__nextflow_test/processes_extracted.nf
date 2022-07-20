Name : unzip
Inputs : [[0, 'input_data']]
Outputs : [[0, 'raw_reads']]
Emits : []


Name : remap_to_hla
Inputs : [[0, 'params'], [1, 'input_data']]
Outputs : [[0, 'fished_reads'], [1, 'fished_reads_bai']]
Emits : []


Name : make_ot_config
Inputs : []
Outputs : [[0, 'config']]
Emits : []


Name : pre_map_hla
Inputs : [[0, 'params'], [1, 'raw_reads']]
Outputs : [[0, 'fished_reads'], [1, 'fished_reads_bai']]
Emits : []


Name : run_optitype
Inputs : [[0, 'config'], [1, 'fished_reads'], [2, 'fished_reads_index']]
Outputs : [[0, 'optitype_results_ch']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_software_versions_yaml'], [3, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


