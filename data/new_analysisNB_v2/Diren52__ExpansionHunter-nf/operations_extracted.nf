OPERATION_1 string : Channel.fromPath(params.reads, checkIfExists: true)
			.ifEmpty { exit 1, "BAM/CRAM file not found: ${params.reads}" }
OPERATION_1 origin : [['params.reads, checkIfExists: true', 'A']]
OPERATION_1 gives  : []


OPERATION_2 string : Channel.fromPath(params.reads_index, checkIfExists: true)
				.ifEmpty {exit 1, "Index of BAM/CRAM file not found: ${params.reads_index}" }
OPERATION_2 origin : [['params.reads_index, checkIfExists: true', 'A']]
OPERATION_2 gives  : []


OPERATION_3 string : reference_file = Channel.fromPath(params.reference, checkIfExists: true)
					.ifEmpty { exit 1, "FASTA reference file not found: ${params.reference}" }
OPERATION_3 origin : [['params.reference, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['reference_file', 'P']]


OPERATION_4 string : variant_file = Channel.fromPath(params.variant_catalog, checkIfExists: true)
					.ifEmpty {exit 1, "Variant Catalog file not found: ${params.variant_catalog}" }
OPERATION_4 origin : [['params.variant_catalog, checkIfExists: true', 'A']]
OPERATION_4 gives  : [['variant_file', 'P']]


