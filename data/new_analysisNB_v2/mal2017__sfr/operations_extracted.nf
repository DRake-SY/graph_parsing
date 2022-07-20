OPERATION_1 string : fq_ch = Channel.fromFilePairs( params.fq ).ifEmpty({ error 'Provide path or pattern.' })
OPERATION_1 origin : [['params.fq', 'A']]
OPERATION_1 gives  : [['fq_ch', 'P']]


OPERATION_2 string : x_result_ch
	.join(y_result_ch)
	.map {it.flatten()}
	.map {it[3] = (it[2] as Double).div([it[1] as Double ]); it}
	.map { "${it[0]},${it[1]},${it[2]}" }
	.collectFile(name:params.outfile, newLine: true, sort:true)
OPERATION_2 origin : [['x_result_ch', 'P'], ['y_result_ch', 'P']]
OPERATION_2 gives  : []


