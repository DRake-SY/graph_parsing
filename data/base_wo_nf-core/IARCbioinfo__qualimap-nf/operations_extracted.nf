OPERATION_1 string : bams_init = Channel.fromPath( params.input_folder+'/*.bam' )
              .ifEmpty { error "Cannot find any bam file in: ${params.input_folder}" }
OPERATION_1 origin : [["params.input_folder+'/*.bam'", 'A']]
OPERATION_1 gives  : [['bams_init', 'P']]


OPERATION_2 string : bams_init.into{ bams; bams2 }
OPERATION_2 origin : [['bams_init', 'P']]
OPERATION_2 gives  : [['bams', 'P'], ['bams2', 'P']]


