OPERATION_1 string : reads_in = Channel
          .fromFilePairs(params.reads + '*_{R1,R2}.fastq.gz', size: 2, flat: true)
          .println()
OPERATION_1 origin : [["params.reads + '*_{R1,R2}.fastq.gz', size: 2, flat: true", 'A']]
OPERATION_1 gives  : [['reads_in', 'P']]


OPERATION_2 string : reads_md5_pe = Channel
             .fromFilePairs(params.reads + '*_{R1,R2}.fastq.gz', size: 2, flat: true)
OPERATION_2 origin : [["params.reads + '*_{R1,R2}.fastq.gz', size: 2, flat: true", 'A']]
OPERATION_2 gives  : [['reads_md5_pe', 'P']]


