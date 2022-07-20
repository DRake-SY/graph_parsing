OPERATION_1 string : Channel
  .fromPath("${params.vcf}")
  .set{ vcf_input }
OPERATION_1 origin : [['"${params.vcf}"', 'A']]
OPERATION_1 gives  : [['vcf_input', 'P']]


OPERATION_2 string : Channel
	.fromPath("${module_mk_pre1_custom_filter}/*")
	.toList()
	.set{ mkfiles_pre1 }
OPERATION_2 origin : [['"${module_mk_pre1_custom_filter}/*"', 'A']]
OPERATION_2 gives  : [['mkfiles_pre1', 'P']]


OPERATION_3 string : Channel
	.fromPath("${module_mk_pre2_separate_snv_indel}/*")
	.toList()
	.set{ mkfiles_pre2 }
OPERATION_3 origin : [['"${module_mk_pre2_separate_snv_indel}/*"', 'A']]
OPERATION_3 gives  : [['mkfiles_pre2', 'P']]


OPERATION_4 string : Channel
	.fromPath("${module_mk_pre3s1_separate_rare_low_common_freq}/*")
	.toList()
	.set{ mkfiles_pre3s1 }
OPERATION_4 origin : [['"${module_mk_pre3s1_separate_rare_low_common_freq}/*"', 'A']]
OPERATION_4 gives  : [['mkfiles_pre3s1', 'P']]


OPERATION_5 string : Channel
	.fromPath("${module_mk_pre3s2_separate_selection_signals}/*")
	.toList()
	.set{ mkfiles_pre3s2 }
OPERATION_5 origin : [['"${module_mk_pre3s2_separate_selection_signals}/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_pre3s2', 'P']]


OPERATION_6 string : Channel
	.fromPath("${module_mk_pre3s3_separate_lowEAS_lowEUR}/*")
	.toList()
	.set{ mkfiles_pre3s3 }
OPERATION_6 origin : [['"${module_mk_pre3s3_separate_lowEAS_lowEUR}/*"', 'A']]
OPERATION_6 gives  : [['mkfiles_pre3s3', 'P']]


OPERATION_7 string : Channel
	.fromPath("${module_mk_pre3s4_separate_commonAMR_lowEUR}/*")
	.toList()
	.set{ mkfiles_pre3s4 }
OPERATION_7 origin : [['"${module_mk_pre3s4_separate_commonAMR_lowEUR}/*"', 'A']]
OPERATION_7 gives  : [['mkfiles_pre3s4', 'P']]


OPERATION_8 string : Channel
	.fromPath("${module_mk_001_get_clinvar_omim}/*")
	.toList()
	.set{ mkfiles_001 }
OPERATION_8 origin : [['"${module_mk_001_get_clinvar_omim}/*"', 'A']]
OPERATION_8 gives  : [['mkfiles_001', 'P']]


OPERATION_9 string : Channel
	.fromPath("${module_mk_002_get_GeneHancer}/*")
	.toList()
	.set{ mkfiles_002 }
OPERATION_9 origin : [['"${module_mk_002_get_GeneHancer}/*"', 'A']]
OPERATION_9 gives  : [['mkfiles_002', 'P']]


OPERATION_10 string : Channel
	.fromPath("${module_mk_003_get_GWASCatalog}/*")
	.toList()
	.set{ mkfiles_003 }
OPERATION_10 origin : [['"${module_mk_003_get_GWASCatalog}/*"', 'A']]
OPERATION_10 gives  : [['mkfiles_003', 'P']]


OPERATION_11 string : Channel
	.fromPath("${module_mk_004_get_miRNA}/*")
	.toList()
	.set{ mkfiles_004 }
OPERATION_11 origin : [['"${module_mk_004_get_miRNA}/*"', 'A']]
OPERATION_11 gives  : [['mkfiles_004', 'P']]


OPERATION_12 string : Channel
	.fromPath("${module_mk_005_get_novel_and_known}/*")
	.toList()
	.set{ mkfiles_005 }
OPERATION_12 origin : [['"${module_mk_005_get_novel_and_known}/*"', 'A']]
OPERATION_12 gives  : [['mkfiles_005', 'P']]


OPERATION_13 string : Channel
	.fromPath("${module_mk_006_get_coding}/*")
	.toList()
	.set{ mkfiles_006 }
