OPERATION_1 string : Channel
    .fromPath("$projectDir/assets/where_are_my_files.txt", checkIfExists: true)
    .into { ch_wherearemyfiles_for_trimgalore; ch_wherearemyfiles_for_alignment }
OPERATION_1 origin : [['"$projectDir/assets/where_are_my_files.txt", checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_wherearemyfiles_for_trimgalore', 'P'], ['ch_wherearemyfiles_for_alignment', 'P']]


OPERATION_2 string : ch_splicesites_for_bismark_hisat_align = Channel.fromPath(params.known_splices, checkIfExists: true)
OPERATION_2 origin : [['params.known_splices, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['ch_splicesites_for_bismark_hisat_align', 'P']]


OPERATION_3 string : ch_splicesites_for_bismark_hisat_align = Channel.empty()
OPERATION_3 origin : []
OPERATION_3 gives  : [['ch_splicesites_for_bismark_hisat_align', 'P']]


OPERATION_4 string : Channel
            .fromPath(params.bismark_index, checkIfExists: true)
            .ifEmpty { exit 1, "Bismark index file not found: ${params.bismark_index}" }
            .into { ch_bismark_index_for_bismark_align; ch_bismark_index_for_bismark_methXtract }
OPERATION_4 origin : [['params.bismark_index, checkIfExists: true', 'A']]
OPERATION_4 gives  : [['ch_bismark_index_for_bismark_align', 'P'], ['ch_bismark_index_for_bismark_methXtract', 'P']]


OPERATION_5 string : Channel
            .fromPath(params.fasta, checkIfExists: true)
            .ifEmpty { exit 1, "fasta file not found : ${params.fasta}" }
            .set { ch_fasta_for_makeBismarkIndex }
OPERATION_5 origin : [['params.fasta, checkIfExists: true', 'A']]
OPERATION_5 gives  : [['ch_fasta_for_makeBismarkIndex', 'P']]


OPERATION_6 string : Channel
        .fromPath(params.fasta, checkIfExists: true)
        .ifEmpty { exit 1, "fasta file not found : ${params.fasta}" }
        .into { ch_fasta_for_makeBwaMemIndex; ch_fasta_for_makeFastaIndex; ch_fasta_for_methyldackel }
OPERATION_6 origin : [['params.fasta, checkIfExists: true', 'A']]
OPERATION_6 gives  : [['ch_fasta_for_makeBwaMemIndex', 'P'], ['ch_fasta_for_makeFastaIndex', 'P'], ['ch_fasta_for_methyldackel', 'P']]


OPERATION_7 string : Channel
            .fromPath("${params.bwa_meth_index}*", checkIfExists: true)
            .ifEmpty { exit 1, "bwa-meth index file(s) not found: ${params.bwa_meth_index}" }
            .set { ch_bwa_meth_indices_for_bwamem_align }
OPERATION_7 origin : [['"${params.bwa_meth_index}*", checkIfExists: true', 'A']]
OPERATION_7 gives  : [['ch_bwa_meth_indices_for_bwamem_align', 'P']]


OPERATION_8 string : Channel
            .fromPath(params.fasta_index, checkIfExists: true)
            .ifEmpty { exit 1, "fasta index file not found: ${params.fasta_index}" }
            .set { ch_fasta_index_for_methyldackel }
OPERATION_8 origin : [['params.fasta_index, checkIfExists: true', 'A']]
OPERATION_8 gives  : [['ch_fasta_index_for_methyldackel', 'P']]


OPERATION_9 string : Channel
        .fromPath(params.fasta, checkIfExists: true)
        .ifEmpty { exit 1, "fasta file not found : ${params.fasta}" }
        .into { ch_fasta_for_cgmaptools; ch_fasta_bismarkIndex_2 }
OPERATION_9 origin : [['params.fasta, checkIfExists: true', 'A']]
OPERATION_9 gives  : [['ch_fasta_for_cgmaptools', 'P'], ['ch_fasta_bismarkIndex_2', 'P']]


OPERATION_10 string : ch_multiqc_custom_config = Channel.fromPath(params.multiqc_config, checkIfExists: true)
OPERATION_10 origin : [['params.multiqc_config, checkIfExists: true', 'A']]
OPERATION_10 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_11 string : ch_multiqc_custom_config = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['ch_multiqc_custom_config', 'P']]


OPERATION_12 string : Channel
            .from(params.input_paths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, 'params.input_paths was empty - no input files supplied' }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_12 origin : [['params.input_paths', 'V']]
OPERATION_12 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_13 string : Channel
            .from(params.input_paths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, 'params.input_paths was empty - no input files supplied' }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_13 origin : [['params.input_paths', 'V']]
OPERATION_13 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_14 string : Channel
        .fromPath(params.bam)
        .map { file -> tuple(file.baseName, file) }
        .ifEmpty { exit 1, 'params.bam_paths was empty - no input files supplied' }
        .set { ch_indep_bam_for_processing }
OPERATION_14 origin : [['params.bam', 'A']]
OPERATION_14 gives  : [['ch_indep_bam_for_processing', 'P']]


OPERATION_15 string : Channel
        .fromFilePairs(params.input, size: params.single_end ? 1 : 2)
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.input}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { ch_read_files_fastqc; ch_read_files_trimming}
OPERATION_15 origin : [['params.input, size: params.single_end ? 1 : 2', 'A']]
OPERATION_15 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_16 string : Channel.from(summary.collect{ [it.key, it.value] })
    .map { k,v -> "<dt>$k</dt><dd><samp>${v ?: '<span style=\"color:#999999;\">N/A</a>'}</samp></dd>" }
    .reduce { a, b -> return [a, b].join("\n            ") }
    .map { x -> """
    id: 'nf-core-methylseq-summary'
    description: " - this information is collected when the pipeline is started."
    section_name: 'nf-core/methylseq Workflow Summary'
    section_href: 'https://github.com/nf-core/methylseq'
    plot_type: 'html'
    data: |
        <dl class=\"dl-horizontal\">
            $x
        </dl>
    """.stripIndent() }
    .set { ch_workflow_summary }
