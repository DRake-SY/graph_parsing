OPERATION_1 string : Channel
	.fromPath(params.query)
	.splitFasta(by: params.chunkSize, file:true)
	.set { fasta_ch }
OPERATION_1 origin : [['params.query', 'A']]
OPERATION_1 gives  : [['fasta_ch', 'P']]


OPERATION_2 string : blast_ch
   .collectFile(name: "blastresults.txt")
   .set { blastresult_ch }
OPERATION_2 origin : [['blast_ch', 'P']]
OPERATION_2 gives  : [['blastresult_ch', 'P']]


