OPERATION_1 string : Channel
        .fromPath(params.bismark_index, checkIfExists: true)
        .ifEmpty { exit 1, "Bismark index files not found: ${params.bismark_index}" }
        .into { ch_bismark_index_for_bismark_align; ch_bismark_index_for_bismark_methXtract }
OPERATION_1 origin : [['params.bismark_index, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_bismark_index_for_bismark_align', 'P'], ['ch_bismark_index_for_bismark_methXtract', 'P']]


OPERATION_2 string : Channel
        .empty()
        .into { ch_bismark_index_for_bismark_align; ch_bismark_index_for_bismark_methXtract }
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_bismark_index_for_bismark_align', 'P'], ['ch_bismark_index_for_bismark_methXtract', 'P']]


OPERATION_3 string : Channel
        .fromFilePairs( params.reads, size: 2 )
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
        .into { ch_read_files_for_fastqc; ch_read_files_for_trim_galore }
OPERATION_3 origin : [['params.reads, size: 2', 'A']]
OPERATION_3 gives  : [['ch_read_files_for_fastqc', 'P'], ['ch_read_files_for_trim_galore', 'P']]


OPERATION_4 string : Channel
            .fromFilePairs( params.reads, size: 2 )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
            .set { ch_read_files_for_trim_galore }
OPERATION_4 origin : [['params.reads, size: 2', 'A']]
OPERATION_4 gives  : [['ch_read_files_for_trim_galore', 'P']]


OPERATION_5 string : ch_read_files_for_fastqc = Channel.empty()
OPERATION_5 origin : []
OPERATION_5 gives  : [['ch_read_files_for_fastqc', 'P']]


OPERATION_6 string : Channel
            .fromFilePairs( params.reads, size: 2 )
            .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
            .set { ch_read_files_for_fastqc }
OPERATION_6 origin : [['params.reads, size: 2', 'A']]
OPERATION_6 gives  : [['ch_read_files_for_fastqc', 'P']]


OPERATION_7 string : ch_read_files_for_trim_galore = Channel.empty()
OPERATION_7 origin : []
OPERATION_7 gives  : [['ch_read_files_for_trim_galore', 'P']]


OPERATION_8 string : ch_read_files_for_fastqc = Channel.empty()
OPERATION_8 origin : []
OPERATION_8 gives  : [['ch_read_files_for_fastqc', 'P']]


OPERATION_9 string : ch_read_files_for_trim_galore = Channel.empty()
OPERATION_9 origin : []
OPERATION_9 gives  : [['ch_read_files_for_trim_galore', 'P']]


OPERATION_10 string : Channel
        .fromFilePairs( params.trimmed_reads, size: 2 )
        .ifEmpty { exit 1, "Cannot find any trimmed reads in dir: ${params.trimmed_reads}" }
        .set { ch_trimmed_reads_for_alignment_preproc }
OPERATION_10 origin : [['params.trimmed_reads, size: 2', 'A']]
OPERATION_10 gives  : [['ch_trimmed_reads_for_alignment_preproc', 'P']]


