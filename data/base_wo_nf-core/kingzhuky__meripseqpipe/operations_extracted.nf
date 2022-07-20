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
            .into{ raw_fastq; raw_bam }
OPERATION_5 origin : [['params.readPaths', 'A']]
OPERATION_5 gives  : [['raw_fastq', 'P'], ['raw_bam', 'P']]


OPERATION_6 string : Channel
            .from( params.readPaths )
            .map{ row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into{ raw_fastq; raw_bam }
OPERATION_6 origin : [['params.readPaths', 'V']]
OPERATION_6 gives  : [['raw_fastq', 'P'], ['raw_bam', 'P']]


OPERATION_7 string : Channel
            .from( params.readPaths )
            .map{ row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into{ raw_fastq; raw_bam }
OPERATION_7 origin : [['params.readPaths', 'V']]
OPERATION_7 gives  : [['raw_fastq', 'P'], ['raw_bam', 'P']]


OPERATION_8 string : tophat2_index = Channel
        .fromPath( params.tophat2_index )
        .ifEmpty { exit 1, "Tophat2 index not found: ${params.tophat2_index}" }
OPERATION_8 origin : [['params.tophat2_index', 'A']]
OPERATION_8 gives  : [['tophat2_index', 'P']]


OPERATION_9 string : hisat2_index = Channel
        .fromPath(params.hisat2_index)
        .ifEmpty { exit 1, "hisat2 index not found: ${params.hisat2_index}" }
OPERATION_9 origin : [['params.hisat2_index', 'A']]
OPERATION_9 gives  : [['hisat2_index', 'P']]


OPERATION_10 string : bwa_index = Channel
        .fromPath( params.bwa_index )
        .ifEmpty { exit 1, "bwa index not found: ${params.bwa_index}" }
OPERATION_10 origin : [['params.bwa_index', 'A']]
OPERATION_10 gives  : [['bwa_index', 'P']]


OPERATION_11 string : star_index = Channel
        .fromPath(params.star_index)
        .ifEmpty { exit 1, "STAR index not found: ${params.star_index}" }
OPERATION_11 origin : [['params.star_index', 'A']]
OPERATION_11 gives  : [['star_index', 'P']]


OPERATION_12 string : Channel
    .from()
    .concat(tophat2_bam, hisat2_bam, bwa_bam, star_bam, raw_bam)
    .set{ merge_bam_file }
OPERATION_12 origin : [['tophat2_bam', 'P'], ['hisat2_bam', 'P'], ['bwa_bam', 'P'], ['star_bam', 'P'], ['raw_bam', 'P'], ['', 'V']]
OPERATION_12 gives  : [['merge_bam_file', 'P']]


OPERATION_13 string : Channel
    .from()
    .concat( tophat2_log, hisat2_log, star_log, fastp_results, fastqc_results, rseqc_results)
    .into{ arranged_qc; qc_results_for_report }
OPERATION_13 origin : [['tophat2_log', 'P'], ['hisat2_log', 'P'], ['star_log', 'P'], ['fastp_results', 'P'], ['fastqc_results', 'P'], ['rseqc_results', 'P'], ['', 'V']]
OPERATION_13 gives  : [['arranged_qc', 'P'], ['qc_results_for_report', 'P']]


OPERATION_14 string : Channel
    .from()
    .concat(metpeak_nomarlized_bed, macs2_nomarlized_bed, matk_nomarlized_bed, meyer_nomarlized_bed)
    .into {merged_bed ; bed_for_annotation}
OPERATION_14 origin : [['metpeak_nomarlized_bed', 'P'], ['macs2_nomarlized_bed', 'P'], ['matk_nomarlized_bed', 'P'], ['meyer_nomarlized_bed', 'P'], ['', 'V']]
OPERATION_14 gives  : [['merged_bed', 'P'], ['bed_for_annotation', 'P']]


OPERATION_15 string : Channel
    .from()
    .mix( group_merged_bed, all_merged_bed )
    .flatten()
    .into{ annotate_collection; motif_collection; bed_collect_for_arrange_results}
OPERATION_15 origin : [['group_merged_bed', 'P'], ['all_merged_bed', 'P'], ['', 'V']]
OPERATION_15 gives  : [['annotate_collection', 'P'], ['motif_collection', 'P'], ['bed_collect_for_arrange_results', 'P']]


OPERATION_16 string : Channel
    .from()
    .concat( quantification_results, motif_results_for_report, diffm6A_results, 
        htseq_count_input_to_arrange, 
        anno_for_diffreport, prediction_results, bed_collect_for_arrange_results,
        multiqc_results, deseq2_results, edgeR_results, cufflinks_results
    )
    .set{ results_arrange }
OPERATION_16 origin : [['quantification_results', 'P'], ['motif_results_for_report', 'P'], ['diffm6A_results', 'P'], ['htseq_count_input_to_arrange', 'P'], ['anno_for_diffreport', 'P'], ['prediction_results', 'P'], ['bed_collect_for_arrange_results', 'P'], ['multiqc_results', 'P'], ['deseq2_results', 'P'], ['edgeR_results', 'P'], ['cufflinks_results', 'P'], ['', 'V']]
OPERATION_16 gives  : [['results_arrange', 'P']]


OPERATION_17 string : compareLines.into{
    compareLines_for_DESeq2; compareLines_for_edgeR; compareLines_for_plot;
    compareLines_for_diffm6A; compareLines_for_arranged_result
}
OPERATION_17 origin : [['compareLines', 'P']]
OPERATION_17 gives  : [['compareLines_for_DESeq2', 'P'], ['compareLines_for_edgeR', 'P'], ['compareLines_for_plot', 'P'], ['compareLines_for_diffm6A', 'P'], ['compareLines_for_arranged_result', 'P']]


OPERATION_18 string : input_data_fastq.filter{ it[6] == "fastq" }.map{ it.subList(0,6) }.set{ raw_fastq }
OPERATION_18 origin : [['input_data_fastq', 'P']]
OPERATION_18 gives  : [['raw_fastq', 'P']]


OPERATION_19 string : input_data_bam.filter{ it[6] == "bam" }.map{ it.subList(0,6) }.set{ raw_bam }
OPERATION_19 origin : [['input_data_bam', 'P']]
OPERATION_19 gives  : [['raw_bam', 'P']]


OPERATION_20 string : designinfo.map{ it.getAt([0,5]) }.set{ format_design }
OPERATION_20 origin : [['designinfo', 'P']]
OPERATION_20 gives  : [['format_design', 'P']]


OPERATION_21 string : fastp_reads.set{rRNA_reads}
OPERATION_21 origin : [['fastp_reads', 'P']]
OPERATION_21 gives  : [['rRNA_reads', 'P']]


OPERATION_22 string : fastp_reads.into{tophat2_reads; hisat2_reads; bwa_reads; star_reads}
OPERATION_22 origin : [['fastp_reads', 'P']]
OPERATION_22 gives  : [['tophat2_reads', 'P'], ['hisat2_reads', 'P'], ['bwa_reads', 'P'], ['star_reads', 'P']]


OPERATION_23 string : sorted_bam.groupTuple(by: [0,1]).groupTuple(by: index_peakCallingbygroup)
.map{group,sample,bam,bai -> [group,sample, bam.flatten().sort{
    o1, o2 -> 
    sub_o1 = o1.toString();sub_o1 = sub_o1.substring(sub_o1.lastIndexOf('/') + 1);
    sub_o2 = o2.toString();sub_o2 = sub_o2.substring(sub_o2.lastIndexOf('/') + 1);
    return sub_o1.compareTo(sub_o2);
}, bai.flatten()]}
.into{ macs2_bam; metpeak_bam; matk_bam; meyer_bam}
OPERATION_23 origin : [['sorted_bam', 'P']]
OPERATION_23 gives  : [['macs2_bam', 'P'], ['metpeak_bam', 'P'], ['matk_bam', 'P'], ['meyer_bam', 'P']]


OPERATION_24 string : annotate_collection.mix(bed_for_annotation).toList().flatten().set{beds_anno}
OPERATION_24 origin : [['annotate_collection', 'P'], ['bed_for_annotation', 'P']]
OPERATION_24 gives  : [['beds_anno', 'P']]


OPERATION_25 string : anno_for_quantification.flatten().filter( ~/.*merged_allpeaks.anno.txt$/).set{methylation_annotaion_file}PROCESS DEF PeaksQuantification
OPERATION_25 origin : [['anno_for_quantification', 'P']]
OPERATION_25 gives  : [['methylation_annotaion_file', 'P']]


