OPERATION_1 string : read_pair = Channel
  .fromFilePairs( "${raw_reads}/*_R[1,2]*.fastq", type: 'file')
  .ifEmpty { error "Cannot find any fastq files matching: ${params.input_folder}" }
  .into  { read_files_fastqc; read_files_trimG }
OPERATION_1 origin : [['"${raw_reads}/*_R[1,2]*.fastq", type: \'file\'', 'A']]
OPERATION_1 gives  : [['read_pair', 'P'], ['read_files_fastqc', 'P'], ['read_files_trimG', 'P']]


