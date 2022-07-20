OPERATION_1 string : Channel.fromPath(file(params.barcodes))
	.ifEmpty { exit 1, "Could not find the barcode fasta file...please check the path." }
	.set { barcodes }
OPERATION_1 origin : [['file(params.barcodes', 'A']]
OPERATION_1 gives  : [['barcodes', 'P']]


OPERATION_2 string : Channel.fromPath(barcodes_ref_fa)
	.ifEmpty { exit 1, "Could not find the built-in barcode fasta file...this should not happen!" }
        .set { barcodes }
OPERATION_2 origin : [['barcodes_ref_fa', 'A']]
OPERATION_2 gives  : [['barcodes', 'P']]


OPERATION_3 string : Channel
		.fromPath(params.bam)
		.ifEmpty { exit 1, "Could not find an input bam file" }
		.map { b -> [ file(b).getBaseName(), file(b), file("${b}.pbi") ] }
		.set { bamFile }
OPERATION_3 origin : [['params.bam', 'A']]
OPERATION_3 gives  : [['bamFile', 'P']]


OPERATION_4 string : ReadChunksGrouped = ReadChunks.groupTuple()
OPERATION_4 origin : [['ReadChunks', 'P']]
OPERATION_4 gives  : [['ReadChunksGrouped', 'P']]


OPERATION_5 string : mergedBam.into { HiFiBam; bamQC }
OPERATION_5 origin : [['mergedBam', 'P']]
OPERATION_5 gives  : [['HiFiBam', 'P'], ['bamQC', 'P']]


OPERATION_6 string : mergedBam = bamFile
OPERATION_6 origin : [['bamFile', 'P']]
OPERATION_6 gives  : [['mergedBam', 'P']]


OPERATION_7 string : final_bams = HiFiBam
OPERATION_7 origin : [['HiFiBam', 'P']]
OPERATION_7 gives  : [['final_bams', 'P']]


