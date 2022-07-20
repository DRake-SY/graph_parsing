OPERATION_1 string : Channel
        .fromPath(params.seedfile)
        .ifEmpty { exit 1, "Cannot find any seed file matching: ${params.seedfile}." }
        .splitCsv(header:true)
        .map{ row -> tuple(row.sampleName, file(row.Reads))}
        .groupTuple(sort:true)
        .set { reads_concat }
OPERATION_1 origin : [['params.seedfile', 'A']]
OPERATION_1 gives  : [['reads_concat', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.reads)
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}." }
        .map {it -> tuple(params.prefix, it)}
        .groupTuple(sort:true)
        .set { reads_concat }
OPERATION_2 origin : [['params.reads', 'A']]
OPERATION_2 gives  : [['reads_concat', 'P']]


OPERATION_3 string : dedup_log = Channel.from(file("$baseDir/assets/no_dedup.yaml"))
OPERATION_3 origin : []
OPERATION_3 gives  : [['dedup_log', 'P']]


OPERATION_4 string : Channel.fromPath( "${params.artefacts}", checkIfExists: true ).set { artefacts }
OPERATION_4 origin : [['"${params.artefacts}", checkIfExists: true', 'A']]
OPERATION_4 gives  : [['artefacts', 'P']]


OPERATION_5 string : Channel.fromPath( "${params.phix174ill}", checkIfExists: true ).set { phix174ill }
OPERATION_5 origin : [['"${params.phix174ill}", checkIfExists: true', 'A']]
OPERATION_5 gives  : [['phix174ill', 'P']]


OPERATION_6 string : Channel.fromPath( "${params.adapters}", checkIfExists: true ).set { adapters }
OPERATION_6 origin : [['"${params.adapters}", checkIfExists: true', 'A']]
OPERATION_6 gives  : [['adapters', 'P']]


OPERATION_7 string : foreign_genome_ch = Channel.value(1)
OPERATION_7 origin : [['1', 'V']]
OPERATION_7 gives  : [['foreign_genome_ch', 'P']]


OPERATION_8 string : index_foreign_genome_log = Channel.from(file("$baseDir/assets/foreign_genome_indexing_mqc.yaml"))
OPERATION_8 origin : []
OPERATION_8 gives  : [['index_foreign_genome_log', 'P']]


OPERATION_9 string : index_foreign_genome_log = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['index_foreign_genome_log', 'P']]


OPERATION_10 string : ref_foreign_genome = Channel.from(file(params.foreign_genome_ref))
OPERATION_10 origin : []
OPERATION_10 gives  : [['ref_foreign_genome', 'P']]


OPERATION_11 string : concat_fq.into {read_files_fastqc; read_files_dedup; read_files_synthetic_contaminants}
OPERATION_11 origin : [['concat_fq', 'P']]
OPERATION_11 gives  : [['read_files_fastqc', 'P'], ['read_files_dedup', 'P'], ['read_files_synthetic_contaminants', 'P']]


OPERATION_12 string : summary.collect { k,v -> "${k.padRight(27)}: $v" }.join("\n")
OPERATION_12 origin : [['summary', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : to_synthetic_contaminants = read_files_synthetic_contaminants
OPERATION_13 origin : [['read_files_synthetic_contaminants', 'P']]
OPERATION_13 gives  : [['to_synthetic_contaminants', 'P']]


