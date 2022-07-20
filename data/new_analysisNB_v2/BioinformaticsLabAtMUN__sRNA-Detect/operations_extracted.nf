OPERATION_1 string : alignmentFileList = Channel.fromPath( "${params.alignmentDir}/*.{sam,bam}").collect()
OPERATION_1 origin : [['"${params.alignmentDir}/*.{sam,bam}"', 'A']]
OPERATION_1 gives  : [['alignmentFileList', 'P']]


OPERATION_2 string : indexFileList = Channel.fromPath( "${params.alignmentDir}/*.bai").collect()
OPERATION_2 origin : [['"${params.alignmentDir}/*.bai"', 'A']]
OPERATION_2 gives  : [['indexFileList', 'P']]


