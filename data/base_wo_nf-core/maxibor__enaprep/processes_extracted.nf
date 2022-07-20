Name : AdapterRemoval
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'fq_to_md5'], [1, 'adapter_removal_results']]
Emits : []


Name : comp_md5
Inputs : [[0, 'fq_to_md5']]
Outputs : [[0, 'registration']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'adapter_removal_results'], [2, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


