Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions']]
Emits : []


Name : cram_to_bam
Inputs : [[0, 'cramfiles']]
Outputs : [[0, 'sorted_bam_file'], [0, 'bam_for_dreg'], [0, 'bam_for_gene_counting']]
Emits : []


Name : bam_conversion_tfit
Inputs : [[0, 'sorted_bam_file']]
Outputs : [[0, 'bam_for_tfit']]
Emits : []


Name : bedgraphs
Inputs : [[0, 'bam_for_tfit']]
Outputs : [[0, 'fstitch_bg'], [1, 'prelimtfit_bg'], [1, 'prelimtfit_process_bg'], [1, 'modeltfit_bg'], [1, 'modeltfit_bg_split_max5kb'], [1, 'modeltfit_bg_split_max10kb'], [1, 'post_tfit_bg_split'], [1, 'nqc_bg']]
Emits : []


Name : FStitch
Inputs : [[0, 'fstitch_bg']]
Outputs : [[0, 'fs_train_out'], [1, 'fs_seg_out'], [2, 'fs_bidir_out'], [3, 'fs_bidir_short_long_out'], [4, 'fs_bidir_plot_out'], [5, 'fs_bidir_stats_out']]
Emits : []


Name : tfit_prelim
Inputs : [[0, 'prelimtfit_bg']]
Outputs : [[0, 'tfit_prelim_out'], [1, 'prelimtfit_logs_out']]
Emits : []


Name : tfit_prelim_process_split
Inputs : [[0, 'tfit_prelim_bg_out_preprocess']]
Outputs : [[0, 'tfit_prelim_bg_out'], [1, 'tfit_prelim_bg_out_split_max5kb'], [2, 'tfit_prelim_bg_out_split_max10kb']]
Emits : []


Name : tfit_split_model_max5kb
Inputs : [[0, 'tfit_prelim_bg_out_split_max5kb']]
Outputs : [[0, 'tfit_model_bed_out_split_max5kb'], [1, 'tfit_model_model_out_split_max5kb'], [2, 'tfit_model_logs_out_split_max5kb']]
Emits : []


Name : tfit_split_model_max10kb
Inputs : [[0, 'tfit_prelim_bg_out_split_max10kb']]
Outputs : [[0, 'tfit_model_bed_out_split_max10kb'], [1, 'tfit_model_model_out_split_max10kb'], [2, 'tfit_model_logs_out_split_max10kb']]
Emits : []


Name : tfit_split_cat
Inputs : [[0, 'tfit_split_results']]
Outputs : [[0, 'tfit_model_split_out']]
Emits : []


Name : tfit_prelim_process
Inputs : [[0, 'tfit_prelim_bg_out_preprocess']]
Outputs : [[0, 'tfit_prelim_bg_out']]
Emits : []


Name : tfit_model
Inputs : [[0, 'tfit_prelim_bg_out']]
Outputs : [[0, 'tfit_model_bed_out'], [1, 'tfit_model_model_out'], [2, 'tfit_model_logs_out']]
Emits : []


Name : dreg_prep
Inputs : [[0, 'bam_for_dreg']]
Outputs : [[0, 'dreg_bigwig'], [1, 'dreg_bg']]
Emits : []


Name : dreg_run
Inputs : [[0, 'dreg_bigwig']]
Outputs : [[0, 'dREG_out']]
Emits : []


Name : dreg_postprocess
Inputs : [[0, 'dreg_res_process']]
Outputs : [[0, 'dREG_res_out']]
Emits : []


Name : gene_count
Inputs : [[0, 'bam_for_gene_counting']]
Outputs : [[0, 'gene_count_out']]
Emits : []


