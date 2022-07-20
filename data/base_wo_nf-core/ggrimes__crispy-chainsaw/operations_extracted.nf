OPERATION_1 string : sra_ch = Channel
        .fromFilePairs("${baseDir}/data/raw_reads/SRR4204500/*{1,2}.fastq.gz")
        .view()
OPERATION_1 origin : [['"${baseDir}/data/raw_reads/SRR4204500/*{1,2}.fastq.gz"', 'A']]
OPERATION_1 gives  : [['sra_ch', 'P']]


