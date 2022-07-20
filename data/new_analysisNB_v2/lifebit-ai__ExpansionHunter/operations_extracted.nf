OPERATION_1 string : bam = Channel
		.fromPath(params.bam)
		.ifEmpty { exit 1, "${params.bam} not found.\nPlease specify --bam option (--bam bamfile)"}
OPERATION_1 origin : [['params.bam', 'A']]
OPERATION_1 gives  : [['bam', 'P']]


OPERATION_2 string : fasta = Channel
		.fromPath(params.genome)
		.ifEmpty { exit 1, "${params.genome} not found.\nPlease specify --genome option (--genome fastafile)"}
OPERATION_2 origin : [['params.genome', 'A']]
OPERATION_2 gives  : [['fasta', 'P']]


OPERATION_3 string : repeat_specs = Channel
		.fromPath(params.repeats, type: 'dir' )
		.ifEmpty { exit 1, "${params.repeats} not found.\nPlease specify --repeats option (--repeats repeatSpecsFolder)"}
OPERATION_3 origin : [["params.repeats, type: 'dir'", 'A']]
OPERATION_3 gives  : [['repeat_specs', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


