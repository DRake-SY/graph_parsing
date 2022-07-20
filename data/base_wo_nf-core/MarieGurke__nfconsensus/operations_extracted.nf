OPERATION_1 string : Channel
   .fromPath("${params.bamdir}*/*.bam")
   .set{bam_ch}
OPERATION_1 origin : [['"${params.bamdir}*/*.bam"', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


