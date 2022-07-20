OPERATION_1 string : reference_ch = Channel.value(file(params.reference))
OPERATION_1 origin : []
OPERATION_1 gives  : [['reference_ch', 'P']]


OPERATION_2 string : Channel
  .fromFilePairs( params.input, size: 1 )
  .ifEmpty { exit 1, "Cannot find any files matching ${params.input}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!" }
  .into {alignment_sort_ch ; alignment_flagstat_ch }
OPERATION_2 origin : [['params.input, size: 1', 'A']]
OPERATION_2 gives  : [['alignment_sort_ch', 'P'], ['alignment_flagstat_ch', 'P']]


