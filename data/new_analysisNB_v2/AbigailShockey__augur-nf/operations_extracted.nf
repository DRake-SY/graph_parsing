OPERATION_1 string : Channel
    .fromPath("${params.reference}")
    .ifEmpty { exit 1, "Cannot find reference sequence in: ${params.reference}" }
    .into { reference_alignment; reference_translate }
OPERATION_1 origin : [['"${params.reference}"', 'A']]
OPERATION_1 gives  : [['reference_alignment', 'P'], ['reference_translate', 'P']]


OPERATION_2 string : Channel
    .fromPath( "${params.metadata}")
    .ifEmpty { exit 1, "Cannot find metadata file in: ${params.metadata}" }
    .into { filter_metadata; refine_tree_metadata; traits_metadata; metadata_export }
OPERATION_2 origin : [['"${params.metadata}"', 'A']]
OPERATION_2 gives  : [['filter_metadata', 'P'], ['refine_tree_metadata', 'P'], ['traits_metadata', 'P'], ['metadata_export', 'P']]


OPERATION_3 string : Channel
    .fromPath( "${params.colors}")
    .ifEmpty { exit 1, "Cannot find colors file in: ${params.colors}" }
    .set { colors_export }
OPERATION_3 origin : [['"${params.colors}"', 'A']]
OPERATION_3 gives  : [['colors_export', 'P']]


OPERATION_4 string : Channel
    .fromPath( "${params.lat_long}")
    .ifEmpty { exit 1, "Cannot find latitude and longitude file in: ${params.lat_long}" }
    .set { lat_long_export }
OPERATION_4 origin : [['"${params.lat_long}"', 'A']]
OPERATION_4 gives  : [['lat_long_export', 'P']]


OPERATION_5 string : Channel
    .fromPath( "${params.config}")
    .ifEmpty { exit 1, "Cannot find Auspice config file in: ${params.auspice_config}" }
    .set { config_export }
OPERATION_5 origin : [['"${params.config}"', 'A']]
OPERATION_5 gives  : [['config_export', 'P']]


OPERATION_6 string : Channel
        .fromPath( "${params.mask}")
        .ifEmpty { exit 1, "Cannot find input BED file in: ${params.mask}" }
        .set { bed_file }
OPERATION_6 origin : [['"${params.mask}"', 'A']]
OPERATION_6 gives  : [['bed_file', 'P']]


OPERATION_7 string : Channel
        .from( "${params.mask}")
        .set { bed_file }
OPERATION_7 origin : []
OPERATION_7 gives  : [['bed_file', 'P']]


OPERATION_8 string : Channel
        .fromPath( "${params.sequences}")
        .ifEmpty { exit 1, "Cannot find input sequences in: ${params.sequences}" }
        .set { sequences }
OPERATION_8 origin : [['"${params.sequences}"', 'A']]
OPERATION_8 gives  : [['sequences', 'P']]


OPERATION_9 string : Channel
        .fromPath( "${params.filter}")
        .ifEmpty { exit 1, "Cannot find filter file in: ${params.filter}" }
        .set { dropped_strains }
OPERATION_9 origin : [['"${params.filter}"', 'A']]
OPERATION_9 gives  : [['dropped_strains', 'P']]


OPERATION_10 string : Channel
        .fromPath( "${params.sequences}")
        .ifEmpty { exit 1, "Cannot find input sequences in: ${params.sequences}" }
        .set { input_sequences }
OPERATION_10 origin : [['"${params.sequences}"', 'A']]
OPERATION_10 gives  : [['input_sequences', 'P']]


OPERATION_11 string : Channel
        .from( "${params.traits}")
        .set { traits_export }
OPERATION_11 origin : []
OPERATION_11 gives  : [['traits_export', 'P']]


