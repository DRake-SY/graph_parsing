OPERATION_1 string : Channel
  .fromPath(params.bam)
  .map { item -> [ item.baseName.tokenize('.')[1], item] }
  .set { bam_ch }
OPERATION_1 origin : [['params.bam', 'A']]
OPERATION_1 gives  : [['bam_ch', 'P']]


