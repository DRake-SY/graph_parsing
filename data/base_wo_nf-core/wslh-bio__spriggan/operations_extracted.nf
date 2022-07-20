OPERATION_1 string : Channel
      .fromSRA(testIDS)
      .set { raw_reads }
OPERATION_1 origin : [['testIDS', 'S']]
OPERATION_1 gives  : [['raw_reads', 'P']]


OPERATION_2 string : Channel
      .fromFilePairs( "${params.reads}/*{R1,R2,_1,_2}*.{fastq,fq}.gz", size: 2 )
      .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads} Path must not end with /" }
      .set { raw_reads }
OPERATION_2 origin : [['"${params.reads}/*{R1,R2,_1,_2}*.{fastq,fq}.gz", size: 2', 'A']]
OPERATION_2 gives  : [['raw_reads', 'P']]


OPERATION_3 string : Channel
  .fromPath("$baseDir/multiqc_config.yaml")
  .set { multiqc_config }
OPERATION_3 origin : [['"$baseDir/multiqc_config.yaml"', 'A']]
OPERATION_3 gives  : [['multiqc_config', 'P']]


OPERATION_4 string : combined_reads = read_files_fastqc.concat(cleaned_reads_fastqc)
OPERATION_4 origin : [['read_files_fastqc', 'P'], ['cleaned_reads_fastqc', 'P']]
OPERATION_4 gives  : [['combined_reads', 'P']]


