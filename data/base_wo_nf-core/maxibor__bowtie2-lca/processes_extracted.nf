Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results']]
Emits : []


Name : AdapterRemoval
Inputs : [[0, 'ch_read_files_trimming']]
Outputs : [[0, 'trimmed_reads'], [1, 'adapter_removal_results_multiqc']]
Emits : []


Name : bowtie2index
Inputs : [[0, 'fasta_ref']]
Outputs : [[0, 'bowtie_db'], [1, 'bt_db_name']]
Emits : []


Name : bowtie2
Inputs : [[0, 'trimmed_reads'], [1, 'bowtie_db'], [2, 'bt_db_name']]
Outputs : [[0, 'aligned_bam']]
Emits : []


Name : prep_lca_databases
Inputs : []
Outputs : [[0, 'ete_taxo_db']]
Emits : []


Name : check_ete_db
Inputs : []
Outputs : [[0, 'ete_checked']]
Emits : []


Name : sam2lca
Inputs : [[0, 'sam2lca_ch']]
Outputs : [[0, 'sam2lca_result']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_results'], [3, 'ch_software_versions_yaml'], [4, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


