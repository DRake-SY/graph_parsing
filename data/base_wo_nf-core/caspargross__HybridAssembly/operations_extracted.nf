OPERATION_1 string : files = Channel.create()
OPERATION_1 origin : []
OPERATION_1 gives  : [['files', 'P']]


OPERATION_2 string : files_to_seqpurge = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['files_to_seqpurge', 'P']]


OPERATION_3 string : files_preprocessed = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['files_preprocessed', 'P']]


OPERATION_4 string : files_filtered = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['files_filtered', 'P']]


OPERATION_5 string : files_pilon = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['files_pilon', 'P']]


OPERATION_6 string : assembly_nopilon = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['assembly_nopilon', 'P']]


OPERATION_7 string : assembly_pilon = Channel.create()
OPERATION_7 origin : []
OPERATION_7 gives  : [['assembly_pilon', 'P']]


OPERATION_8 string : assembly_merged = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['assembly_merged', 'P']]


OPERATION_9 string : read_stats = Channel.create()
OPERATION_9 origin : []
OPERATION_9 gives  : [['read_stats', 'P']]


OPERATION_10 string : to_sample_stats = Channel.create()
OPERATION_10 origin : []
OPERATION_10 gives  : [['to_sample_stats', 'P']]


OPERATION_11 string : files.into{files_init; files_preprocessing}
OPERATION_11 origin : [['files', 'P']]
OPERATION_11 gives  : [['files_init', 'P'], ['files_preprocessing', 'P']]


OPERATION_12 string : files_lr_filtered
    .choice(files_preprocessed, files_to_seqpurge){
        longReadOnly ? 0 : 1 
        }
OPERATION_12 origin : [['files_lr_filtered', 'P']]
OPERATION_12 gives  : [['files_preprocessed', 'P'], ['files_to_seqpurge', 'P']]


OPERATION_13 string : files_preprocessed
    .mix(files_filtered)
    .into{
        files_pre_unicycler;
        files_pre_spades;
        files_pre_canu;
        files_pre_miniasm;
        files_pre_flye
        }
OPERATION_13 origin : [['files_preprocessed', 'P'], ['files_filtered', 'P']]
OPERATION_13 gives  : [['files_pre_unicycler', 'P'], ['files_pre_spades', 'P'], ['files_pre_canu', 'P'], ['files_pre_miniasm', 'P'], ['files_pre_flye', 'P']]


OPERATION_14 string : files_unpolished_canu.mix(
    files_unpolished_racon, 
    files_unpolished_flye)
    .choice(files_pilon, assembly_nopilon){
        longReadOnly ? 1 : 0}
OPERATION_14 origin : [['files_unpolished_canu', 'P'], ['files_unpolished_racon', 'P'], ['files_unpolished_flye', 'P']]
OPERATION_14 gives  : [['files_pilon', 'P'], ['assembly_nopilon', 'P']]


OPERATION_15 string : assembly_merged = assembly_nopilon
    .map{it -> [it[0], it[4], it[5]]}
    .mix(
        assembly_spades_simple,
        assembly_gapfiller,
        assembly_unicycler,
        assembly_pilon 
        )
OPERATION_15 origin : [['assembly_nopilon', 'P'], ['assembly_spades_simple', 'P'], ['assembly_gapfiller', 'P'], ['assembly_unicycler', 'P'], ['assembly_pilon', 'P']]
OPERATION_15 gives  : [['assembly_merged', 'P']]


OPERATION_16 string : stats_lr
    .mix(stats_sr)
    .groupTuple()
    .set{read_stats}
OPERATION_16 origin : [['stats_lr', 'P'], ['stats_sr', 'P']]
OPERATION_16 gives  : [['read_stats', 'P']]


OPERATION_17 string : final_files
    .groupTuple()
    .join(read_stats)
    .set{to_sample_stats}
OPERATION_17 origin : [['final_files', 'P'], ['read_stats', 'P']]
OPERATION_17 gives  : [['to_sample_stats', 'P']]


OPERATION_18 string : files_init
    .combine(final_files_plasmident)
           
    .collectFile(newLine: true, 
		storeDir : workflow.launchDir) {
        it -> 
            ['file_paths_plasmident.tsv', 
		it[0] + '\t' + it[6].toString() + '\t' + it[1].toString()]
    }
OPERATION_18 origin : [['files_init', 'P'], ['final_files_plasmident', 'P']]
OPERATION_18 gives  : []