OPERATION_16 origin : [['summary.collect{ [it.key, it.value] }', 'V']]
OPERATION_16 gives  : [['ch_workflow_summary', 'P']]


OPERATION_17 string : ch_fastqc_results_for_multiqc = Channel.from(false)
OPERATION_17 origin : [['false', 'V']]
OPERATION_17 gives  : [['ch_fastqc_results_for_multiqc', 'P']]


OPERATION_18 string : ch_trim_galore_results_for_multiqc = Channel.from(false)
OPERATION_18 origin : [['false', 'V']]
OPERATION_18 gives  : [['ch_trim_galore_results_for_multiqc', 'P']]


OPERATION_19 string : ch_read_files_trimming = Channel.from(false)
OPERATION_19 origin : [['false', 'V']]
OPERATION_19 gives  : [['ch_read_files_trimming', 'P']]


OPERATION_20 string : ch_trim_galore_results_for_multiqc = Channel.from(false)
OPERATION_20 origin : [['false', 'V']]
OPERATION_20 gives  : [['ch_trim_galore_results_for_multiqc', 'P']]


OPERATION_21 string : ch_bismark_dedup_log_for_bismark_report = Channel.from(false)
OPERATION_21 origin : [['false', 'V']]
OPERATION_21 gives  : [['ch_bismark_dedup_log_for_bismark_report', 'P']]


OPERATION_22 string : ch_bismark_dedup_log_for_bismark_summary = Channel.from(false)
OPERATION_22 origin : [['false', 'V']]
OPERATION_22 gives  : [['ch_bismark_dedup_log_for_bismark_summary', 'P']]


OPERATION_23 string : ch_bismark_dedup_log_for_multiqc = Channel.from(false)
OPERATION_23 origin : [['false', 'V']]
OPERATION_23 gives  : [['ch_bismark_dedup_log_for_multiqc', 'P']]


OPERATION_24 string : ch_bismark_align_log_for_multiqc = Channel.from(false)
OPERATION_24 origin : [['false', 'V']]
OPERATION_24 gives  : [['ch_bismark_align_log_for_multiqc', 'P']]


OPERATION_25 string : ch_bismark_dedup_log_for_multiqc = Channel.from(false)
OPERATION_25 origin : [['false', 'V']]
OPERATION_25 gives  : [['ch_bismark_dedup_log_for_multiqc', 'P']]


