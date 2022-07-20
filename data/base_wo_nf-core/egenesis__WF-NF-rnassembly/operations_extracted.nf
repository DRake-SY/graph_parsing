OPERATION_1 string : Channel.fromPath(params.fasta, checkIfExists: true)
    .ifEmpty { exit 1, "Genome fasta file not found: ${params.fasta}" }
    .into { ch_fasta_for_hisat_index; fasta }
OPERATION_1 origin : [['params.fasta, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_fasta_for_hisat_index', 'P'], ['fasta', 'P']]


OPERATION_2 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_2 origin : [['params.multiqc_config', 'A']]
OPERATION_2 gives  : [['ch_multiqc_config', 'P']]


OPERATION_3 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_3 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_3 gives  : [['ch_output_docs', 'P']]


OPERATION_4 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { ch_trimming }
OPERATION_4 origin : [['params.readPaths', 'V']]
OPERATION_4 gives  : [['ch_trimming', 'P']]


OPERATION_5 string : Channel
        .fromFilePairs( params.reads, size: 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
        .into { ch_trimming }
OPERATION_5 origin : [['params.reads, size: 2', 'A']]
OPERATION_5 gives  : [['ch_trimming', 'P']]


OPERATION_6 string : Channel
    .fromPath(params.gtf, checkIfExists: true)
    .ifEmpty { exit 1, "GTF annotation file not found: ${params.gtf}" }
    .into { gtf_stringtieFPKM; gtf_makeHisatSplicesites; gtf_makeHISATindex; gtf_unify }
OPERATION_6 origin : [['params.gtf, checkIfExists: true', 'A']]
OPERATION_6 gives  : [['gtf_stringtieFPKM', 'P'], ['gtf_makeHisatSplicesites', 'P'], ['gtf_makeHISATindex', 'P'], ['gtf_unify', 'P']]


OPERATION_7 string : Channel
    .fromPath(params.tx, checkIfExists: true)
    .ifEmpty { exit 1, "Tx fasta file not found: ${params.tx}" }
    .into { tx_fasta }
OPERATION_7 origin : [['params.tx, checkIfExists: true', 'A']]
OPERATION_7 gives  : [['tx_fasta', 'P']]


OPERATION_8 string : Channel
    .fromPath(params.proteins, checkIfExists: true)
    .ifEmpty { exit 1, "Proteins fasta file not found: ${params.proteins}" }
    .into { prot_fasta; prot_fasta_ann; prot_fasta_qc }
OPERATION_8 origin : [['params.proteins, checkIfExists: true', 'A']]
OPERATION_8 gives  : [['prot_fasta', 'P'], ['prot_fasta_ann', 'P'], ['prot_fasta_qc', 'P']]


OPERATION_9 string : Channel
    .fromPath(params.ucsc_gtf, checkIfExists: true)
    .ifEmpty { exit 1, "UCSC GTF file not found: ${params.ucsc}" }
    .into {ucsc2unify}
OPERATION_9 origin : [['params.ucsc_gtf, checkIfExists: true', 'A']]
OPERATION_9 gives  : [['ucsc2unify', 'P']]


OPERATION_10 string : Channel.fromPath("$baseDir/assets/where_are_my_files.txt", checkIfExists: true)
       .into{ch_where_hisat2; ch_where_hisat2_sort}
OPERATION_10 origin : [['"$baseDir/assets/where_are_my_files.txt", checkIfExists: true', 'A']]
OPERATION_10 gives  : [['ch_where_hisat2', 'P'], ['ch_where_hisat2_sort', 'P']]


OPERATION_11 string : hs2_indices = Channel
        .fromPath("${params.hisat2_index}*", checkIfExists: true)
        .ifEmpty { exit 1, "HISAT2 index not found: ${params.hisat2_index}" }
OPERATION_11 origin : [['"${params.hisat2_index}*", checkIfExists: true', 'A']]
OPERATION_11 gives  : [['hs2_indices', 'P']]


OPERATION_12 string : Channel
        .fromPath(params.tx_assembled, checkIfExists: true)
        .ifEmpty { exit 1, "tx assembled file not found: ${params.gtf}" }
        .into { spades2blastn_tx; spades2blastn2parser; spades2qc }
OPERATION_12 origin : [['params.tx_assembled, checkIfExists: true', 'A']]
OPERATION_12 gives  : [['spades2blastn_tx', 'P'], ['spades2blastn2parser', 'P'], ['spades2qc', 'P']]


OPERATION_13 string : star_log = Channel.from(false)
OPERATION_13 origin : [['false', 'V']]
OPERATION_13 gives  : [['star_log', 'P']]


OPERATION_14 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_14 origin : [['summary', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : ch_trimming
       .into {ch_fastq1; ch_fastq2}
OPERATION_15 origin : [['ch_trimming', 'P']]
OPERATION_15 gives  : [['ch_fastq1', 'P'], ['ch_fastq2', 'P']]


OPERATION_16 string : ch_fastq1
    .map {sample -> sample[1][0]}
    .collect()
    .set { ch_fastq_r1}
OPERATION_16 origin : [['ch_fastq1', 'P']]
OPERATION_16 gives  : [['ch_fastq_r1', 'P']]


OPERATION_17 string : ch_fastq2
    .map {sample -> sample[1][1]}
    .collect()
    .set { ch_fastq_r2}
OPERATION_17 origin : [['ch_fastq2', 'P']]
OPERATION_17 gives  : [['ch_fastq_r2', 'P']]


