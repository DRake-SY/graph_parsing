OPERATION_1 string : Channel
    .fromFilePairs(reads, size: 2)
    .ifEmpty { exit 1, "Cannot find any reads matching: ${reads}" }
    .set { reads_ch }
OPERATION_1 origin : [['reads, size: 2', 'A']]
OPERATION_1 gives  : [['reads_ch', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.fasta)
        .ifEmpty { exit 1, "FASTA annotation file not found: ${params.fasta}" }
        .set { ch_fasta_for_hisat_index }
OPERATION_2 origin : [['params.fasta', 'A']]
OPERATION_2 gives  : [['ch_fasta_for_hisat_index', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.hisat2_index)
        .ifEmpty { exit 1, "Folder containing Hisat2 indexes for reference genome not found: ${params.hisat2_index}" }
        .set { hs2_indices }
OPERATION_3 origin : [['params.hisat2_index', 'A']]
OPERATION_3 gives  : [['hs2_indices', 'P']]


OPERATION_4 string : hisat2_index_name = Channel.value( "${params.hisat2_index_name}" )
OPERATION_4 origin : []
OPERATION_4 gives  : [['hisat2_index_name', 'P']]


