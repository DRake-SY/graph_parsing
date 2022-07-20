OPERATION_1 string : Channel.fromFilePairs("${params.raw_reads_dir}/*_{1,2}.fastq.gz").set{ch_subsample}
OPERATION_1 origin : [['"${params.raw_reads_dir}/*_{1,2}.fastq.gz"', 'A']]
OPERATION_1 gives  : [['ch_subsample', 'P']]


OPERATION_2 string : Channel.fromFilePairs("${params.raw_reads_dir}/*_{1,2}.fastq.gz").into{ch_fastqc_pre_trim; ch_trimmomatic_input}
OPERATION_2 origin : [['"${params.raw_reads_dir}/*_{1,2}.fastq.gz"', 'A']]
OPERATION_2 gives  : [['ch_fastqc_pre_trim', 'P'], ['ch_trimmomatic_input', 'P']]


