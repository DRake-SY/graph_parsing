OPERATION_1 string : Channel
	.fromPath( "${params.fastq_file}" )
	          
	.set{ clip_input}
OPERATION_1 origin : [['"${params.fastq_file}"', 'A']]
OPERATION_1 gives  : [['clip_input', 'P']]


OPERATION_2 string : Channel
	.fromPath("${workflow.projectDir}/mk_modules/mk_alignment/*")
	.toList()
	.set{ mkfiles_pre1 }
OPERATION_2 origin : [['"${workflow.projectDir}/mk_modules/mk_alignment/*"', 'A']]
OPERATION_2 gives  : [['mkfiles_pre1', 'P']]


OPERATION_3 string : Channel
	.fromPath("${workflow.projectDir}/test/data/reference-index")
	.set{ reference_index}
OPERATION_3 origin : [['"${workflow.projectDir}/test/data/reference-index"', 'A']]
OPERATION_3 gives  : [['reference_index', 'P']]


OPERATION_4 string : Channel
	.fromPath("${workflow.projectDir}/mk_modules/mk_sam_to_bam/*")
	.toList()
	.set{ mkfiles_pre2 }
OPERATION_4 origin : [['"${workflow.projectDir}/mk_modules/mk_sam_to_bam/*"', 'A']]
OPERATION_4 gives  : [['mkfiles_pre2', 'P']]


OPERATION_5 string : Channel
		.fromPath("${workflow.projectDir}/mk_modules/mk_peak_calling/*")
		.toList()
		.set{ mkfiles_core1 }
OPERATION_5 origin : [['"${workflow.projectDir}/mk_modules/mk_peak_calling/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_core1', 'P']]


OPERATION_6 string : nfsummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_6 origin : [['nfsummary', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : pipelinesummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_7 origin : [['pipelinesummary', 'P']]
OPERATION_7 gives  : []


