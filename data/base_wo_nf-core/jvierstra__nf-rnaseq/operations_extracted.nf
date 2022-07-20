OPERATION_1 string : Channel
	.fromPath(params.samples_file)
	.splitCsv(header:true, sep:'\t')
	.map{ row -> tuple( row.indiv_id, row.ln_number, row.run, file(row.r1_fastq), file(row.r2_fasta)) }
	.set{ FASTQ_TO_ALIGN }
OPERATION_1 origin : [['params.samples_file', 'A']]
OPERATION_1 gives  : [['FASTQ_TO_ALIGN', 'P']]


