OPERATION_1 string : bowtie2_db_ch = Channel.value(file("${params.bowtie2_reference_index}"))
OPERATION_1 origin : []
OPERATION_1 gives  : [['bowtie2_db_ch', 'P']]


OPERATION_2 string : bowtie2_mitodb_ch = Channel.value(file("${params.bowtie2_mito_index}"))
OPERATION_2 origin : []
OPERATION_2 gives  : [['bowtie2_mitodb_ch', 'P']]


OPERATION_3 string : kraken2_db_ch = Channel.value(file("${params.kraken2_db}"))
OPERATION_3 origin : []
OPERATION_3 gives  : [['kraken2_db_ch', 'P']]


OPERATION_4 string : reads = Channel.fromFilePairs(params.reads)
OPERATION_4 origin : [['params.reads', 'A']]
OPERATION_4 gives  : [['reads', 'P']]


OPERATION_5 string : reads.into { fastp_reads; second_line }
OPERATION_5 origin : [['reads', 'P']]
OPERATION_5 gives  : [['fastp_reads', 'P'], ['second_line', 'P']]


