Name : base_quality_score_recalibration
Inputs : [[0, 'bam_bai_files'], [1, 'known_snps'], [2, 'known_snps_index'], [3, 'known_indels'], [4, 'known_indels_index'], [5, 'ref'], [6, 'ref_fai'], [7, 'ref_dict']]
Outputs : [[0, 'recal_table_files'], [1, 'recal_plots_files'], [2, 'final_bam_bai_files']]
Emits : []


Name : multiqc_final
Inputs : [[0, 'recal_table_files'], [1, 'recal_plots_files'], [2, 'ch_config_for_multiqc']]
Outputs : [[0, 'final_output'], [1, 'final_output_data']]
Emits : []


