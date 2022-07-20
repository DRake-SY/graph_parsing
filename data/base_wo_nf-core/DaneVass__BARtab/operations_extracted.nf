OPERATION_1 string : Channel
      .fromFilePairs( "${params.indir}/*_R{1,2}.{fastq,fq}.gz" )
      .ifEmpty { error "Cannot find any *_R{1,2}.{fastq,fq}.gz files in: ${params.reads}" }
      .into { readsChannel; qcChannel }
OPERATION_1 origin : [['"${params.indir}/*_R{1,2}.{fastq,fq}.gz"', 'A']]
OPERATION_1 gives  : [['readsChannel', 'P'], ['qcChannel', 'P']]


OPERATION_2 string : Channel
      .fromPath( "${params.indir}/*.{fastq,fq}.gz" )
      .map { file -> tuple( file.baseName.replaceAll(/\.fastq|\.fq/, ''), file ) }
      .ifEmpty { error "Cannot find any *.{fastq,fq}.gz files in: ${params.indir}" }
      .into { readsChannel; qcChannel }
OPERATION_2 origin : [['"${params.indir}/*.{fastq,fq}.gz"', 'A']]
OPERATION_2 gives  : [['readsChannel', 'P'], ['qcChannel', 'P']]


OPERATION_3 string : Channel.fromPath(params.multiqc_config, checkIfExists: true).set { ch_config_for_multiqc }
OPERATION_3 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['ch_config_for_multiqc', 'P']]


