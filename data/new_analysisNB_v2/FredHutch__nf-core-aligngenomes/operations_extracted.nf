OPERATION_1 string : reads_ch = Channel
    .from(params.reads.split(","))
    .map { it -> file(it) }
    .flatten()
    .ifEmpty { exit 1, "params.reads was empty - no input files supplied" }
OPERATION_1 origin : []
OPERATION_1 gives  : [['reads_ch', 'P']]


OPERATION_2 string : genomes_ch = Channel
    .from(params.genomes.split(","))
    .map { it -> file(it) }
    .ifEmpty { exit 1, "params.genomes was empty - no input files supplied" }
OPERATION_2 origin : []
OPERATION_2 gives  : [['genomes_ch', 'P']]


