OPERATION_1 string : cram = Channel
    .fromPath("${params.input_folder}/${params.cram_file_prefix}.cram")
    .ifEmpty { exit 1, "${params.input_folder}/${params.cram_file_prefix}.cram not found.\nPlease specify --input_folder option (--input_folder cramfolder)"}
    .map { cram -> tuple(cram.simpleName, cram) }
OPERATION_1 origin : [['"${params.input_folder}/${params.cram_file_prefix}.cram"', 'A']]
OPERATION_1 gives  : [['cram', 'P']]


OPERATION_2 string : crai = Channel
    .fromPath("${params.input_folder}/${params.cram_file_prefix}*.crai")
    .ifEmpty { exit 1, "${params.input_folder}/${params.cram_file_prefix}*.crai not found.\nPlease specify ensure that your cram index(es) are in your input_folder"}
    .map { crai -> tuple(crai.simpleName, crai) }
OPERATION_2 origin : [['"${params.input_folder}/${params.cram_file_prefix}*.crai"', 'A']]
OPERATION_2 gives  : [['crai', 'P']]


OPERATION_3 string : ref = Channel
		.fromPath(params.ref)
		.ifEmpty { exit 1, "${params.ref} not found.\nPlease specify --ref option (--ref fastafile)"}
OPERATION_3 origin : [['params.ref', 'A']]
OPERATION_3 gives  : [['ref', 'P']]


OPERATION_4 string : sonic = Channel
    .fromPath(params.sonic)
    .ifEmpty { exit 1, "${params.sonic} not found.\nPlease specify --sonic option (--sonic sonicfile)"}
OPERATION_4 origin : [['params.sonic', 'A']]
OPERATION_4 gives  : [['sonic', 'P']]


OPERATION_5 string : completeChannel = cram.combine(crai, by: 0)
OPERATION_5 origin : [['cram', 'P']]
OPERATION_5 gives  : [['completeChannel', 'P']]


OPERATION_6 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_6 origin : [['summary', 'P']]
OPERATION_6 gives  : []