OPERATION_26 string : ch_bismark_splitting_report_for_multiqc = Channel.from(false)
OPERATION_26 origin : [['false', 'V']]
OPERATION_26 gives  : [['ch_bismark_splitting_report_for_multiqc', 'P']]


OPERATION_27 string : ch_bismark_mbias_for_multiqc = Channel.from(false)
OPERATION_27 origin : [['false', 'V']]
OPERATION_27 gives  : [['ch_bismark_mbias_for_multiqc', 'P']]


OPERATION_28 string : ch_bismark_reports_results_for_multiqc = Channel.from(false)
OPERATION_28 origin : [['false', 'V']]
OPERATION_28 gives  : [['ch_bismark_reports_results_for_multiqc', 'P']]


OPERATION_29 string : ch_bismark_summary_results_for_multiqc = Channel.from(false)
OPERATION_29 origin : [['false', 'V']]
OPERATION_29 gives  : [['ch_bismark_summary_results_for_multiqc', 'P']]


OPERATION_30 string : ch_markDups_results_for_multiqc = Channel.from(false)
OPERATION_30 origin : [['false', 'V']]
OPERATION_30 gives  : [['ch_markDups_results_for_multiqc', 'P']]


OPERATION_31 string : ch_flagstat_results_for_multiqc = Channel.from(false)
OPERATION_31 origin : [['false', 'V']]
OPERATION_31 gives  : [['ch_flagstat_results_for_multiqc', 'P']]


OPERATION_32 string : ch_samtools_stats_results_for_multiqc = Channel.from(false)
OPERATION_32 origin : [['false', 'V']]
OPERATION_32 gives  : [['ch_samtools_stats_results_for_multiqc', 'P']]


OPERATION_33 string : ch_markDups_results_for_multiqc = Channel.from(false)
OPERATION_33 origin : [['false', 'V']]
OPERATION_33 gives  : [['ch_markDups_results_for_multiqc', 'P']]


OPERATION_34 string : ch_methyldackel_results_for_multiqc = Channel.from(false)
OPERATION_34 origin : [['false', 'V']]
OPERATION_34 gives  : [['ch_methyldackel_results_for_multiqc', 'P']]


OPERATION_35 string : ch_sorted_bam = Channel.from(false)
OPERATION_35 origin : [['false', 'V']]
OPERATION_35 gives  : [['ch_sorted_bam', 'P']]


OPERATION_36 string : ch_cgmap_CG_file = Channel.from(false)
OPERATION_36 origin : [['false', 'V']]
OPERATION_36 gives  : [['ch_cgmap_CG_file', 'P']]


OPERATION_37 string : ch_cgmap_visualization_cove = Channel.from(false)
OPERATION_37 origin : [['false', 'V']]
OPERATION_37 gives  : [['ch_cgmap_visualization_cove', 'P']]


OPERATION_38 string : ch_cgmap_ATCG_to_extract_CHR = Channel.from(false)
OPERATION_38 origin : [['false', 'V']]
OPERATION_38 gives  : [['ch_cgmap_ATCG_to_extract_CHR', 'P']]


OPERATION_39 string : ch_cgmap_atcgmap_chr = Channel.from(false)
OPERATION_39 origin : [['false', 'V']]
OPERATION_39 gives  : [['ch_cgmap_atcgmap_chr', 'P']]


OPERATION_40 string : ch_wherearemyfiles_for_alignment.set { ch_wherearemyfiles_for_bismark_align }
OPERATION_40 origin : [['ch_wherearemyfiles_for_alignment', 'P']]
OPERATION_40 gives  : [['ch_wherearemyfiles_for_bismark_align', 'P']]


OPERATION_41 string : ch_wherearemyfiles_for_alignment.into { ch_wherearemyfiles_for_bwamem_align; ch_wherearemyfiles_for_samtools_sort_index_flagstat }
OPERATION_41 origin : [['ch_wherearemyfiles_for_alignment', 'P']]
OPERATION_41 gives  : [['ch_wherearemyfiles_for_bwamem_align', 'P'], ['ch_wherearemyfiles_for_samtools_sort_index_flagstat', 'P']]


