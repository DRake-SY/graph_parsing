OPERATION_1 string : pairFiles = Channel.fromFilePairs(pairedEndRegex)
OPERATION_1 origin : [['pairedEndRegex', 'A']]
OPERATION_1 gives  : [['pairFiles', 'P']]


OPERATION_2 string : singleFiles = Channel.fromFilePairs(SERegex, size: 1){ file -> file.baseName.replaceAll(/.fq/,"") }
OPERATION_2 origin : [['SERegex, size: 1', 'A']]
OPERATION_2 gives  : [['singleFiles', 'P']]


OPERATION_3 string : indexChannel = Channel
	.fromPath(params.salmonIndex)
	.ifEmpty { exit 1, "Salmon index not found: ${params.salmonIndex}" }
OPERATION_3 origin : [['params.salmonIndex', 'A']]
OPERATION_3 gives  : [['indexChannel', 'P']]


OPERATION_4 string : singleFiles.mix(pairFiles)
.set { fastqChannel }
OPERATION_4 origin : [['singleFiles', 'P'], ['pairFiles', 'P']]
OPERATION_4 gives  : [['fastqChannel', 'P']]


