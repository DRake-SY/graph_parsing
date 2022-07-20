Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : porechop
Inputs : [[0, 'files']]
Outputs : [[0, 'files_porechop'], [1, 'files_nanoplot_raw']]
Emits : []


Name : filtlong
Inputs : [[0, 'files_porechop']]
Outputs : [[0, 'files_lr_filtered'], [1, 'files_nanoplot_filtered']]
Emits : []


Name : nanoplot
Inputs : [[0, 'files_nanoplot_raw'], [0, 'files_nanoplot_filtered']]
Outputs : [[3, 'stats_lr']]
Emits : []


Name : fastqc
Inputs : [[0, 'files_to_fastqc']]
Outputs : [[0, 'fastqc_results'], [1, 'files_to_seqpurge']]
Emits : []


Name : seqpurge
Inputs : [[0, 'files_to_seqpurge']]
Outputs : [[0, 'files_purged'], [1, 'stats_sr']]
Emits : []


Name : sample_shortreads
Inputs : [[0, 'files_purged']]
Outputs : [[0, 'files_filtered']]
Emits : []


Name : miniasm
Inputs : [[0, 'files_pre_miniasm']]
Outputs : [[0, 'files_nocon_miniasm'], [1, 'assembly_graph_miniasm']]
Emits : []


Name : unicycler
Inputs : [[0, 'files_pre_unicycler']]
Outputs : [[0, 'assembly_unicycler'], [1, 'assembly_graph_unicycler']]
Emits : []


Name : wtdbg
Inputs : [[0, 'files_pre_wtdbg2']]
Outputs : [[0, 'files_nocon_wtdbg2']]
Emits : []


Name : racon
Inputs : [[0, 'files_nocon_miniasm'], [0, 'files_nocon_wtdbg2']]
Outputs : [[0, 'files_unpolished_racon']]
Emits : []


Name : pilon
Inputs : [[0, 'files_pilon']]
Outputs : [[0, 'assembly_pilon']]
Emits : []


Name : draw_assembly_graph
Inputs : [[0, 'assembly_graph_unicycler'], [0, 'assembly_graph_miniasm']]
Outputs : []
Emits : []


Name : quast
Inputs : [[0, 'asm_quast']]
Outputs : [[0, 'quast_results']]
Emits : []


Name : format_final_output
Inputs : [[0, 'asm_format']]
Outputs : [[0, 'final_files'], [1, 'final_files_plasmident']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'fastqc_results'], [2, 'software_versions_yaml'], [3, 'quast_results'], [4, 'summary']]
Outputs : [[0, 'multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs']]
Outputs : []
Emits : []