OPERATION_13 origin : [['"${module_mk_006_get_coding}/*"', 'A']]
OPERATION_13 gives  : [['mkfiles_006', 'P']]


OPERATION_14 string : Channel
	.fromPath("${module_mk_007_get_PGKB}/*")
	.toList()
	.set{ mkfiles_007 }
OPERATION_14 origin : [['"${module_mk_007_get_PGKB}/*"', 'A']]
OPERATION_14 gives  : [['mkfiles_007', 'P']]


OPERATION_15 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-get-utr-variants/*")
	.toList()
	.set{ mkfiles_008 }
OPERATION_15 origin : [['"${workflow.projectDir}/mkmodules/mk-get-utr-variants/*"', 'A']]
OPERATION_15 gives  : [['mkfiles_008', 'P']]


OPERATION_16 string : Channel
	.fromPath("${module_mk_pos1_vcf2tsv}/*")
	.toList()
	.set{ mkfiles_pos1 }
OPERATION_16 origin : [['"${module_mk_pos1_vcf2tsv}/*"', 'A']]
OPERATION_16 gives  : [['mkfiles_pos1', 'P']]


OPERATION_17 string : Channel
	.fromPath("${module_mk_pos2_count_variants}/*")
	.toList()
	.set{ mkfiles_pos2 }
OPERATION_17 origin : [['"${module_mk_pos2_count_variants}/*"', 'A']]
OPERATION_17 gives  : [['mkfiles_pos2', 'P']]


OPERATION_18 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-QC-vep-consequence-plot/*")
	.toList()
	.set{ mkfiles_pos5 }
OPERATION_18 origin : [['"${workflow.projectDir}/mkmodules/mk-QC-vep-consequence-plot/*"', 'A']]
OPERATION_18 gives  : [['mkfiles_pos5', 'P']]


OPERATION_19 string : nfsummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_19 origin : [['nfsummary', 'P']]
OPERATION_19 gives  : []


OPERATION_20 string : pipelinesummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_20 origin : [['pipelinesummary', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : pre2_results_for_001
	.mix(pre3s1_results_for_001, pre3s2_results_for_001, pre3s3_results_for_001, pre3s4_results_for_001)
	.set{ inputs_001 }
OPERATION_21 origin : [['pre2_results_for_001', 'P'], ['pre3s1_results_for_001', 'P'], ['pre3s2_results_for_001', 'P'], ['pre3s3_results_for_001', 'P'], ['pre3s4_results_for_001', 'P']]
OPERATION_21 gives  : [['inputs_001', 'P']]


OPERATION_22 string : pre2_results_for_002
	.mix(pre3s1_results_for_002, pre3s2_results_for_002, pre3s3_results_for_002, pre3s4_results_for_002)
	.set{ inputs_002 }
OPERATION_22 origin : [['pre2_results_for_002', 'P'], ['pre3s1_results_for_002', 'P'], ['pre3s2_results_for_002', 'P'], ['pre3s3_results_for_002', 'P'], ['pre3s4_results_for_002', 'P']]
OPERATION_22 gives  : [['inputs_002', 'P']]


OPERATION_23 string : pre2_results_for_003
	.mix(pre3s1_results_for_003, pre3s2_results_for_003, pre3s3_results_for_003, pre3s4_results_for_003)
	.set{ inputs_003 }
OPERATION_23 origin : [['pre2_results_for_003', 'P'], ['pre3s1_results_for_003', 'P'], ['pre3s2_results_for_003', 'P'], ['pre3s3_results_for_003', 'P'], ['pre3s4_results_for_003', 'P']]
OPERATION_23 gives  : [['inputs_003', 'P']]


OPERATION_24 string : pre2_results_for_004
	.mix(pre3s1_results_for_004, pre3s2_results_for_004, pre3s3_results_for_004, pre3s4_results_for_004)
	.set{ inputs_004 }
OPERATION_24 origin : [['pre2_results_for_004', 'P'], ['pre3s1_results_for_004', 'P'], ['pre3s2_results_for_004', 'P'], ['pre3s3_results_for_004', 'P'], ['pre3s4_results_for_004', 'P']]
OPERATION_24 gives  : [['inputs_004', 'P']]


OPERATION_25 string : pre2_results_for_005
	.mix(pre3s1_results_for_005, pre3s2_results_for_005, pre3s3_results_for_005, pre3s4_results_for_005)
	.set{ inputs_005 }
OPERATION_25 origin : [['pre2_results_for_005', 'P'], ['pre3s1_results_for_005', 'P'], ['pre3s2_results_for_005', 'P'], ['pre3s3_results_for_005', 'P'], ['pre3s4_results_for_005', 'P']]
OPERATION_25 gives  : [['inputs_005', 'P']]


OPERATION_26 string : pre2_results_for_006
	.mix(pre3s1_results_for_006, pre3s2_results_for_006, pre3s3_results_for_006, pre3s4_results_for_006)
	.set{ inputs_006 }
OPERATION_26 origin : [['pre2_results_for_006', 'P'], ['pre3s1_results_for_006', 'P'], ['pre3s2_results_for_006', 'P'], ['pre3s3_results_for_006', 'P'], ['pre3s4_results_for_006', 'P']]
OPERATION_26 gives  : [['inputs_006', 'P']]


OPERATION_27 string : pre2_results_for_007
	.mix(pre3s1_results_for_007, pre3s2_results_for_007, pre3s3_results_for_007, pre3s4_results_for_007)
	.set{ inputs_007 }
OPERATION_27 origin : [['pre2_results_for_007', 'P'], ['pre3s1_results_for_007', 'P'], ['pre3s2_results_for_007', 'P'], ['pre3s3_results_for_007', 'P'], ['pre3s4_results_for_007', 'P']]
OPERATION_27 gives  : [['inputs_007', 'P']]


OPERATION_28 string : pre2_results_for_008
	.mix(pre3s1_results_for_008, pre3s2_results_for_008, pre3s3_results_for_008, pre3s4_results_for_008)
	.set{ inputs_008 }
OPERATION_28 origin : [['pre2_results_for_008', 'P'], ['pre3s1_results_for_008', 'P'], ['pre3s2_results_for_008', 'P'], ['pre3s3_results_for_008', 'P'], ['pre3s4_results_for_008', 'P']]
OPERATION_28 gives  : [['inputs_008', 'P']]


OPERATION_29 string : results_001_get_clinvar_omim
	.mix(results_002_get_GeneHancer, results_003_get_GWASCatalog, results_004_get_miRNA, results_005_get_novel_and_known, results_006_get_coding, results_007_get_PGKB, results_008_get_utr)
	.mix(pre2_results_for_pos1, pre3s1_results_for_pos1, pre3s2_results_for_pos1, pre3s3_results_for_pos1, pre3s4_results_for_pos1)
	.into{ inputs_pos1; pre_inputs_pos4 }
OPERATION_29 origin : [['results_001_get_clinvar_omim', 'P'], ['results_002_get_GeneHancer', 'P'], ['results_003_get_GWASCatalog', 'P'], ['results_004_get_miRNA', 'P'], ['results_005_get_novel_and_known', 'P'], ['results_006_get_coding', 'P'], ['results_007_get_PGKB', 'P'], ['results_008_get_utr', 'P'], ['pre2_results_for_pos1', 'P'], ['pre3s1_results_for_pos1', 'P'], ['pre3s2_results_for_pos1', 'P'], ['pre3s3_results_for_pos1', 'P'], ['pre3s4_results_for_pos1', 'P']]
OPERATION_29 gives  : [['inputs_pos1', 'P'], ['pre_inputs_pos4', 'P']]


OPERATION_30 string : results_pos1_vcf2tsv
	.flatten()
	.toList()
	.into{ inputs_pos2; inputs_pos3 }
OPERATION_30 origin : [['results_pos1_vcf2tsv', 'P']]
OPERATION_30 gives  : [['inputs_pos2', 'P'], ['inputs_pos3', 'P']]


OPERATION_31 string : pre_inputs_pos4
	.mix(also_results_pre1_custom_filter)
	.flatten()
	.toList()
	.set{ inputs_pos4 }
OPERATION_31 origin : [['pre_inputs_pos4', 'P'], ['also_results_pre1_custom_filter', 'P']]
OPERATION_31 gives  : [['inputs_pos4', 'P']]


