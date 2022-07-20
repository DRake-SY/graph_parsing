OPERATION_1 string : refs = Channel.fromPath(params.refs).map{[it.getParent().getBaseName(), it]}
OPERATION_1 origin : [['params.refs', 'A']]
OPERATION_1 gives  : [['refs', 'P']]


OPERATION_2 string : qrys = Channel.fromPath(params.qrys).map{[it.getParent().getBaseName(), it]}
OPERATION_2 origin : [['params.qrys', 'A']]
OPERATION_2 gives  : [['qrys', 'P']]


OPERATION_3 string : refs
.tap { genomes1 }
.combine(qrys)
.filter{ it[0] != it[2] }
.tap { genomePairs }
OPERATION_3 origin : [['refs', 'P'], ['qrys', 'P']]
OPERATION_3 gives  : [['genomes1', 'P'], ['genomePairs', 'P']]


OPERATION_4 string : genomeCoverages
.groupTuple()
.set { plottingInputs }
OPERATION_4 origin : [['genomeCoverages', 'P']]
OPERATION_4 gives  : [['plottingInputs', 'P']]


OPERATION_5 string : outputSVGs.println()
OPERATION_5 origin : [['outputSVGs', 'P']]
OPERATION_5 gives  : []


