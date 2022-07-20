OPERATION_1 string : Channel
    .fromFilePairs('./reads/*_R{1,2}.fastq.gz')
    .set { samples_ch }
OPERATION_1 origin : [["'./reads/*_R{1,2}.fastq.gz'", 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


