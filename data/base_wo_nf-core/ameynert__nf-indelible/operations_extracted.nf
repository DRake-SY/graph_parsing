OPERATION_1 string : config_ch = Channel.value(file(params.config))
OPERATION_1 origin : []
OPERATION_1 gives  : [['config_ch', 'P']]


OPERATION_2 string : reference_ch = Channel.value(file(params.reference))
OPERATION_2 origin : []
OPERATION_2 gives  : [['reference_ch', 'P']]


OPERATION_3 string : frequency_ch = Channel.value(file(params.frequency))
OPERATION_3 origin : []
OPERATION_3 gives  : [['frequency_ch', 'P']]


OPERATION_4 string : indelible_ch = Channel.value(file(params.indelible))
OPERATION_4 origin : []
OPERATION_4 gives  : [['indelible_ch', 'P']]


OPERATION_5 string : ped_ch = Channel.value(file(params.ped))
OPERATION_5 origin : []
OPERATION_5 gives  : [['ped_ch', 'P']]


OPERATION_6 string : parents_ch = Channel.value(file(params.parents))
OPERATION_6 origin : []
OPERATION_6 gives  : [['parents_ch', 'P']]


OPERATION_7 string : Channel
  .fromFilePairs( params.input, size: 2 ) { file->file.name.replaceAll(/.bam|.bai$/,'') }
  .ifEmpty { exit 1, "Cannot find any files matching ${params.input}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!" }
  .set { probands_ch }
OPERATION_7 origin : [['params.input, size: 2', 'A']]
OPERATION_7 gives  : [['probands_ch', 'P']]


