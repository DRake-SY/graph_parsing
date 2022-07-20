OPERATION_1 string : rRNA_fasta = Channel.from("")
OPERATION_1 origin : [['""', 'V']]
OPERATION_1 gives  : [['rRNA_fasta', 'P']]


OPERATION_2 string : compareLines = Channel.from("two_group")
OPERATION_2 origin : [['"two_group"', 'V']]
OPERATION_2 gives  : [['compareLines', 'P']]


OPERATION_3 string : compareLines = Channel.from(comparefile.readLines())
OPERATION_3 origin : []
OPERATION_3 gives  : [['compareLines', 'P']]


OPERATION_4 string : compareLines = Channel.from("")
OPERATION_4 origin : [['""', 'V']]
OPERATION_4 gives  : [['compareLines', 'P']]


OPERATION_5 string : Channel
            .fromPath( params.readPaths )
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into{ raw_data; raw_bam }
OPERATION_5 origin : [['params.readPaths', 'A']]
OPERATION_5 gives  : [['raw_data', 'P'], ['raw_bam', 'P']]


OPERATION_6 string : Channel
            .from( params.readPaths )
            .map{ row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into{ raw_data; raw_bam }
OPERATION_6 origin : [['params.readPaths', 'V']]
OPERATION_6 gives  : [['raw_data', 'P'], ['raw_bam', 'P']]


OPERATION_7 string : Channel
            .from( params.readPaths )
            .map{ row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into{ raw_data; raw_bam }
OPERATION_7 origin : [['params.readPaths', 'V']]
OPERATION_7 gives  : [['raw_data', 'P'], ['raw_bam', 'P']]


OPERATION_8 string : Channel
        .fromPath( 'SRP012098/SRR*/*fastq' )
        .ifEmpty { exit 1, LikeletUtils.print_red("248 reads was empty - no fastq files supplied: ${params.single_end} ${params.reads}. You may check whether it is quoted")}
        .into{ raw_data; raw_bam }
OPERATION_8 origin : [["'SRP012098/SRR*/*fastq'", 'A']]
OPERATION_8 gives  : [['raw_data', 'P'], ['raw_bam', 'P']]


OPERATION_9 string : Channel
        .fromPath( params.reads ) 
        .ifEmpty { exit 1, LikeletUtils.print_red("253 reads was empty - no bam files supplied: ${params.reads}")}
        .into{ raw_data; raw_bam }
OPERATION_9 origin : [['params.reads', 'A']]
OPERATION_9 gives  : [['raw_data', 'P'], ['raw_bam', 'P']]


OPERATION_10 string : tophat2_index = Channel
        .fromPath( params.tophat2_index )
        .ifEmpty { exit 1, "Tophat2 index not found: ${params.tophat2_index}" }
OPERATION_10 origin : [['params.tophat2_index', 'A']]
OPERATION_10 gives  : [['tophat2_index', 'P']]


OPERATION_11 string : hisat2_index = Channel
        .fromPath(params.hisat2_index)
        .ifEmpty { exit 1, "hisat2 index not found: ${params.hisat2_index}" }
OPERATION_11 origin : [['params.hisat2_index', 'A']]
OPERATION_11 gives  : [['hisat2_index', 'P']]


OPERATION_12 string : bwa_index = Channel
        .fromPath( params.bwa_index )
        .ifEmpty { exit 1, "bwa index not found: ${params.bwa_index}" }
OPERATION_12 origin : [['params.bwa_index', 'A']]
OPERATION_12 gives  : [['bwa_index', 'P']]


OPERATION_13 string : star_index = Channel
        .fromPath(params.star_index)
        .ifEmpty { exit 1, "STAR index not found: ${params.star_index}" }
OPERATION_13 origin : [['params.star_index', 'A']]
OPERATION_13 gives  : [['star_index', 'P']]


OPERATION_14 string : Channel
        .from()
        .concat(tophat2_bam, hisat2_bam, bwa_bam, star_bam)
        .set{ merge_bam_file }
OPERATION_14 origin : [['tophat2_bam', 'P'], ['hisat2_bam', 'P'], ['bwa_bam', 'P'], ['star_bam', 'P'], ['', 'V']]
OPERATION_14 gives  : [['merge_bam_file', 'P']]


OPERATION_15 string : Channel
        .from()
        .concat( raw_bam )
        .set{ merge_bam_file }
OPERATION_15 origin : [['raw_bam', 'P'], ['', 'V']]
OPERATION_15 gives  : [['merge_bam_file', 'P']]


OPERATION_16 string : Channel
    .from()
    .concat( tophat2_log, hisat2_log, star_log, fastp_results, fastqc_results, rseqc_results)
    .into{ arranged_qc; qc_results_for_report }
OPERATION_16 origin : [['tophat2_log', 'P'], ['hisat2_log', 'P'], ['star_log', 'P'], ['fastp_results', 'P'], ['fastqc_results', 'P'], ['rseqc_results', 'P'], ['', 'V']]
OPERATION_16 gives  : [['arranged_qc', 'P'], ['qc_results_for_report', 'P']]


OPERATION_17 string : Channel
    .from()
    .concat(metpeak_nomarlized_bed, macs2_nomarlized_bed, matk_nomarlized_bed, meyer_nomarlized_bed)
    .into {merged_bed ; bed_for_annotation}
OPERATION_17 origin : [['metpeak_nomarlized_bed', 'P'], ['macs2_nomarlized_bed', 'P'], ['matk_nomarlized_bed', 'P'], ['meyer_nomarlized_bed', 'P'], ['', 'V']]
OPERATION_17 gives  : [['merged_bed', 'P'], ['bed_for_annotation', 'P']]


OPERATION_18 string : Channel
    .from()
    .concat( group_merged_bed, all_merged_bed )
    .into { annotate_collection; motif_collection; bed_collect_for_arrange_results}
OPERATION_18 origin : [['group_merged_bed', 'P'], ['all_merged_bed', 'P'], ['', 'V']]
OPERATION_18 gives  : [['annotate_collection', 'P'], ['motif_collection', 'P'], ['bed_collect_for_arrange_results', 'P']]


OPERATION_19 string : Channel
    .from()
    .concat( quantification_results, motif_results_2, diffm6A_results, 
        htseq_count_input_to_arrange, 
        annotation_results_2, prediction_results, bed_collect_for_arrange_results,
        multiqc_results, deseq2_results, edgeR_results, cufflinks_results
    )
    .set{ results_arrange }
OPERATION_19 origin : [['quantification_results', 'P'], ['motif_results_2', 'P'], ['diffm6A_results', 'P'], ['htseq_count_input_to_arrange', 'P'], ['annotation_results_2', 'P'], ['prediction_results', 'P'], ['bed_collect_for_arrange_results', 'P'], ['multiqc_results', 'P'], ['deseq2_results', 'P'], ['edgeR_results', 'P'], ['cufflinks_results', 'P'], ['', 'V']]
OPERATION_19 gives  : [['results_arrange', 'P']]


OPERATION_20 string : compareLines.into{
    compareLines_for_DESeq2; compareLines_for_edgeR; compareLines_for_plot;
    compareLines_for_diffm6A; compareLines_for_arranged_result
}
OPERATION_20 origin : [['compareLines', 'P']]
OPERATION_20 gives  : [['compareLines_for_DESeq2', 'P'], ['compareLines_for_edgeR', 'P'], ['compareLines_for_plot', 'P'], ['compareLines_for_diffm6A', 'P'], ['compareLines_for_arranged_result', 'P']]


