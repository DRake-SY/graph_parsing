OPERATION_1 string : readsChannel = Channel.fromFilePairs(params.reads)
	.ifEmpty{ exit 1, 'params.reads was empty - no input files were provided!' }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['readsChannel', 'P']]


OPERATION_2 string : referenceChannel = Channel.fromPath(params.reference)
	.ifEmpty{ exit 1, 'params.reference was empty - no reference file was provided!' }
OPERATION_2 origin : [['params.reference', 'A']]
OPERATION_2 gives  : [['referenceChannel', 'P']]


OPERATION_3 string : adaptersDirChannel = Channel.fromPath(params.adaptersDir)
	.ifEmpty{ exit 1, 'params.adaptersDir was empty!' }
OPERATION_3 origin : [['params.adaptersDir', 'A']]
OPERATION_3 gives  : [['adaptersDirChannel', 'P']]


OPERATION_4 string : maxLinesChannel = Channel.value(params.maxLines)
OPERATION_4 origin : [['params.maxLines', 'V']]
OPERATION_4 gives  : [['maxLinesChannel', 'P']]


