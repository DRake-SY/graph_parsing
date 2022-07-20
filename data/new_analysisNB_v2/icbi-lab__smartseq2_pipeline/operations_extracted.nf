OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : Channel
        .from(params.readPaths)
        .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
        .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
        .into { read_files_fastqc; read_files_star; read_files_bracer; read_files_tracer }
OPERATION_3 origin : [['params.readPaths', 'V']]
OPERATION_3 gives  : [['read_files_fastqc', 'P'], ['read_files_star', 'P'], ['read_files_bracer', 'P'], ['read_files_tracer', 'P']]


OPERATION_4 string : Channel
        .fromFilePairs( params.reads, size: 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!" }
        .into { read_files_fastqc; read_files_star; read_files_bracer; read_files_tracer }
OPERATION_4 origin : [['params.reads, size: 2', 'A']]
OPERATION_4 gives  : [['read_files_fastqc', 'P'], ['read_files_star', 'P'], ['read_files_bracer', 'P'], ['read_files_tracer', 'P']]


OPERATION_5 string : Channel.fromPath(fasta).into { fasta_star_idx; fasta_rsem_ref }
OPERATION_5 origin : [['fasta', 'A']]
OPERATION_5 gives  : [['fasta_star_idx', 'P'], ['fasta_rsem_ref', 'P']]


OPERATION_6 string : Channel.fromPath(gtf).into { gtf_star_idx ; gtf_rsem_ref; gtf_feature_counts }
OPERATION_6 origin : [['gtf', 'A']]
OPERATION_6 gives  : [['gtf_star_idx', 'P'], ['gtf_rsem_ref', 'P'], ['gtf_feature_counts', 'P']]


OPERATION_7 string : star_index = Channel
            .fromPath(params.star_index, checkIfExists: true)
            .ifEmpty { exit 1, "STAR index not found: ${params.star_index}" }
OPERATION_7 origin : [['params.star_index, checkIfExists: true', 'A']]
OPERATION_7 gives  : [['star_index', 'P']]


OPERATION_8 string : rsem_ref = Channel
            .fromPath(params.rsem_ref, checkIfExists: true)
            .ifEmpty { exit 1, "RSEM reference not found: ${params.rsem_ref}" }
OPERATION_8 origin : [['params.rsem_ref, checkIfExists: true', 'A']]
OPERATION_8 gives  : [['rsem_ref', 'P']]


OPERATION_9 string : count_mqc = Channel.from(false)
OPERATION_9 origin : [['false', 'V']]
OPERATION_9 gives  : [['count_mqc', 'P']]


OPERATION_10 string : rsem_mqc = Channel.from(false)
OPERATION_10 origin : [['false', 'V']]
OPERATION_10 gives  : [['rsem_mqc', 'P']]


OPERATION_11 string : rsem_mqc = Channel.from(false)
OPERATION_11 origin : [['false', 'V']]
OPERATION_11 gives  : [['rsem_mqc', 'P']]


OPERATION_12 string : count_mqc = Channel.from(false)
OPERATION_12 origin : [['false', 'V']]
OPERATION_12 gives  : [['count_mqc', 'P']]


OPERATION_13 string : bam_mqc = Channel.from(false)
OPERATION_13 origin : [['false', 'V']]
OPERATION_13 gives  : [['bam_mqc', 'P']]


OPERATION_14 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_14 origin : [['summary', 'P']]
OPERATION_14 gives  : []


