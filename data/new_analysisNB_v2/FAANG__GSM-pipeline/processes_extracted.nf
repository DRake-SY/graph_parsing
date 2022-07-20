Name : get_software_versions
Inputs : []
Outputs : [[0, 'ch_software_versions_yaml_for_multiqc']]
Emits : []


Name : makeBismarkIndex
Inputs : [[0, 'ch_fasta_for_makeBismarkIndex']]
Outputs : [[0, 'ch_bismark_index_for_bismark_align'], [0, 'ch_bismark_index_for_bismark_methXtract'], [0, 'ch_bismark_index_for_bismark_methXtract_2']]
Emits : []


Name : makeBwaMemIndex
Inputs : [[0, 'ch_fasta_for_makeBwaMemIndex']]
Outputs : [[0, 'ch_bwa_meth_indices_for_bwamem_align'], [1, 'fasta']]
Emits : []


Name : makeFastaIndex
Inputs : [[0, 'ch_fasta_for_makeFastaIndex']]
Outputs : [[0, 'ch_fasta_index_for_methyldackel']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_read_files_fastqc']]
Outputs : [[0, 'ch_fastqc_results_for_multiqc']]
Emits : []


Name : trim_galore
Inputs : [[0, 'ch_read_files_trimming'], [1, 'ch_wherearemyfiles_for_trimgalore']]
Outputs : [[0, 'ch_trimmed_reads_for_alignment'], [1, 'ch_trim_galore_results_for_multiqc']]
Emits : []


Name : bismark_align
Inputs : [[0, 'ch_trimmed_reads_for_alignment'], [1, 'ch_bismark_index_for_bismark_align'], [2, 'ch_wherearemyfiles_for_bismark_align'], [3, 'ch_splicesites_for_bismark_hisat_align']]
Outputs : [[0, 'ch_bam_for_bismark_deduplicate'], [0, 'ch_bam_for_bismark_summary'], [0, 'ch_bam_for_preseq'], [1, 'ch_bismark_align_log_for_bismark_report'], [1, 'ch_bismark_align_log_for_bismark_summary'], [1, 'ch_bismark_align_log_for_multiqc']]
Emits : []


Name : bismark_deduplicate
Inputs : [[0, 'ch_bam_for_bismark_deduplicate']]
Outputs : [[0, 'ch_bam_dedup_for_bismark_methXtract'], [0, 'ch_bam_dedup_for_qualimap'], [0, 'ch_bam_cgmaptools'], [1, 'ch_bismark_dedup_log_for_bismark_report'], [1, 'ch_bismark_dedup_log_for_bismark_summary'], [1, 'ch_bismark_dedup_log_for_multiqc']]
Emits : []


Name : bismark_methXtract
Inputs : [[0, 'ch_bam_dedup_for_bismark_methXtract'], [1, 'ch_bismark_index_for_bismark_methXtract']]
Outputs : [[0, 'ch_bismark_splitting_report_for_bismark_report'], [0, 'ch_bismark_splitting_report_for_bismark_summary'], [0, 'ch_bismark_splitting_report_for_multiqc'], [1, 'ch_bismark_mbias_for_bismark_report'], [1, 'ch_bismark_mbias_for_bismark_summary'], [1, 'ch_bismark_mbias_for_multiqc'], [3, 'ch_bismark_to_cgmap_OG']]
Emits : []


Name : bismark_report
Inputs : [[0, 'ch_bismark_logs_for_bismark_report']]
Outputs : [[0, 'ch_bismark_reports_results_for_multiqc']]
Emits : []


Name : bismark_summary
Inputs : [[0, 'ch_bam_for_bismark_summary'], [1, 'ch_bismark_align_log_for_bismark_summary'], [2, 'ch_bismark_dedup_log_for_bismark_summary'], [3, 'ch_bismark_splitting_report_for_bismark_summary'], [4, 'ch_bismark_mbias_for_bismark_summary']]
Outputs : [[0, 'ch_bismark_summary_results_for_multiqc']]
Emits : []


Name : bwamem_align
Inputs : [[0, 'ch_trimmed_reads_for_alignment'], [1, 'ch_bwa_meth_indices_for_bwamem_align'], [2, 'ch_wherearemyfiles_for_bwamem_align']]
Outputs : [[0, 'ch_bam_for_samtools_sort_index_flagstat'], [0, 'ch_bam_for_preseq'], [0, 'ch_bam_cgmaptools']]
Emits : []


Name : samtools_sort_index_flagstat
Inputs : [[0, 'ch_bam_for_samtools_sort_index_flagstat'], [1, 'ch_wherearemyfiles_for_samtools_sort_index_flagstat']]
Outputs : [[0, 'ch_indep_bam_sorted'], [0, 'ch_bam_sorted_for_markDuplicates'], [1, 'ch_bam_index'], [1, 'ch_indep_bam_index'], [2, 'ch_flagstat_results_for_multiqc'], [3, 'ch_samtools_stats_results_for_multiqc']]
Emits : []


Name : markDuplicates
Inputs : [[0, 'ch_bam_sorted_for_markDuplicates']]
Outputs : [[0, 'ch_bam_dedup_for_methyldackel'], [0, 'ch_bam_dedup_for_qualimap'], [0, 'ch_bam_cgmaptools'], [1, 'ch_bam_index_for_methyldackel'], [2, 'ch_markDups_results_for_multiqc']]
Emits : []


Name : methyldackel
Inputs : [[0, 'ch_bam_dedup_for_methyldackel'], [0, 'ch_bam_index_for_methyldackel'], [0, 'ch_fasta_for_methyldackel'], [0, 'ch_fasta_index_for_methyldackel']]
Outputs : [[0, 'ch_methyldackel_results_for_multiqc']]
Emits : []


Name : makeBismarkIndex_2
Inputs : [[0, 'ch_fasta_bismarkIndex_2']]
Outputs : [[0, 'ch_bismark_index_for_bismark_methXtract_2']]
Emits : []


Name : markDuplicates_bam_input
Inputs : [[0, 'ch_indep_bam_for_processing']]
Outputs : [[0, 'ch_bam_resort'], [0, 'ch_bam_dedup_for_qualimap_indep'], [1, 'ch_bam_index_indep'], [2, 'ch_markDups_results_for_multiqc_indep']]
Emits : []


Name : sort_bam_RG
Inputs : [[0, 'ch_bam_resort']]
Outputs : [[0, 'ch_bam_meth_call']]
Emits : []


Name : bismark_methXtract_2
Inputs : [[0, 'ch_bam_meth_call'], [1, 'ch_bismark_index_for_bismark_methXtract_2']]
Outputs : [[0, 'ch_bismark_splitting_report_for_bismark_report_2'], [0, 'ch_bismark_splitting_report_for_bismark_summary_2'], [0, 'ch_bismark_splitting_report_for_multiqc_2'], [1, 'ch_bismark_mbias_for_bismark_report_2'], [1, 'ch_bismark_mbias_for_bismark_summary_2'], [1, 'ch_bismark_mbias_for_multiqc_2'], [2, 'ch_bismark_to_cgmap'], [2, 'ch_view_bs']]
Emits : []


Name : CX_report_to_cgmap
Inputs : [[0, 'ch_bismark_to_cgmap']]
Outputs : [[0, 'ch_cgmap_PE'], [0, 'ch_cgmap_to_extract_CHR_PE'], [0, 'ch_cgmap_methkit_PE']]
Emits : []


Name : sort_bam_file
Inputs : [[0, 'ch_bam_cgmaptools']]
Outputs : [[0, 'ch_sorted_bam'], [0, 'ch_sorted_for_preseq']]
Emits : []


Name : cgmap_meth_calling
Inputs : [[0, 'ch_sorted_bam'], [0, 'ch_fasta_for_cgmaptools']]
Outputs : [[0, 'ch_cgmap_CG_file'], [0, 'ch_cgmap_to_extract_CHR'], [0, 'ch_cgmap_for_MKit'], [1, 'ch_cgmap_ATCG_file'], [1, 'ch_cgmap_ATCG_to_extract_CHR']]
Emits : []


Name : cgmap_visualisation_atcgmap
Inputs : [[0, 'ch_cgmap_ATCG_file']]
Outputs : [[0, 'ch_cgmap_visualization_cove'], [1, 'ch_cgmap_data']]
Emits : []


Name : cgmap_visualisation_cgmap
Inputs : [[0, 'ch_cgmap_CG_file']]
Outputs : [[0, 'ch_cgmap_vis_figure'], [1, 'ch_cgmap_mec_stat']]
Emits : []


Name : cgmap_conversion_methkit
Inputs : [[0, 'ch_cgmap_for_MKit']]
Outputs : [[0, 'ch_cgmap_to_MKit']]
Emits : []


Name : get_stats_mkit
Inputs : [[0, 'ch_cgmap_to_MKit']]
Outputs : [[0, 'ch_MKit_results_hist'], [1, 'ch_MKit_results_cov']]
Emits : []


Name : extract_chr_cgmap
Inputs : [[0, 'ch_cgmap_to_extract_CHR']]
Outputs : [[0, 'ch_cgmap_CG_cgm_chr_f']]
Emits : []


Name : extract_chr_cgmap_atcg
Inputs : [[0, 'ch_cgmap_ATCG_to_extract_CHR']]
Outputs : [[0, 'ch_cgmap_atcgmap_chr']]
Emits : []


Name : cgmap_visualisation_atcgmap_chr
Inputs : [[0, 'ch_cgmap_atcgmap_chr']]
Outputs : [[0, 'ch_cgmap_visualization_cove_chr'], [1, 'ch_cgmap_oac_bin_data_chr'], [2, 'ch_cgmap_oac_stat_data_chr']]
Emits : []


Name : visualisation_cgmap_sorted_chr
Inputs : [[0, 'ch_cgmap_CG_cgm_chr_f']]
Outputs : [[0, 'ch_cgmap_CHR_figures'], [1, 'ch_cgmap_CHR_mstat']]
Emits : []


Name : qualimap
Inputs : [[0, 'ch_bam_dedup_for_qualimap']]
Outputs : [[0, 'ch_qualimap_results_for_multiqc']]
Emits : []


Name : multiqc
Inputs : [[0, 'ch_multiqc_config'], [1, 'ch_multiqc_custom_config'], [2, 'ch_fastqc_results_for_multiqc'], [3, 'ch_trim_galore_results_for_multiqc'], [4, 'ch_bismark_align_log_for_multiqc'], [5, 'ch_bismark_dedup_log_for_multiqc'], [6, 'ch_bismark_splitting_report_for_multiqc'], [7, 'ch_bismark_mbias_for_multiqc'], [8, 'ch_bismark_reports_results_for_multiqc'], [9, 'ch_bismark_summary_results_for_multiqc'], [10, 'ch_flagstat_results_for_multiqc'], [11, 'ch_samtools_stats_results_for_multiqc'], [12, 'ch_markDups_results_for_multiqc'], [13, 'ch_methyldackel_results_for_multiqc'], [14, 'ch_software_versions_yaml_for_multiqc'], [15, 'ch_workflow_summary']]
Outputs : [[0, 'ch_multiqc_report']]
Emits : []


Name : output_documentation
Inputs : [[0, 'ch_output_docs'], [1, 'ch_output_docs_images']]
Outputs : []
Emits : []


