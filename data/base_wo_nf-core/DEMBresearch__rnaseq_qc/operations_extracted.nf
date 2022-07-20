OPERATION_1 string : reads_pair_fastqc_pre = Channel.fromFilePairs("${params.raw_reads}/*[1,2].fastq.gz")
OPERATION_1 origin : [['"${params.raw_reads}/*[1,2].fastq.gz"', 'A']]
OPERATION_1 gives  : [['reads_pair_fastqc_pre', 'P']]


OPERATION_2 string : reads_pair_fastp = Channel.fromFilePairs("${params.raw_reads}/*[1,2].fastq.gz")
OPERATION_2 origin : [['"${params.raw_reads}/*[1,2].fastq.gz"', 'A']]
OPERATION_2 gives  : [['reads_pair_fastp', 'P']]


OPERATION_3 string : reads_pair_index = Channel.fromFilePairs("${params.raw_reads}/*[1,2].fastq.gz")
OPERATION_3 origin : [['"${params.raw_reads}/*[1,2].fastq.gz"', 'A']]
OPERATION_3 gives  : [['reads_pair_index', 'P']]


