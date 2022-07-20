OPERATION_1 string : bam = Channel.create()
OPERATION_1 origin : []
OPERATION_1 gives  : [['bam', 'P']]


OPERATION_2 string : stringtie_bam = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['stringtie_bam', 'P']]


OPERATION_3 string : Channel
            .from star_bam
            .separate( bam, stringtie_bam){ a -> [a,a,a] }
OPERATION_3 origin : []
OPERATION_3 gives  : [['bam', 'P'], ['stringtie_bam', 'P']]


