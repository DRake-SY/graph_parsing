OPERATION_1 string : Channel.fromList(file(params.sampleList).readLines())
.map {
  [it ,  file(params.sampleInputDir + "/" + it + params.samPsuffix )] }
.set { samples_ch }
OPERATION_1 origin : []
OPERATION_1 gives  : [['samples_ch', 'P']]


