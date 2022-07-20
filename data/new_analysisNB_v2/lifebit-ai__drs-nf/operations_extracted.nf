OPERATION_1 string : Channel
    .fromPath(params.reads)
    .ifEmpty { exit 1, "Cannot find CSV reads file : ${params.reads}" }
    .splitCsv(skip:1)
    .map { subj_id, file_name, md5sum, obj_id, file_size -> [subj_id, file_name, md5sum, obj_id, file_size] }
    .set { ch_gtex_gen3_ids }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['ch_gtex_gen3_ids', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.key_file)
    .ifEmpty { exit 1, "Key file not found: ${params.key_file}" }
    .set { ch_key_file }
OPERATION_2 origin : [['params.key_file', 'A']]
OPERATION_2 gives  : [['ch_key_file', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.genome_fasta)
    .ifEmpty { exit 1, "${params.genome_fasta} is not present" }
    .set { ch_genome_fasta }
OPERATION_3 origin : [['params.genome_fasta', 'A']]
OPERATION_3 gives  : [['ch_genome_fasta', 'P']]


