OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nIf this is single-end data, please specify --singleEnd on the command line." }
    .into { raw_reads_fastqc; raw_reads_trimming; raw_reads_bwa }
OPERATION_1 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_1 gives  : [['raw_reads_fastqc', 'P'], ['raw_reads_trimming', 'P'], ['raw_reads_bwa', 'P']]


OPERATION_2 string : Channel
        .fromPath(params.multiqc_config, checkIfExists: true)
        .set { ch_config_for_multiqc }
OPERATION_2 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_config_for_multiqc', 'P']]


OPERATION_3 string : Channel
        .fromPath("${params.fasta}.*")
        .into { bwa_index; bwa_index_pileup }
OPERATION_3 origin : [['"${params.fasta}.*"', 'A']]
OPERATION_3 gives  : [['bwa_index', 'P'], ['bwa_index_pileup', 'P']]


OPERATION_4 string : trimmomatic_results = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['trimmomatic_results', 'P']]


OPERATION_5 string : trimmomatic_fastqc_reports = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['trimmomatic_fastqc_reports', 'P']]


OPERATION_6 string : summary.collect { k,v -> "${k.padRight(21)}: $v" }.join("\n")
OPERATION_6 origin : [['summary', 'P']]
OPERATION_6 gives  : []


OPERATION_7 string : raw_reads_bwa = trimmed_paired_reads_bwa
OPERATION_7 origin : [['trimmed_paired_reads_bwa', 'P']]
OPERATION_7 gives  : [['raw_reads_bwa', 'P']]


OPERATION_8 string : bam_samtools = bam_dedup_mpileup
OPERATION_8 origin : [['bam_dedup_mpileup', 'P']]
OPERATION_8 gives  : [['bam_samtools', 'P']]


OPERATION_9 string : bai_samtools = bai_dedup_mpileup
OPERATION_9 origin : [['bai_dedup_mpileup', 'P']]
OPERATION_9 gives  : [['bai_samtools', 'P']]


OPERATION_10 string : bam_stats = dedup_bam_stats
OPERATION_10 origin : [['dedup_bam_stats', 'P']]
OPERATION_10 gives  : [['bam_stats', 'P']]


OPERATION_11 string : bai_bamstats = bai_dedup_stats
OPERATION_11 origin : [['bai_dedup_stats', 'P']]
OPERATION_11 gives  : [['bai_bamstats', 'P']]


OPERATION_12 string : bedtools_coverage = dedup_bedtools_coverage
OPERATION_12 origin : [['dedup_bedtools_coverage', 'P']]
OPERATION_12 gives  : [['bedtools_coverage', 'P']]


OPERATION_13 string : bai_bedtools_coverage = bai_dedup_bedtools_coverage
OPERATION_13 origin : [['bai_dedup_bedtools_coverage', 'P']]
OPERATION_13 gives  : [['bai_bedtools_coverage', 'P']]


OPERATION_14 string : picard_stats = dedup_picard_stats
OPERATION_14 origin : [['dedup_picard_stats', 'P']]
OPERATION_14 gives  : [['picard_stats', 'P']]


OPERATION_15 string : bai_picard_stats = bai_dedup_picard_stats
OPERATION_15 origin : [['bai_dedup_picard_stats', 'P']]
OPERATION_15 gives  : [['bai_picard_stats', 'P']]


