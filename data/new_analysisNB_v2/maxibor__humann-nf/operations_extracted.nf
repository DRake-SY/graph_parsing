OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: params.pairedEnd ? 2 : 1 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\n" }
	.set {reads_to_trim}
OPERATION_1 origin : [['params.reads, size: params.pairedEnd ? 2 : 1', 'A']]
OPERATION_1 gives  : [['reads_to_trim', 'P']]


OPERATION_2 string : Channel
    .fromPath( params.chocophlanDB, checkIfExists: true )
    .ifEmpty { exit 1, "Cannot find any chocophlanDB matching: ${params.chocophlanDB}\n" }
    .first()
    .set {chocophlanDB}
OPERATION_2 origin : [['params.chocophlanDB, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['chocophlanDB', 'P']]


OPERATION_3 string : Channel
    .fromPath( params.unirefDB, checkIfExists: true )
    .ifEmpty { exit 1, "Cannot find any unirefDB matching: ${params.unirefDB}\n" }
    .first()
    .set {unirefDB}
OPERATION_3 origin : [['params.unirefDB, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['unirefDB', 'P']]


OPERATION_4 string : mpa_db_path_wait = Channel.value( "${params.mpa_db_name}" )
OPERATION_4 origin : []
OPERATION_4 gives  : [['mpa_db_path_wait', 'P']]


OPERATION_5 string : trimmed_reads_humann
    .join(metaphlan_out)
    .set {humann_ch}
OPERATION_5 origin : [['trimmed_reads_humann', 'P'], ['metaphlan_out', 'P']]
OPERATION_5 gives  : [['humann_ch', 'P']]


