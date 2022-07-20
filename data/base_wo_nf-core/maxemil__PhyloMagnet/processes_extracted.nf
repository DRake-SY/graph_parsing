Name : filterRuns
Inputs : [[0, 'ids']]
Outputs : [[0, 'project_runs']]
Emits : []


Name : downloadFastQ
Inputs : [[0, 'all_runs']]
Outputs : [[0, 'fastq_files_SRA']]
Emits : []


Name : unpackRefPackage
Inputs : [[0, 'ref_packages']]
Outputs : [[0, 'local_ref_rpkg'], [1, 'local_ref_unique_rpkg'], [2, 'reference_trees_rpkg'], [3, 'tax_map_rpkg'], [4, 'eggnog_map_rpkg'], [5, 'class_rpkg']]
Emits : []


Name : includeLocalRef
Inputs : [[0, 'local_ref_include_w_rpkg'], [1, 'class_rpkg_map']]
Outputs : [[0, 'extended_eggnog_map'], [1, 'data_jar']]
Emits : []


Name : downloadEggNOG
Inputs : [[0, 'eggNOGIDs']]
Outputs : [[0, 'eggNOGFastas']]
Emits : []


Name : createMappingFiles
Inputs : [[0, 'extended_eggnog_map'], [1, 'references_fastas']]
Outputs : [[0, 'eggnog_map'], [1, 'tax_map'], [2, 'class_map'], [3, 'references_unique_fastas']]
Emits : []


Name : diamondMakeDB
Inputs : [[0, 'concatenated_references']]
Outputs : [[0, 'diamond_database']]
Emits : []


Name : alignFastQFiles
Inputs : [[0, 'fastq_files_all'], [1, 'diamond_database']]
Outputs : [[0, 'daa_files'], [1, 'diamond_align_out']]
Emits : []


Name : meganizeDAAFiles
Inputs : [[0, 'daa_files'], [1, 'eggnog_map_concat'], [2, 'data_jar_meganizer'], [3, 'megan_vmoptions_meganizer']]
Outputs : [[0, 'daa_files_meganized']]
Emits : []


Name : geneCentricAssembly
Inputs : [[0, 'daa_files_meganized'], [1, 'class_map_concat'], [2, 'data_jar_assembler'], [3, 'megan_vmoptions_assembler']]
Outputs : [[0, 'assembled_contigs']]
Emits : []


Name : translateDNAtoAA
Inputs : [[0, 'assembled_contigs']]
Outputs : [[0, 'translated_contigs']]
Emits : []


Name : alignReferences
Inputs : [[0, 'references_unique_fastas_align']]
Outputs : [[0, 'ref_alignments'], [1, 'alignment_logs']]
Emits : []


Name : buildTreefromReferences
Inputs : [[0, 'ref_alignments']]
Outputs : [[0, 'reference_trees'], [1, 'tree_logs']]
Emits : []


Name : alignQueriestoRefMSA
Inputs : [[0, 'reference_trees_combined'], [1, 'translated_contigs']]
Outputs : [[0, 'aligned_queries']]
Emits : []


Name : splitAlignmentsRefQuery
Inputs : [[0, 'aligned_queries']]
Outputs : [[0, 'aligned_queries_split']]
Emits : []


Name : placeContigsOnRefTree
Inputs : [[0, 'aligned_queries_split']]
Outputs : [[0, 'placed_contigs']]
Emits : []


Name : assignContigs
Inputs : [[0, 'placed_contigs'], [1, 'tax_map_combined']]
Outputs : [[0, 'profiles'], [1, 'assignments'], [2, 'colored_tree_svg'], [3, 'placement_tree']]
Emits : []


Name : magnetizeTrees
Inputs : [[0, 'profiles'], [1, 'lineage']]
Outputs : [[0, 'decisions'], [1, 'decision_logs']]
Emits : []


Name : visualizeDecisions
Inputs : [[0, 'decisions_concat']]
Outputs : [[0, 'decisions_visualizations'], [1, 'visualizeOut']]
Emits : []


