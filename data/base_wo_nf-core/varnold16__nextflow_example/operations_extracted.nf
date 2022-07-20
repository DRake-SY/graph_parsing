OPERATION_1 string : SAMPLE_FILES = Channel.fromPath(params.SAMPLES)
OPERATION_1 origin : [['params.SAMPLES', 'A']]
OPERATION_1 gives  : [['SAMPLE_FILES', 'P']]


OPERATION_2 string : COUNT_FILES.println { "Sample $it.baseName is finished." }
OPERATION_2 origin : [['COUNT_FILES', 'P']]
OPERATION_2 gives  : []


