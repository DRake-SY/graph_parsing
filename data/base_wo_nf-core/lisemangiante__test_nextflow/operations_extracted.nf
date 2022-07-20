OPERATION_1 string : bam = Channel.fromPath( params.bam_folder+'/*.bam' )
OPERATION_1 origin : [["params.bam_folder+'/*.bam'", 'A']]
OPERATION_1 gives  : [['bam', 'P']]


OPERATION_2 string : all_average = average.collectFile(name: 'all_average.txt')
OPERATION_2 origin : [['average', 'P']]
OPERATION_2 gives  : [['all_average', 'P']]


