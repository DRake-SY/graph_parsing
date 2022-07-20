OPERATION_1 string : Channel
    .fromFilePairs('./cached/output_r1r2//*_{r1,r2}.fastq')
    .set {samples_ch}
OPERATION_1 origin : [["'./cached/output_r1r2//*_{r1,r2}.fastq'", 'A']]
OPERATION_1 gives  : [['samples_ch', 'P']]


