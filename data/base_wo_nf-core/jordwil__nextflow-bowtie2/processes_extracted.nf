Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results']]
Emits : []


Name : alignment
Inputs : [[0, 'bt_indices'], [1, 'ch_read_files_trimming']]
Outputs : [[0, 'bowtie_bam'], [0, 'bowtie_bam_for_unmapped']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_fastqc_results'], [2, 'ch_software_versions_yaml'], [3, 'summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


