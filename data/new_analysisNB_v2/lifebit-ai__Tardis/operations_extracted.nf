OPERATION_1 string : bam = Channel
    .fromPath("${params.input_folder}/${params.bam_file_prefix}.bam")
    .ifEmpty { exit 1, "${params.input_folder}/${params.bam_file_prefix}.bam not found.\nPlease specify --input_folder option (--input_folder bamfolder)"}
    .map { bam -> tuple(bam.simpleName, bam) }
OPERATION_1 origin : [['"${params.input_folder}/${params.bam_file_prefix}.bam"', 'A']]
OPERATION_1 gives  : [['bam', 'P']]


OPERATION_2 string : bai = Channel
    .fromPath("${params.input_folder}/${params.bam_file_prefix}*.bai")
    .ifEmpty { exit 1, "${params.input_folder}/${params.bam_file_prefix}*.bai not found.\nPlease specify ensure that your BAM index(es) are in your input_folder"}
    .map { bai -> tuple(bai.simpleName, bai) }
OPERATION_2 origin : [['"${params.input_folder}/${params.bam_file_prefix}*.bai"', 'A']]
OPERATION_2 gives  : [['bai', 'P']]


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


OPERATION_5 string : completeChannel = bam.combine(bai, by: 0)
OPERATION_5 origin : [['bam', 'P']]
OPERATION_5 gives  : [['completeChannel', 'P']]


OPERATION_6 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_6 origin : [['summary', 'P']]
OPERATION_6 gives  : []


