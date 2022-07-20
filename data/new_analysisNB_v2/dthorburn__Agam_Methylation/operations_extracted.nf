OPERATION_1 string : run_id = Channel.value( "${params.RunID}" )
OPERATION_1 origin : []
OPERATION_1 gives  : [['run_id', 'P']]


OPERATION_2 string : Channel
    .fromPath("${params.Input}")
    .ifEmpty { error "${params.Input} file not found!" }
    .set { tarball }
OPERATION_2 origin : [['"${params.Input}"', 'A']]
OPERATION_2 gives  : [['tarball', 'P']]


OPERATION_3 string : Channel
      .fromPath("${params.TarDir}/*.fast5")
      .ifEmpty { error "Cannot find fast5s in ${params.TarDir}" }
      .collect()
      .set { fast5s }
OPERATION_3 origin : [['"${params.TarDir}/*.fast5"', 'A']]
OPERATION_3 gives  : [['fast5s', 'P']]


OPERATION_4 string : Channel
    .fromPath("${params.TarDir}")
    .set { fast5_dir }
OPERATION_4 origin : [['"${params.TarDir}"', 'A']]
OPERATION_4 gives  : [['fast5_dir', 'P']]


OPERATION_5 string : Channel
      .fromPath("${params.GuppyDir}/*.bam")
      .ifEmpty { error "No bams found in ${params.GuppyDir}" }
      .set { all_bams1 }
OPERATION_5 origin : [['"${params.GuppyDir}/*.bam"', 'A']]
OPERATION_5 gives  : [['all_bams1', 'P']]


OPERATION_6 string : Channel
      .fromPath("${params.GuppyDir}/*.bam")
      .ifEmpty { error "No bams found in ${params.GuppyDir}" }
      .set { all_bams2 }
OPERATION_6 origin : [['"${params.GuppyDir}/*.bam"', 'A']]
OPERATION_6 gives  : [['all_bams2', 'P']]


OPERATION_7 string : Channel
      .fromPath("${params.GuppyDir}/*.bai")
      .ifEmpty { error "No bais found in ${params.GuppyDir}" }
      .set { bais_ch }
OPERATION_7 origin : [['"${params.GuppyDir}/*.bai"', 'A']]
OPERATION_7 gives  : [['bais_ch', 'P']]


OPERATION_8 string : bams_ch = all_bams1
              .flatMap()  
OPERATION_8 origin : [['all_bams1', 'P']]
OPERATION_8 gives  : [['bams_ch', 'P']]