OPERATION_42 string : ch_fasta_for_makeBwaMemIndex.close()
OPERATION_42 origin : [['ch_fasta_for_makeBwaMemIndex', 'P']]
OPERATION_42 gives  : []


OPERATION_43 string : ch_fasta_for_makeFastaIndex.close()
OPERATION_43 origin : [['ch_fasta_for_makeFastaIndex', 'P']]
OPERATION_43 gives  : []


OPERATION_44 string : save_intermeds.join(', ')
OPERATION_44 origin : [['save_intermeds', 'P']]
OPERATION_44 gives  : []


OPERATION_45 string : configFiles.join(', ')
OPERATION_45 origin : [['configFiles', 'P']]
OPERATION_45 gives  : []


OPERATION_46 string : ch_bam_for_bismark_deduplicate.into { ch_bam_dedup_for_bismark_methXtract; ch_bam_dedup_for_qualimap; ch_bam_cgmaptools }
OPERATION_46 origin : [['ch_bam_for_bismark_deduplicate', 'P']]
OPERATION_46 gives  : [['ch_bam_dedup_for_bismark_methXtract', 'P'], ['ch_bam_dedup_for_qualimap', 'P'], ['ch_bam_cgmaptools', 'P']]


OPERATION_47 string : ch_bismark_align_log_for_bismark_report
     .join(ch_bismark_dedup_log_for_bismark_report)
     .join(ch_bismark_splitting_report_for_bismark_report)
     .join(ch_bismark_mbias_for_bismark_report)
     .set{ ch_bismark_logs_for_bismark_report }
OPERATION_47 origin : [['ch_bismark_align_log_for_bismark_report', 'P'], ['ch_bismark_dedup_log_for_bismark_report', 'P'], ['ch_bismark_splitting_report_for_bismark_report', 'P'], ['ch_bismark_mbias_for_bismark_report', 'P']]
OPERATION_47 gives  : [['ch_bismark_logs_for_bismark_report', 'P']]


OPERATION_48 string : ch_bam_sorted_for_markDuplicates.into { ch_bam_dedup_for_methyldackel; ch_bam_dedup_for_qualimap; ch_bam_cgmaptools }
OPERATION_48 origin : [['ch_bam_sorted_for_markDuplicates', 'P']]
OPERATION_48 gives  : [['ch_bam_dedup_for_methyldackel', 'P'], ['ch_bam_dedup_for_qualimap', 'P'], ['ch_bam_cgmaptools', 'P']]


OPERATION_49 string : ch_bam_index.set { ch_bam_index_for_methyldackel }
OPERATION_49 origin : [['ch_bam_index', 'P']]
OPERATION_49 gives  : [['ch_bam_index_for_methyldackel', 'P']]


OPERATION_50 string : ch_bam_dedup_for_qualimap_indep.set { ch_bam_dedup_for_qualimap }
OPERATION_50 origin : [['ch_bam_dedup_for_qualimap_indep', 'P']]
OPERATION_50 gives  : [['ch_bam_dedup_for_qualimap', 'P']]


OPERATION_51 string : ch_trimmed_reads_for_alignment = ch_read_files_trimming
OPERATION_51 origin : [['ch_read_files_trimming', 'P']]
OPERATION_51 gives  : [['ch_trimmed_reads_for_alignment', 'P']]


OPERATION_52 string : ch_cgmap_CG_file = ch_cgmap_PE
OPERATION_52 origin : [['ch_cgmap_PE', 'P']]
OPERATION_52 gives  : [['ch_cgmap_CG_file', 'P']]


OPERATION_53 string : ch_cgmap_for_MKit = ch_cgmap_methkit_PE
OPERATION_53 origin : [['ch_cgmap_methkit_PE', 'P']]
OPERATION_53 gives  : [['ch_cgmap_for_MKit', 'P']]


OPERATION_54 string : ch_cgmap_to_extract_CHR = ch_cgmap_to_extract_CHR_PE
OPERATION_54 origin : [['ch_cgmap_to_extract_CHR_PE', 'P']]
OPERATION_54 gives  : [['ch_cgmap_to_extract_CHR', 'P']]


