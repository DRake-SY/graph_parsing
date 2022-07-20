OPERATION_1 string : Channel
	.fromPath(params.query)
	.splitFasta(by: (params.chunkSize), file:true)
	.into { queryFile_ch }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['queryFile_ch', 'P']]


OPERATION_2 string : blast_output_ch
	.collectFile(name: 'blast_output_combined.txt', storeDir: params.outdir)
OPERATION_2 origin : [['blast_output_ch', 'P']]
OPERATION_2 gives  : []


