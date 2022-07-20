Name : bam2fq
Inputs : [[0, 'params']]
Outputs : [[0, 'bam2fq_ch1'], [0, 'bam2fq_ch2']]
Emits : []


Name : split_r1
Inputs : [[0, 'bam2fq_ch1']]
Outputs : [[0, 'r1_fastq']]
Emits : []


Name : split_r2
Inputs : [[0, 'bam2fq_ch2']]
Outputs : [[0, 'r2_fastq']]
Emits : []


Name : repair_files
Inputs : [[0, 'samples_ch']]
Outputs : []
Emits : []


