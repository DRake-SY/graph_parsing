OPERATION_1 string : Channel
    .fromFilePairs( reads, checkIfExists: true, size: -1 )                                                           
    .ifEmpty { error "Can not find any reads matching ${reads}" }
    .set{ read_ch }
OPERATION_1 origin : [['reads, checkIfExists: true, size: -1', 'A']]
OPERATION_1 gives  : [['read_ch', 'P']]


OPERATION_2 string : Channel
        .of("${params.kraken_db}")
        .set { kraken_db_ch }
OPERATION_2 origin : []
OPERATION_2 gives  : [['kraken_db_ch', 'P']]


OPERATION_3 string : kraken_db_ch = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['kraken_db_ch', 'P']]


OPERATION_4 string : Channel
        .of( "${params.kaiju_db}" )
        .set { kaiju_db }
OPERATION_4 origin : []
OPERATION_4 gives  : [['kaiju_db', 'P']]


OPERATION_5 string : kaiju_db = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['kaiju_db', 'P']]


OPERATION_6 string : fastp_ch
    .into { fastp1; fastp2 }
OPERATION_6 origin : [['fastp_ch', 'P']]
OPERATION_6 gives  : [['fastp1', 'P'], ['fastp2', 'P']]


