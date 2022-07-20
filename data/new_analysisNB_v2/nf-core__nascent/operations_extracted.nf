OPERATION_1 string : ch_multiqc_config = Channel.fromPath(params.multiqc_config)
OPERATION_1 origin : [['params.multiqc_config', 'A']]
OPERATION_1 gives  : [['ch_multiqc_config', 'P']]


OPERATION_2 string : ch_output_docs = Channel.fromPath("$baseDir/docs/output.md")
OPERATION_2 origin : [['"$baseDir/docs/output.md"', 'A']]
OPERATION_2 gives  : [['ch_output_docs', 'P']]


OPERATION_3 string : Channel.fromPath(params.fasta)
           .ifEmpty { exit 1, "Fasta file not found: ${params.fasta}" }
           .into { genome_fasta; ch_fasta_for_hisat_index}
OPERATION_3 origin : [['params.fasta', 'A']]
OPERATION_3 gives  : [['genome_fasta', 'P'], ['ch_fasta_for_hisat_index', 'P']]


OPERATION_4 string : Channel
        .fromPath(params.chrom_sizes, checkIfExists: true)
        .ifEmpty { exit 1, "Chrom sizes file not found: ${params.chrom_sizes}" }
        .into { chrom_sizes_for_bed;
                chrom_sizes_for_bigwig;
                chrom_sizes_for_igv }
OPERATION_4 origin : [['params.chrom_sizes, checkIfExists: true', 'A']]
OPERATION_4 gives  : [['chrom_sizes_for_bed', 'P'], ['chrom_sizes_for_bigwig', 'P'], ['chrom_sizes_for_igv', 'P']]


OPERATION_5 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0])]] }
            .dump()
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { fastq_reads_qc; fastq_reads_trim; fastq_reads_gzip }
OPERATION_5 origin : [['params.readPaths', 'V']]
OPERATION_5 gives  : [['fastq_reads_qc', 'P'], ['fastq_reads_trim', 'P'], ['fastq_reads_gzip', 'P']]


OPERATION_6 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [file(row[1][0]), file(row[1][1])]] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .dump()
            .into { fastq_reads_qc; fastq_reads_trim; fastq_reads_gzip }
OPERATION_6 origin : [['params.readPaths', 'V']]
OPERATION_6 gives  : [['fastq_reads_qc', 'P'], ['fastq_reads_trim', 'P'], ['fastq_reads_gzip', 'P']]


OPERATION_7 string : fastq_reads_qc = Channel
                            .fromPath(params.reads)
                            .map { file -> tuple(file.baseName, file) }
OPERATION_7 origin : [['params.reads', 'A']]
OPERATION_7 gives  : [['fastq_reads_qc', 'P']]


OPERATION_8 string : fastq_reads_trim = Channel
                            .fromPath(params.reads)
                            .map { file -> tuple(file.baseName, file) }
OPERATION_8 origin : [['params.reads', 'A']]
OPERATION_8 gives  : [['fastq_reads_trim', 'P']]


OPERATION_9 string : fastq_reads_gzip = Channel
                            .fromPath(params.reads)
                            .map { file -> tuple(file.baseName, file) }
OPERATION_9 origin : [['params.reads', 'A']]
OPERATION_9 gives  : [['fastq_reads_gzip', 'P']]


OPERATION_10 string : Channel
            .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
            .into { fastq_reads_qc; fastq_reads_trim; fastq_reads_gzip }
OPERATION_10 origin : [['params.reads, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_10 gives  : [['fastq_reads_qc', 'P'], ['fastq_reads_trim', 'P'], ['fastq_reads_gzip', 'P']]


OPERATION_11 string : read_files_sra = Channel
                        .fromPath(params.sras)
                        .map { file -> tuple(file.baseName, file) }
OPERATION_11 origin : [['params.sras', 'A']]
OPERATION_11 gives  : [['read_files_sra', 'P']]


OPERATION_12 string : Channel
             .fromFilePairs( params.sras, size: params.singleEnd ? 1 : 2 )
             .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
             .into { fastq_reads_qc; fastq_reads_trim; fastq_reads_gzip }
OPERATION_12 origin : [['params.sras, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_12 gives  : [['fastq_reads_qc', 'P'], ['fastq_reads_trim', 'P'], ['fastq_reads_gzip', 'P']]


OPERATION_13 string : read_files_sra = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['read_files_sra', 'P']]


OPERATION_14 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_14 origin : [['summary', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : sorted_bam_ch
   .into {sorted_bams_for_bedtools_bedgraph; sorted_bams_for_preseq; sorted_bams_for_rseqc; sorted_bams_for_dreg_prep; sorted_bams_for_pileup}
OPERATION_15 origin : [['sorted_bam_ch', 'P']]
OPERATION_15 gives  : [['sorted_bams_for_bedtools_bedgraph', 'P'], ['sorted_bams_for_preseq', 'P'], ['sorted_bams_for_rseqc', 'P'], ['sorted_bams_for_dreg_prep', 'P'], ['sorted_bams_for_pileup', 'P']]


OPERATION_16 string : sorted_bam_indices_ch
    .into {sorted_bam_indices_for_bedtools_bedgraph; sorted_bam_indices_for_bedtools_normalized_bedgraph; sorted_bam_indicies_for_pileup; sorted_bam_indices_for_preseq; sorted_bam_indices_for_rseqc}
OPERATION_16 origin : [['sorted_bam_indices_ch', 'P']]
OPERATION_16 gives  : [['sorted_bam_indices_for_bedtools_bedgraph', 'P'], ['sorted_bam_indices_for_bedtools_normalized_bedgraph', 'P'], ['sorted_bam_indicies_for_pileup', 'P'], ['sorted_bam_indices_for_preseq', 'P'], ['sorted_bam_indices_for_rseqc', 'P']]


OPERATION_17 string : chrom_sizes_ch.into{chrom_sizes_for_bed; chrom_sizes_for_bigwig; chrom_sizes_for_igv}
OPERATION_17 origin : [['chrom_sizes_ch', 'P']]
OPERATION_17 gives  : [['chrom_sizes_for_bed', 'P'], ['chrom_sizes_for_bigwig', 'P'], ['chrom_sizes_for_igv', 'P']]


