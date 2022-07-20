OPERATION_1 string : Channel
  .fromPath( "${params.input_dir}/*.fastq.gz" )
  .map{ file -> tuple(get_sample_prefix(file), file) }
	.groupTuple()
            
  .into{ fastq_inputs; fastq_inputs_again }
OPERATION_1 origin : [['"${params.input_dir}/*.fastq.gz"', 'A']]
OPERATION_1 gives  : [['fastq_inputs', 'P'], ['fastq_inputs_again', 'P']]


OPERATION_2 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-fastqc/*")
	.toList()
	.set{ mkfiles_pre1 }
OPERATION_2 origin : [['"${workflow.projectDir}/mkmodules/mk-fastqc/*"', 'A']]
OPERATION_2 gives  : [['mkfiles_pre1', 'P']]


OPERATION_3 string : Channel
		.fromPath("${workflow.projectDir}/mkmodules/mk-trimmomatic/*")
		.toList()
		.set{ mkfiles_001 }
OPERATION_3 origin : [['"${workflow.projectDir}/mkmodules/mk-trimmomatic/*"', 'A']]
OPERATION_3 gives  : [['mkfiles_001', 'P']]


OPERATION_4 string : Channel
		.fromPath("${workflow.projectDir}/mkmodules/mk-trimmomatic-SE/*")
		.toList()
		.set{ mkfiles_001 }
OPERATION_4 origin : [['"${workflow.projectDir}/mkmodules/mk-trimmomatic-SE/*"', 'A']]
OPERATION_4 gives  : [['mkfiles_001', 'P']]


OPERATION_5 string : Channel
		.fromPath("${workflow.projectDir}/mkmodules/mk-trimreport/*")
		.toList()
		.set{ mkfiles_an1 }
OPERATION_5 origin : [['"${workflow.projectDir}/mkmodules/mk-trimreport/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_an1', 'P']]


OPERATION_6 string : Channel
		.fromPath("${workflow.projectDir}/mkmodules/mk-trimreport-SE/*")
		.toList()
		.set{ mkfiles_an1 }
OPERATION_6 origin : [['"${workflow.projectDir}/mkmodules/mk-trimreport-SE/*"', 'A']]
OPERATION_6 gives  : [['mkfiles_an1', 'P']]


OPERATION_7 string : Channel
		.fromPath("${workflow.projectDir}/mkmodules/mk-gather-sample/*")
		.toList()
		.set{ mkfiles_pos1 }
OPERATION_7 origin : [['"${workflow.projectDir}/mkmodules/mk-gather-sample/*"', 'A']]
OPERATION_7 gives  : [['mkfiles_pos1', 'P']]


OPERATION_8 string : Channel
	.fromPath("${workflow.projectDir}/nextflow.config")
	.set{ nfconfig }
OPERATION_8 origin : [['"${workflow.projectDir}/nextflow.config"', 'A']]
OPERATION_8 gives  : [['nfconfig', 'P']]


OPERATION_9 string : nfsummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_9 origin : [['nfsummary', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : pipelinesummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_10 origin : [['pipelinesummary', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : results_001_trimmomatic_trimreport
	.flatten()
	.toList()
	          
	.set{ all_trimreports }
OPERATION_11 origin : [['results_001_trimmomatic_trimreport', 'P']]
OPERATION_11 gives  : [['all_trimreports', 'P']]


