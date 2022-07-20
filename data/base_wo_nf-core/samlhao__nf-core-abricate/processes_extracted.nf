Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'read_files_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : fastp
Inputs : [[0, 'read_files_trimming']]
Outputs : [[0, 'unicycler_ch'], [2, 'fastp_results']]
Emits : []


Name : unicycler
Inputs : [[0, 'unicycler_ch']]
Outputs : [[0, 'assembled_ch'], [1, 'quast_ch']]
Emits : []


Name : quast
Inputs : [[0, 'quast_ch']]
Outputs : [[0, 'quast_output']]
Emits : []


Name : abricate
Inputs : [[0, 'asm_ch'], [0, 'assembled_ch']]
Outputs : [[0, 'amr_ch']]
Emits : []


Name : sort_genes
Inputs : [[0, 'amr_ch']]
Outputs : []
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml'], [3, 'summary'], [4, 'fastp_results'], [5, 'quast_output']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


