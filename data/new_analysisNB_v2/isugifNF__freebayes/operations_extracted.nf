OPERATION_1 string : Channel
    .fromPath(params.fastaReference, checkIfExists:true)
                                                         
                                                   
    .into { genome_freebayes; genome_samtools}
OPERATION_1 origin : [['params.fastaReference, checkIfExists:true', 'A']]
OPERATION_1 gives  : [['genome_freebayes', 'P'], ['genome_samtools', 'P']]


