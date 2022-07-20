OPERATION_1 string : g = Channel
    .fromPath(params.genome, checkIfExists: true)
    .ifEmpty { exit 1, "Genome FASTA file not found: ${params.genome}" }
OPERATION_1 origin : [['params.genome, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['g', 'P']]


OPERATION_2 string : r1 = Channel
    .fromPath(params.reads1, checkIfExists: true)
    .ifEmpty { exit 1, "Reads 1 FASTQ file not found: ${params.reads1}" }
OPERATION_2 origin : [['params.reads1, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['r1', 'P']]


OPERATION_3 string : r2 = Channel
    .fromPath(params.reads2, checkIfExists: true)
    .ifEmpty { exit 1, "Reads 2 FASTQ file not found: ${params.reads2}" }
OPERATION_3 origin : [['params.reads2, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['r2', 'P']]


OPERATION_4 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_4 origin : [['summary', 'P']]
OPERATION_4 gives  : []


OPERATION_5 string : genome_dir.into { genome_dir_1; genome_dir_2 }
OPERATION_5 origin : [['genome_dir', 'P']]
OPERATION_5 gives  : [['genome_dir_1', 'P'], ['genome_dir_2', 'P']]


