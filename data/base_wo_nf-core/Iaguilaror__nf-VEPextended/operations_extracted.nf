OPERATION_1 string : Channel
  .fromPath("${params.vcffile}*")
	.toList()
  .set{ vcf_inputs }
OPERATION_1 origin : [['"${params.vcffile}*"', 'A']]
OPERATION_1 gives  : [['vcf_inputs', 'P']]


OPERATION_2 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-filter-vcf/*")
	.toList()
	.set{ mkfiles_pre1 }
OPERATION_2 origin : [['"${workflow.projectDir}/mkmodules/mk-filter-vcf/*"', 'A']]
OPERATION_2 gives  : [['mkfiles_pre1', 'P']]


OPERATION_3 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-extract-chromosomes/*")
	.toList()
	.set{ mkfiles_pre2 }
OPERATION_3 origin : [['"${workflow.projectDir}/mkmodules/mk-extract-chromosomes/*"', 'A']]
OPERATION_3 gives  : [['mkfiles_pre2', 'P']]


OPERATION_4 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-split-chromosomes/*")
	.toList()
	.set{ mkfiles_pre3 }
OPERATION_4 origin : [['"${workflow.projectDir}/mkmodules/mk-split-chromosomes/*"', 'A']]
OPERATION_4 gives  : [['mkfiles_pre3', 'P']]


OPERATION_5 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-untangle-multiallelic/*")
	.toList()
	.set{ mkfiles_001 }
OPERATION_5 origin : [['"${workflow.projectDir}/mkmodules/mk-untangle-multiallelic/*"', 'A']]
OPERATION_5 gives  : [['mkfiles_001', 'P']]


OPERATION_6 string : Channel
	.fromPath("${params.reference_dbsnp}*")
	.toList()
	.set{ reference_dbSNP }
OPERATION_6 origin : [['"${params.reference_dbsnp}*"', 'A']]
OPERATION_6 gives  : [['reference_dbSNP', 'P']]


OPERATION_7 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-annotate-rsid/*")
	.toList()
	.set{ mkfiles_002 }
OPERATION_7 origin : [['"${workflow.projectDir}/mkmodules/mk-annotate-rsid/*"', 'A']]
OPERATION_7 gives  : [['mkfiles_002', 'P']]


OPERATION_8 string : cadd_snv = Channel.fromPath("${params.cadd_snv_reference}*")
OPERATION_8 origin : [['"${params.cadd_snv_reference}*"', 'A']]
OPERATION_8 gives  : [['cadd_snv', 'P']]


OPERATION_9 string : cadd_indel = Channel.fromPath("${params.cadd_indel_reference}*")
OPERATION_9 origin : [['"${params.cadd_indel_reference}*"', 'A']]
OPERATION_9 gives  : [['cadd_indel', 'P']]


OPERATION_10 string : genome_reference = Channel.fromPath("${params.genome_reference}*")
OPERATION_10 origin : [['"${params.genome_reference}*"', 'A']]
OPERATION_10 gives  : [['genome_reference', 'P']]


OPERATION_11 string : gnomad_reference = Channel.fromPath("${params.gnomad_reference}*")
OPERATION_11 origin : [['"${params.gnomad_reference}*"', 'A']]
OPERATION_11 gives  : [['gnomad_reference', 'P']]


OPERATION_12 string : gnomad_coverage_reference = Channel.fromPath("${params.gnomad_coverage_reference}*")
OPERATION_12 origin : [['"${params.gnomad_coverage_reference}*"', 'A']]
OPERATION_12 gives  : [['gnomad_coverage_reference', 'P']]


OPERATION_13 string : genehancer_reference = Channel.fromPath("${params.genehancer_reference}*")
OPERATION_13 origin : [['"${params.genehancer_reference}*"', 'A']]
OPERATION_13 gives  : [['genehancer_reference', 'P']]


OPERATION_14 string : gwascatalog_reference = Channel.fromPath("${params.gwascatalog_reference}*")
OPERATION_14 origin : [['"${params.gwascatalog_reference}*"', 'A']]
OPERATION_14 gives  : [['gwascatalog_reference', 'P']]


OPERATION_15 string : clinvar_reference = Channel.fromPath("${params.clinvar_reference}*")
OPERATION_15 origin : [['"${params.clinvar_reference}*"', 'A']]
OPERATION_15 gives  : [['clinvar_reference', 'P']]


OPERATION_16 string : mirbase_reference = Channel.fromPath("${params.mirbase_reference}*")
OPERATION_16 origin : [['"${params.mirbase_reference}*"', 'A']]
OPERATION_16 gives  : [['mirbase_reference', 'P']]


OPERATION_17 string : pgkb_reference = Channel.fromPath("${params.pharmgkb_drug_reference}*")
OPERATION_17 origin : [['"${params.pharmgkb_drug_reference}*"', 'A']]
OPERATION_17 gives  : [['pgkb_reference', 'P']]


OPERATION_18 string : project_coverage_reference = Channel.fromPath("${params.project_coverage}*")
OPERATION_18 origin : [['"${params.project_coverage}*"', 'A']]
OPERATION_18 gives  : [['project_coverage_reference', 'P']]


OPERATION_19 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-vep-extended/*")
	.toList()
	.set{ mkfiles_003 }
OPERATION_19 origin : [['"${workflow.projectDir}/mkmodules/mk-vep-extended/*"', 'A']]
OPERATION_19 gives  : [['mkfiles_003', 'P']]


OPERATION_20 string : Channel
	.fromPath("${workflow.projectDir}/mkmodules/mk-rejoin-chromosomes/*")
	.toList()
	.set{ mkfiles_pos1 }
OPERATION_20 origin : [['"${workflow.projectDir}/mkmodules/mk-rejoin-chromosomes/*"', 'A']]
OPERATION_20 gives  : [['mkfiles_pos1', 'P']]


OPERATION_21 string : nfsummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_21 origin : [['nfsummary', 'P']]
OPERATION_21 gives  : []


OPERATION_22 string : pipelinesummary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_22 origin : [['pipelinesummary', 'P']]
OPERATION_22 gives  : []


OPERATION_23 string : cadd_snv
	.mix(
		cadd_indel
		,genome_reference
		,gnomad_reference
		,gnomad_coverage_reference
		,genehancer_reference
		,gwascatalog_reference
		,clinvar_reference
		,mirbase_reference
		,pgkb_reference
		,project_coverage_reference
	)
	.toList()
	.set{ references_for_VEP }
OPERATION_23 origin : [['cadd_snv', 'P'], ['cadd_indel', 'P'], ['genome_reference', 'P'], ['gnomad_reference', 'P'], ['gnomad_coverage_reference', 'P'], ['genehancer_reference', 'P'], ['gwascatalog_reference', 'P'], ['clinvar_reference', 'P'], ['mirbase_reference', 'P'], ['pgkb_reference', 'P'], ['project_coverage_reference', 'P']]
OPERATION_23 gives  : [['references_for_VEP', 'P']]


OPERATION_24 string : results_003_vep_extended
  .toList()
  .set{ inputs_for_003 }
OPERATION_24 origin : [['results_003_vep_extended', 'P']]
OPERATION_24 gives  : [['inputs_for_003', 'P']]


