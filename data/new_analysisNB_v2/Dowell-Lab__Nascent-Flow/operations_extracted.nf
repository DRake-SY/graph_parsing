OPERATION_1 string : fastq_reads_qc = Channel
                            .fromPath(params.fastqs)
                            .map { file -> tuple(file.simpleName, file) }
OPERATION_1 origin : [['params.fastqs', 'A']]
OPERATION_1 gives  : [['fastq_reads_qc', 'P']]


OPERATION_2 string : fastq_reads_trim = Channel
                            .fromPath(params.fastqs)
                            .map { file -> tuple(file.simpleName, file) }
OPERATION_2 origin : [['params.fastqs', 'A']]
OPERATION_2 gives  : [['fastq_reads_trim', 'P']]


OPERATION_3 string : fastq_reads_hisat2_notrim = Channel
                            .fromPath(params.fastqs)
                            .map { file -> tuple(file.simpleName, file) }        
OPERATION_3 origin : [['params.fastqs', 'A']]
OPERATION_3 gives  : [['fastq_reads_hisat2_notrim', 'P']]


OPERATION_4 string : Channel
            .fromFilePairs( params.fastqs, size: params.singleEnd ? 1 : 2 )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --singleEnd on the command line." }
            .into { fastq_reads_qc; fastq_reads_trim; fastq_reads_hisat2_notrim }
OPERATION_4 origin : [['params.fastqs, size: params.singleEnd ? 1 : 2', 'A']]
OPERATION_4 gives  : [['fastq_reads_qc', 'P'], ['fastq_reads_trim', 'P'], ['fastq_reads_hisat2_notrim', 'P']]


OPERATION_5 string : Channel
        .empty()
        .into { fastq_reads_qc; fastq_reads_trim; fastq_reads_hisat2_notrim }
OPERATION_5 origin : []
OPERATION_5 gives  : [['fastq_reads_qc', 'P'], ['fastq_reads_trim', 'P'], ['fastq_reads_hisat2_notrim', 'P']]


OPERATION_6 string : read_files_sra = Channel
                        .fromPath(params.sras)
                        .map { file -> tuple(file.baseName, file) }
OPERATION_6 origin : [['params.sras', 'A']]
OPERATION_6 gives  : [['read_files_sra', 'P']]


OPERATION_7 string : read_files_sra = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['read_files_sra', 'P']]


OPERATION_8 string : software_versions = Channel.create()
OPERATION_8 origin : []
OPERATION_8 gives  : [['software_versions', 'P']]


OPERATION_9 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_9 origin : [['summary', 'P']]
OPERATION_9 gives  : []


OPERATION_10 string : software_versions.collectFile(name: "software_versions_nascent_${output_date}_${workflow.runName}.yaml", storeDir: "${params.outdir}/pipeline_info")
OPERATION_10 origin : [['software_versions', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : sorted_bam_ch
   .into { sorted_bams_for_preseq; sorted_bams_for_rseqc; sorted_bams_for_dreg_prep; sorted_bams_for_pileup; sorted_bams_for_picard; sorted_bam_for_bedgraph }
OPERATION_11 origin : [['sorted_bam_ch', 'P']]
OPERATION_11 gives  : [['sorted_bams_for_preseq', 'P'], ['sorted_bams_for_rseqc', 'P'], ['sorted_bams_for_dreg_prep', 'P'], ['sorted_bams_for_pileup', 'P'], ['sorted_bams_for_picard', 'P'], ['sorted_bam_for_bedgraph', 'P']]


OPERATION_12 string : sorted_bam_indices_ch
    .into { sorted_bam_indicies_for_pileup; sorted_bam_indices_for_preseq; sorted_bam_indices_for_rseqc; sorted_bam_indices_for_picard; sorted_bam_index_for_bedgraph }
OPERATION_12 origin : [['sorted_bam_indices_ch', 'P']]
OPERATION_12 gives  : [['sorted_bam_indicies_for_pileup', 'P'], ['sorted_bam_indices_for_preseq', 'P'], ['sorted_bam_indices_for_rseqc', 'P'], ['sorted_bam_indices_for_picard', 'P'], ['sorted_bam_index_for_bedgraph', 'P']]


OPERATION_13 string : cram_ch
    .into { cram_for_counts; cram_dreg_prep }
OPERATION_13 origin : [['cram_ch', 'P']]
OPERATION_13 gives  : [['cram_for_counts', 'P'], ['cram_dreg_prep', 'P']]


OPERATION_14 string : cram_index_ch
    .into { cram_index_for_counts; cram_index_dreg_prep}
OPERATION_14 origin : [['cram_index_ch', 'P']]
OPERATION_14 gives  : [['cram_index_for_counts', 'P'], ['cram_index_dreg_prep', 'P']]


