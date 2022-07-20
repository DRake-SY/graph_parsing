OPERATION_1 string : demuxed = Channel.fromPath(params.fastq)
OPERATION_1 origin : [['params.fastq', 'A']]
OPERATION_1 gives  : [['demuxed', 'P']]


OPERATION_2 string : read_pairs = demuxed
               .map { it -> [ sample(it), it ]}
               .groupTuple( sort: true )
               .map{ sample, reads ->
                 tuple( sample, reads[0], reads[1])}
OPERATION_2 origin : [['demuxed', 'P']]
OPERATION_2 gives  : [['read_pairs', 'P']]


