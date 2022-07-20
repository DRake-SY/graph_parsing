Name : porechop
Inputs : [[0, 'files_preprocessing']]
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


Name : seqpurge
Inputs : [[0, 'files_to_seqpurge']]
Outputs : [[0, 'files_purged'], [1, 'stats_sr']]
Emits : []


Name : sample_shortreads
Inputs : [[0, 'files_purged']]
Outputs : [[0, 'files_filtered']]
Emits : []


Name : unicycler
Inputs : [[0, 'files_pre_unicycler']]
Outputs : [[0, 'assembly_unicycler'], [1, 'assembly_graph_unicycler']]
Emits : []


Name : spades
Inputs : [[0, 'files_pre_spades']]
Outputs : [[0, 'files_spades'], [1, 'assembly_spades_simple'], [3, 'assembly_graph_spades']]
Emits : []


Name : links_scaffolding
Inputs : [[0, 'files_spades']]
Outputs : [[0, 'files_links']]
Emits : []


Name : gapfiller
Inputs : [[0, 'files_links']]
Outputs : [[0, 'assembly_gapfiller']]
Emits : []


Name : canu_parameters
Inputs : []
Outputs : [[0, 'canu_settings']]
Emits : []


Name : canu
Inputs : [[0, 'files_pre_canu'], [1, 'canu_settings']]
Outputs : [[0, 'files_unpolished_canu'], [2, 'assembly_graph_canu']]
Emits : []


Name : miniasm
Inputs : [[0, 'files_pre_miniasm']]
Outputs : [[0, 'files_noconsensus'], [1, 'assembly_graph_miniasm']]
Emits : []


Name : racon
Inputs : [[0, 'files_noconsensus']]
Outputs : [[0, 'files_unpolished_racon']]
Emits : []


Name : flye
Inputs : [[0, 'files_pre_flye']]
Outputs : [[0, 'files_unpolished_flye'], [2, 'assembly_graph_flye']]
Emits : []


Name : pilon
Inputs : [[0, 'files_pilon']]
Outputs : [[0, 'assembly_pilon']]
Emits : []


Name : draw_assembly_graph
Inputs : [[0, 'assembly_graph_spades'], [0, 'assembly_graph_unicycler'], [0, 'assembly_graph_flye'], [0, 'assembly_graph_miniasm'], [0, 'assembly_graph_canu']]
Outputs : []
Emits : []


Name : format_final_output
Inputs : [[0, 'assembly_merged']]
Outputs : [[0, 'final_files'], [1, 'final_files_plasmident']]
Emits : []


Name : per_sample_stats
Inputs : [[0, 'to_sample_stats']]
Outputs : []
Emits : []


