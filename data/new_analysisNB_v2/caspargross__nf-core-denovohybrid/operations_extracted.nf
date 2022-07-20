OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : files = Channel.create()
OPERATION_3 origin : []
OPERATION_3 gives  : [['files', 'P']]


OPERATION_4 string : files_to_fastqc = Channel.create()
OPERATION_4 origin : []
OPERATION_4 gives  : [['files_to_fastqc', 'P']]


OPERATION_5 string : files_preprocessed = Channel.create()
OPERATION_5 origin : []
OPERATION_5 gives  : [['files_preprocessed', 'P']]


OPERATION_6 string : files_filtered = Channel.create()
OPERATION_6 origin : []
OPERATION_6 gives  : [['files_filtered', 'P']]


OPERATION_7 string : files_pilon = Channel.create()
OPERATION_7 origin : []
OPERATION_7 gives  : [['files_pilon', 'P']]


OPERATION_8 string : assembly_nopilon = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['assembly_nopilon', 'P']]


OPERATION_9 string : assembly_pilon = Channel.create()
OPERATION_9 origin : []
OPERATION_9 gives  : [['assembly_pilon', 'P']]


OPERATION_10 string : assembly_merged = Channel.create()
OPERATION_10 origin : []
OPERATION_10 gives  : [['assembly_merged', 'P']]


OPERATION_11 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_11 origin : [['summary', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : files_lr_filtered
    .choice(files_preprocessed, files_to_fastqc){
        longReadOnly ? 0 : 1
        }
OPERATION_12 origin : [['files_lr_filtered', 'P']]
OPERATION_12 gives  : [['files_preprocessed', 'P'], ['files_to_fastqc', 'P']]


OPERATION_13 string : files_preprocessed
    .mix(files_filtered)
    .into{
        files_pre_unicycler;
        files_pre_miniasm;
        files_pre_wtdbg2;
        }
OPERATION_13 origin : [['files_preprocessed', 'P'], ['files_filtered', 'P']]
OPERATION_13 gives  : [['files_pre_unicycler', 'P'], ['files_pre_miniasm', 'P'], ['files_pre_wtdbg2', 'P'], ['', 'P']]


OPERATION_14 string : files_unpolished_racon         
                            
    .choice(files_pilon, assembly_nopilon){
        longReadOnly ? 1 : 0}
OPERATION_14 origin : [['files_unpolished_racon', 'P']]
OPERATION_14 gives  : [['files_pilon', 'P'], ['assembly_nopilon', 'P']]


OPERATION_15 string : assembly_merged = assembly_nopilon
    .map{it -> [it[0], it[4], it[5]]}
    .mix(
        assembly_unicycler,
        assembly_pilon 
        )
    .into{asm_quast; asm_format}
OPERATION_15 origin : [['assembly_nopilon', 'P'], ['assembly_unicycler', 'P'], ['assembly_pilon', 'P']]
OPERATION_15 gives  : [['assembly_merged', 'P'], ['asm_quast', 'P'], ['asm_format', 'P']]


