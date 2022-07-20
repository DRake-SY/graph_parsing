OPERATION_1 string : all_bams = Channel.fromPath( params.input_folder+'/*.bam' ).ifEmpty{error "Cannot find any bam file in: ${params.input_folder}"}
OPERATION_1 origin : [["params.input_folder+'/*.bam'", 'A']]
OPERATION_1 gives  : [['all_bams', 'P']]