OPERATION_11 string : ch_trimmed_reads_for_alignment_preproc = Channel.empty() }

                                                                                      
if( !params.skip_dedup || !params.skip_extract ) {
OPERATION_11 origin : []
OPERATION_11 gives  : [['ch_trimmed_reads_for_alignment_preproc', 'P']]


OPERATION_12 string : Channel
        .fromFilePairs( params.bams, size: 1 )
        .ifEmpty { exit 1, "Cannot find any bams in: ${params.bams}" }
        .set { ch_bam_for_bismark_deduplicate_preproc }
OPERATION_12 origin : [['params.bams, size: 1', 'A']]
OPERATION_12 gives  : [['ch_bam_for_bismark_deduplicate_preproc', 'P']]


OPERATION_13 string : ch_bam_for_bismark_deduplicate_preproc = Channel.empty() }


                     
def summary = [:]
summary['Run Name']         = workflow.runName
if(params.reads)            summary['Reads'] = params.reads
if(params.trimmed_reads)    summary['Trimmed Reads'] = params.trimmed_reads
if(params.bams)             summary['BAMs'] = params.bams
if(params.bismark_index)    summary['Bismark Index'] = params.bismark_index
if(params.skip_fastqc || params.skip_trim || params.trimmed_reads)    summary['Skip FastQC'] = "Yes"
if(params.skip_trim || params.trimmed_reads) summary['Skip Trim Galore!'] = "Yes"
if(params.skip_align || params.bams)  summary['Skip Align'] = "Yes"
if(params.rrbs || params.skip_dedup) summary['Skip Deduplication'] = "Yes"
if(params.skip_extract) summary['Skip mC Extract'] = "Yes"
if(params.rrbs)             summary['RRBS Mode'] = 'On'
if(params.nugen)            summary['Nugen Trim Mode'] = 'On'
if(params.truseq_epi)       summary['Trimming Profile'] = 'TruSeq Epigenome'
if(params.single_cell && !params.nugen)     summary['Trimming Profile'] = 'Single Cell'
if(params.single_cell && params.nugen)      summary['Trimming Profile'] = 'Nugen Trim + Single Cell'
summary['Trimming']         = "5'R1: $clip_r1 / 5'R2: $clip_r2 / 3'R1: $three_prime_clip_r1 / 3'R2: $three_prime_clip_r2"
if(params.adapter1)         summary['Adapter 1 Seq'] = params.adapter1
if(params.adapter2)         summary['Adapter 2 Seq'] = params.adapter2
if(params.min_insert)       summary['Min. Insert Len.'] = params.min_insert
if (params.comprehensive ) { 
OPERATION_13 origin : []
OPERATION_13 gives  : [['ch_bam_for_bismark_deduplicate_preproc', 'P']]


OPERATION_14 string : ch_fastqc_results_for_multiqc = Channel.from(false)
OPERATION_14 origin : [['false', 'V']]
OPERATION_14 gives  : [['ch_fastqc_results_for_multiqc', 'P']]


OPERATION_15 string : ch_trimmed_reads_for_alignment = Channel.empty()
OPERATION_15 origin : []
OPERATION_15 gives  : [['ch_trimmed_reads_for_alignment', 'P']]


OPERATION_16 string : ch_trim_galore_results_for_multiqc = Channel.from(false)
OPERATION_16 origin : [['false', 'V']]
OPERATION_16 gives  : [['ch_trim_galore_results_for_multiqc', 'P']]


OPERATION_17 string : ch_nugen_trimmed_reads_for_alignment = Channel.empty()
OPERATION_17 origin : []
OPERATION_17 gives  : [['ch_nugen_trimmed_reads_for_alignment', 'P']]


OPERATION_18 string : ch_bam_for_bismark_deduplicate = Channel.empty()
OPERATION_18 origin : []
OPERATION_18 gives  : [['ch_bam_for_bismark_deduplicate', 'P']]


OPERATION_19 string : ch_bam_for_bismark_summary = Channel.empty()
OPERATION_19 origin : []
OPERATION_19 gives  : [['ch_bam_for_bismark_summary', 'P']]


OPERATION_20 string : ch_bam_for_preseq = Channel.empty()
OPERATION_20 origin : []
OPERATION_20 gives  : [['ch_bam_for_preseq', 'P']]


OPERATION_21 string : ch_bismark_align_log_for_bismark_report = Channel.from(false)
OPERATION_21 origin : [['false', 'V']]
OPERATION_21 gives  : [['ch_bismark_align_log_for_bismark_report', 'P']]


OPERATION_22 string : ch_bismark_align_log_for_bismark_summary = Channel.from(false)
OPERATION_22 origin : [['false', 'V']]
OPERATION_22 gives  : [['ch_bismark_align_log_for_bismark_summary', 'P']]


OPERATION_23 string : ch_bismark_align_log_for_multiqc = Channel.from(false)
OPERATION_23 origin : [['false', 'V']]
OPERATION_23 gives  : [['ch_bismark_align_log_for_multiqc', 'P']]


OPERATION_24 string : ch_bismark_dedup_log_for_bismark_report = Channel.from(false)
OPERATION_24 origin : [['false', 'V']]
OPERATION_24 gives  : [['ch_bismark_dedup_log_for_bismark_report', 'P']]


OPERATION_25 string : ch_bismark_dedup_log_for_bismark_summary = Channel.from(false)
OPERATION_25 origin : [['false', 'V']]
OPERATION_25 gives  : [['ch_bismark_dedup_log_for_bismark_summary', 'P']]


OPERATION_26 string : ch_bismark_dedup_log_for_multiqc = Channel.from(false)
OPERATION_26 origin : [['false', 'V']]
OPERATION_26 gives  : [['ch_bismark_dedup_log_for_multiqc', 'P']]


OPERATION_27 string : ch_bismark_dedup_log_for_bismark_report = Channel.from(false)
OPERATION_27 origin : [['false', 'V']]
OPERATION_27 gives  : [['ch_bismark_dedup_log_for_bismark_report', 'P']]


OPERATION_28 string : ch_bismark_dedup_log_for_bismark_summary = Channel.from(false)
OPERATION_28 origin : [['false', 'V']]
OPERATION_28 gives  : [['ch_bismark_dedup_log_for_bismark_summary', 'P']]


OPERATION_29 string : ch_bismark_dedup_log_for_multiqc = Channel.from(false)
OPERATION_29 origin : [['false', 'V']]
OPERATION_29 gives  : [['ch_bismark_dedup_log_for_multiqc', 'P']]


OPERATION_30 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_30 origin : [['summary', 'P']]
OPERATION_30 gives  : []


OPERATION_31 string : ch_bam_for_bismark_deduplicate.into { ch_bam_dedup_for_bismark_methXtract; ch_bam_dedup_for_qualimap }
OPERATION_31 origin : [['ch_bam_for_bismark_deduplicate', 'P']]
OPERATION_31 gives  : [['ch_bam_dedup_for_bismark_methXtract', 'P'], ['ch_bam_dedup_for_qualimap', 'P']]


OPERATION_32 string : ch_bam_for_bismark_deduplicate_preproc.into { ch_bam_dedup_for_bismark_methXtract; ch_bam_dedup_for_qualimap }
OPERATION_32 origin : [['ch_bam_for_bismark_deduplicate_preproc', 'P']]
OPERATION_32 gives  : [['ch_bam_dedup_for_bismark_methXtract', 'P'], ['ch_bam_dedup_for_qualimap', 'P']]


OPERATION_33 string : ch_bismark_align_log_for_bismark_report
        .join(ch_bismark_dedup_log_for_bismark_report)
        .join(ch_bismark_splitting_report_for_bismark_report)
        .join(ch_bismark_mbias_for_bismark_report)
        .set{ ch_bismark_logs_for_bismark_report }
OPERATION_33 origin : [['ch_bismark_align_log_for_bismark_report', 'P'], ['ch_bismark_dedup_log_for_bismark_report', 'P'], ['ch_bismark_splitting_report_for_bismark_report', 'P'], ['ch_bismark_mbias_for_bismark_report', 'P']]
OPERATION_33 gives  : [['ch_bismark_logs_for_bismark_report', 'P']]


