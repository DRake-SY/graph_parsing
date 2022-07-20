OPERATION_1 string : Channel
  .fromPath("${params.covfile}")
  .into{ covfile_input; again_covfile_input }
OPERATION_1 origin : [['"${params.covfile}"', 'A']]
OPERATION_1 gives  : [['covfile_input', 'P'], ['again_covfile_input', 'P']]


OPERATION_2 string : Channel
	.fromPath("${module_mk_pre1_split_data}/*")
	.toList()
	.set{ mkfiles_pre1 }
OPERATION_2 origin : [['"${module_mk_pre1_split_data}/*"', 'A']]
OPERATION_2 gives  : [['mkfiles_pre1', 'P']]


OPERATION_3 string : Channel
	.fromPath("${module_mk_001_tsv2bed}/*")
	.toList()
	.set{ mkfiles_001 }
OPERATION_3 origin : [['"${module_mk_001_tsv2bed}/*"', 'A']]
OPERATION_3 gives  : [['mkfiles_001', 'P']]


OPERATION_4 string : Channel
	.fromPath( "${params.chainfile}", checkIfExists: true)
	.combine(results_001_tsv2bed)
	.set{ liftover_inputs }
OPERATION_4 origin : [['results_001_tsv2bed', 'P'], ['"${params.chainfile}", checkIfExists: true', 'A']]
OPERATION_4 gives  : [['liftover_inputs', 'P']]


OPERATION_5 string : Channel
	.fromPath("${module_mk_002_liftover}/*")
	.toList()
	.set{ mkfiles_002 }
OPERATION_5 origin : [['"${module_mk_002_liftover}/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_002', 'P']]


OPERATION_6 string : Channel
	.fromPath("${module_mk_003_sort_compress}/*")
	.toList()
	.set{ mkfiles_003 }
OPERATION_6 origin : [['"${module_mk_003_sort_compress}/*"', 'A']]
OPERATION_6 gives  : [['mkfiles_003', 'P']]


OPERATION_7 string : Channel
	.fromPath("${module_mk_pos1_count_lifted_positions}/*")
	.toList()
	.set{ mkfiles_pos1 }
OPERATION_7 origin : [['"${module_mk_pos1_count_lifted_positions}/*"', 'A']]
OPERATION_7 gives  : [['mkfiles_pos1', 'P']]


OPERATION_8 string : nfsummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_8 origin : [['nfsummary', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : pipelinesummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_9 origin : [['pipelinesummary', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : results_002_liftover
	.toList()
	.set{ all_chunks_002 }
OPERATION_10 origin : [['results_002_liftover', 'P']]
OPERATION_10 gives  : [['all_chunks_002', 'P']]


