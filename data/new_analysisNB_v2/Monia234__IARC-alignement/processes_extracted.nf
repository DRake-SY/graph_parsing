Name : bam_realignment
Inputs : [[0, 'files'], [1, 'ref'], [2, 'ref_sa'], [3, 'ref_bwt'], [4, 'ref_ann'], [5, 'ref_amb'], [6, 'ref_pac'], [7, 'ref_0123'], [8, 'ref_bwt8bit'], [9, 'ref_alt'], [10, 'postaltjs']]
Outputs : [[0, 'bam_bai_files']]
Emits : []


Name : fastq_alignment
Inputs : [[0, 'readPairs'], [1, 'ref'], [2, 'ref_fai'], [3, 'ref_sa'], [4, 'ref_bwt'], [5, 'ref_ann'], [6, 'ref_amb'], [7, 'ref_pac'], [8, 'ref_dict'], [9, 'ref_0123'], [10, 'ref_bwt8bit'], [11, 'ref_alt'], [12, 'postaltjs']]
Outputs : [[0, 'bam_bai_files0']]
Emits : []


Name : qualimap_multi
Inputs : [[0, 'mult2QC'], [1, 'qualimap_ff']]
Outputs : [[0, 'qualimap_multi_results'], [1, 'flagstat_multi_results']]
Emits : []


Name : multiqc_multi
Inputs : [[0, 'qualimap_multi_results'], [1, 'flagstat_multi_results'], [2, 'ch_config_for_multiqc']]
Outputs : [[0, 'multi_output'], [1, 'multi_output_data']]
Emits : []


Name : merge
Inputs : [[0, 'bam_bai_grouped4merge']]
Outputs : [[0, 'bam_bai_files']]
Emits : []


Name : base_quality_score_recalibration
Inputs : [[0, 'bam_bai_files'], [1, 'known_snps'], [2, 'known_snps_index'], [3, 'known_indels'], [4, 'known_indels_index'], [5, 'ref'], [6, 'ref_fai'], [7, 'ref_dict']]
Outputs : [[0, 'recal_table_files'], [1, 'recal_plots_files'], [2, 'final_bam_bai_files']]
Emits : []


Name : qualimap_final
Inputs : [[0, 'final_bam_bai_files'], [1, 'qualimap_ff']]
Outputs : [[0, 'qualimap_results'], [1, 'flagstat_results']]
Emits : []


Name : multiqc_final
Inputs : [[0, 'qualimap_results'], [1, 'flagstat_results'], [2, 'recal_table_files'], [3, 'ch_config_for_multiqc']]
Outputs : [[0, 'final_output'], [1, 'final_output_data']]
Emits : []


