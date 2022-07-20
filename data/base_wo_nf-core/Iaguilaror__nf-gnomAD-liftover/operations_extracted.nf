OPERATION_1 string : Channel
  .fromPath("${params.vcf_dir}/*vcf*")
	.map{ file -> tuple(get_sample_prefix(file), file) }
	.groupTuple()
	          
  .set{ vcf_inputs}
OPERATION_1 origin : [['"${params.vcf_dir}/*vcf*"', 'A']]
OPERATION_1 gives  : [['vcf_inputs', 'P']]


OPERATION_2 string : Channel
  .fromPath("${params.vcf_dir}/*vcf.bgz")
	          
  .set{ also_vcf_inputs }
OPERATION_2 origin : [['"${params.vcf_dir}/*vcf.bgz"', 'A']]
OPERATION_2 gives  : [['also_vcf_inputs', 'P']]


OPERATION_3 string : Channel
	.fromPath( ["${params.genome_fasta}*" , "${params.chainfile}"], checkIfExists: true)
  .toList()
	.set{ liftover_references }
OPERATION_3 origin : [['["${params.genome_fasta}*" , "${params.chainfile}"], checkIfExists: true', 'A']]
OPERATION_3 gives  : [['liftover_references', 'P']]


OPERATION_4 string : Channel
	.fromPath("${module_mk_pre0_split_vcf}/*")
	.toList()
	.set{ mkfiles_pre0 }
OPERATION_4 origin : [['"${module_mk_pre0_split_vcf}/*"', 'A']]
OPERATION_4 gives  : [['mkfiles_pre0', 'P']]


OPERATION_5 string : Channel
	.fromPath("${module_mk_pre1_filtering_PASS}/*")
	.toList()
	.set{ mkfiles_pre1 }
OPERATION_5 origin : [['"${module_mk_pre1_filtering_PASS}/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_pre1', 'P']]


OPERATION_6 string : Channel
	.fromPath("${module_mk_001_liftover}/*")
	.toList()
	.set{ mkfiles_001 }
OPERATION_6 origin : [['"${module_mk_001_liftover}/*"', 'A']]
OPERATION_6 gives  : [['mkfiles_001', 'P']]


OPERATION_7 string : Channel
	.fromPath("${module_mk_002_edit_vcf}/*")
	.toList()
	.set{ mkfiles_002 }
OPERATION_7 origin : [['"${module_mk_002_edit_vcf}/*"', 'A']]
OPERATION_7 gives  : [['mkfiles_002', 'P']]


OPERATION_8 string : Channel
	.fromPath("${module_mk_003_concatenate_vcf}/*")
	.toList()
	.set{ mkfiles_003 }
OPERATION_8 origin : [['"${module_mk_003_concatenate_vcf}/*"', 'A']]
OPERATION_8 gives  : [['mkfiles_003', 'P']]


OPERATION_9 string : Channel
	.fromPath("${module_mk_004_sort_and_compress}/*")
	.toList()
	.set{ mkfiles_004 }
OPERATION_9 origin : [['"${module_mk_004_sort_and_compress}/*"', 'A']]
OPERATION_9 gives  : [['mkfiles_004', 'P']]


OPERATION_10 string : Channel
	.fromPath("${module_mk_pos1_count_lifted_variants}/*")
	.toList()
	.set{ mkfiles_pos1 }
OPERATION_10 origin : [['"${module_mk_pos1_count_lifted_variants}/*"', 'A']]
OPERATION_10 gives  : [['mkfiles_pos1', 'P']]


OPERATION_11 string : nfsummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_11 origin : [['nfsummary', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : pipelinesummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_12 origin : [['pipelinesummary', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : results_pre0_split_vcf
	.toList()
	.flatten()
	          
	.set{ delayed_results_pre0_split_vcf }
OPERATION_13 origin : [['results_pre0_split_vcf', 'P']]
OPERATION_13 gives  : [['delayed_results_pre0_split_vcf', 'P']]


OPERATION_14 string : results_pre1_filtering_PASS
	.toList()
	.flatten()
	          
	.set{ delayed_results_pre1_filtering_PASS }
OPERATION_14 origin : [['results_pre1_filtering_PASS', 'P']]
OPERATION_14 gives  : [['delayed_results_pre1_filtering_PASS', 'P']]


OPERATION_15 string : results_001_liftover_mapped
	.toList()
	.flatten()
	          
	.set{ delayed_results_001_liftover_mapped }
OPERATION_15 origin : [['results_001_liftover_mapped', 'P']]
OPERATION_15 gives  : [['delayed_results_001_liftover_mapped', 'P']]


OPERATION_16 string : results_002_edit_vcf
	.toList()
	.flatten()
	          
	.set{ delayed_results_002_edit_vcf }
OPERATION_16 origin : [['results_002_edit_vcf', 'P']]
OPERATION_16 gives  : [['delayed_results_002_edit_vcf', 'P']]


OPERATION_17 string : delayed_results_002_edit_vcf
                                      
	.map{ file -> tuple(get_sample_prefix(file), file) }
	.groupTuple()
	          
	.set{ multiplechunks_from_results_002_edit_vcf }
OPERATION_17 origin : [['delayed_results_002_edit_vcf', 'P']]
OPERATION_17 gives  : [['multiplechunks_from_results_002_edit_vcf', 'P']]


OPERATION_18 string : results_003_concatenate_vcf
	.toList()
	.flatten()
	          
	.set{ delayed_results_003_concatenate_vcf }
OPERATION_18 origin : [['results_003_concatenate_vcf', 'P']]
OPERATION_18 gives  : [['delayed_results_003_concatenate_vcf', 'P']]


OPERATION_19 string : also_vcf_inputs
	.mix(also_results_003_concatenate_vcf)
	.map{ file -> tuple(get_sample_prefix(file), file) }
	.groupTuple()
	.set{ inputs_for_pos1 }
OPERATION_19 origin : [['also_vcf_inputs', 'P'], ['also_results_003_concatenate_vcf', 'P']]
OPERATION_19 gives  : [['inputs_for_pos1', 'P']]


