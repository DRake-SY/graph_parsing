OPERATION_1 string : lineage = Channel.from(lineage_list)
OPERATION_1 origin : [['lineage_list', 'V']]
OPERATION_1 gives  : [['lineage', 'P']]


OPERATION_2 string : Channel.from(file(params.megan_vmoptions)).into { megan_vmoptions_meganizer; megan_vmoptions_assembler }
OPERATION_2 origin : []
OPERATION_2 gives  : [['megan_vmoptions_meganizer', 'P'], ['megan_vmoptions_assembler', 'P']]


OPERATION_3 string : local_ref_save.subscribe{ it.copyTo("${params.reference_dir}/${it.simpleName}/${it.simpleName}.fasta") }
OPERATION_3 origin : [['local_ref_save', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : local_ref_include = local_ref_include_raw.ifEmpty("execute anyway")
OPERATION_4 origin : [['local_ref_include_raw', 'P']]
OPERATION_4 gives  : [['local_ref_include', 'P']]


OPERATION_5 string : all_runs = project_runs.flatMap {it -> it.readLines() }
OPERATION_5 origin : [['project_runs', 'P']]
OPERATION_5 gives  : [['all_runs', 'P']]


OPERATION_6 string : fastq_files_all = fastq_files.mix(fastq_files_SRA)
OPERATION_6 origin : [['fastq_files', 'P'], ['fastq_files_SRA', 'P']]
OPERATION_6 gives  : [['fastq_files_all', 'P']]


OPERATION_7 string : local_ref_include_w_rpkg = local_ref_include.mix(local_ref_rpkg)
OPERATION_7 origin : [['local_ref_include', 'P'], ['local_ref_rpkg', 'P']]
OPERATION_7 gives  : [['local_ref_include_w_rpkg', 'P']]


OPERATION_8 string : class_rpkg.into{class_rpkg_map_raw; class_rpkg_concat}
OPERATION_8 origin : [['class_rpkg', 'P']]
OPERATION_8 gives  : [['class_rpkg_map_raw', 'P'], ['class_rpkg_concat', 'P']]


OPERATION_9 string : class_rpkg_map = class_rpkg_map_raw.ifEmpty("execute anyway")
OPERATION_9 origin : [['class_rpkg_map_raw', 'P']]
OPERATION_9 gives  : [['class_rpkg_map', 'P']]


OPERATION_10 string : data_jar.into{data_jar_meganizer; data_jar_assembler}
OPERATION_10 origin : [['data_jar', 'P']]
OPERATION_10 gives  : [['data_jar_meganizer', 'P'], ['data_jar_assembler', 'P']]


OPERATION_11 string : references_fastas = eggNOGFastas.mix(local_ref_map)
OPERATION_11 origin : [['eggNOGFastas', 'P'], ['local_ref_map', 'P']]
OPERATION_11 gives  : [['references_fastas', 'P']]


OPERATION_12 string : tax_map_combined = tax_map.mix(tax_map_rpkg)
OPERATION_12 origin : [['tax_map', 'P'], ['tax_map_rpkg', 'P']]
OPERATION_12 gives  : [['tax_map_combined', 'P']]


OPERATION_13 string : references_unique_fastas.into{references_unique_fastas_align; references_unique_fastas_concat_raw}
OPERATION_13 origin : [['references_unique_fastas', 'P']]
OPERATION_13 gives  : [['references_unique_fastas_align', 'P'], ['references_unique_fastas_concat_raw', 'P']]


OPERATION_14 string : references_unique_fastas_concat = references_unique_fastas_concat_raw.mix(local_ref_unique_rpkg)
OPERATION_14 origin : [['references_unique_fastas_concat_raw', 'P'], ['local_ref_unique_rpkg', 'P']]
OPERATION_14 gives  : [['references_unique_fastas_concat', 'P']]


OPERATION_15 string : concatenated_references = references_unique_fastas_concat.collectFile(name: 'references.fasta', storeDir: params.reference_dir)
OPERATION_15 origin : [['references_unique_fastas_concat', 'P']]
OPERATION_15 gives  : [['concatenated_references', 'P']]


OPERATION_16 string : eggnog_map_concat = eggnog_map.mix(eggnog_map_rpkg).collectFile(name: 'eggnog.syn', storeDir: params.reference_dir)
OPERATION_16 origin : [['eggnog_map', 'P'], ['eggnog_map_rpkg', 'P']]
OPERATION_16 gives  : [['eggnog_map_concat', 'P']]


OPERATION_17 string : class_map_concat = class_map.mix(class_rpkg_concat).collectFile(name: 'class.map', storeDir: params.reference_dir)
OPERATION_17 origin : [['class_map', 'P'], ['class_rpkg_concat', 'P']]
OPERATION_17 gives  : [['class_map_concat', 'P']]


OPERATION_18 string : diamond_align_out.subscribe{print it}
OPERATION_18 origin : [['diamond_align_out', 'P']]
OPERATION_18 gives  : []


OPERATION_19 string : reference_trees_combined = reference_trees.mix(reference_trees_rpkg)
OPERATION_19 origin : [['reference_trees', 'P'], ['reference_trees_rpkg', 'P']]
OPERATION_19 gives  : [['reference_trees_combined', 'P']]


OPERATION_20 string : decisions_concat = decisions.collectFile(name: 'tree_decisions.txt', storeDir: params.queries_dir)
OPERATION_20 origin : [['decisions', 'P']]
OPERATION_20 gives  : [['decisions_concat', 'P']]


OPERATION_21 string : visualizeOut.subscribe{print it}
OPERATION_21 origin : [['visualizeOut', 'P']]
OPERATION_21 gives  : []


