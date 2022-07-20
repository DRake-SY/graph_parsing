OPERATION_1 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_1 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_1 gives  : [['ch_output_docs', 'P']]


OPERATION_2 string : Channel
    .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nIf this is single-end data, please specify --singleEnd on the command line." }
    .into { raw_reads_fastqc; raw_reads_trimming }
OPERATION_2 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_2 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimming', 'P']]


OPERATION_3 string : Channel
        .fromPath(params.host_index)
        .ifEmpty { exit 1, "Host fasta index not found: ${params.host_index}" }
        .into { host_index_files }
OPERATION_3 origin : [['params.host_index', 'A']]
OPERATION_3 gives  : [['host_index_files', 'P']]


OPERATION_4 string : Channel
        .fromPath(params.viral_index)
        .ifEmpty { exit 1, "Viral fasta index not found: ${params.viral_index}" }
        .into { viral_index_files; viral_index_files_ivar; viral_index_files_variant_calling }
OPERATION_4 origin : [['params.viral_index', 'A']]
OPERATION_4 gives  : [['viral_index_files', 'P'], ['viral_index_files_ivar', 'P'], ['viral_index_files_variant_calling', 'P']]


OPERATION_5 string : summary.collect { k,v -> "${k.padRight(21)}: $v" }.join("\n")
OPERATION_5 origin : [['summary', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : mapping_virus_sorted_bam_variant_calling
      .set {sorted_bam_variant_calling}
OPERATION_6 origin : [['mapping_virus_sorted_bam_variant_calling', 'P']]
OPERATION_6 gives  : [['sorted_bam_variant_calling', 'P']]


OPERATION_7 string : mapping_virus_bai_variant_calling
      .set {bam_bai_variant_calling}
OPERATION_7 origin : [['mapping_virus_bai_variant_calling', 'P']]
OPERATION_7 gives  : [['bam_bai_variant_calling', 'P']]


OPERATION_8 string : mapping_virus_sorted_bam_consensus
      .set {sorted_bam_consensus}
OPERATION_8 origin : [['mapping_virus_sorted_bam_consensus', 'P']]
OPERATION_8 gives  : [['sorted_bam_consensus', 'P']]


OPERATION_9 string : mapping_virus_bai_consensus
      .set {bai_consensus}
OPERATION_9 origin : [['mapping_virus_bai_consensus', 'P']]
OPERATION_9 gives  : [['bai_consensus', 'P']]


