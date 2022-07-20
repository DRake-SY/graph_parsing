Name : QC_Brain_Extraction_DWI
Inputs : [[0, 'dwi_mask_for_bet']]
Outputs : []
Emits : []


Name : QC_Brain_Extraction_T1
Inputs : [[0, 't1_mask_for_bet']]
Outputs : []
Emits : []


Name : QC_Denoise_DWI
Inputs : [[0, 'dwi_denoised']]
Outputs : []
Emits : []


Name : QC_Denoise_T1
Inputs : [[0, 't1_denoised']]
Outputs : []
Emits : []


Name : QC_Eddy_Topup
Inputs : [[0, 'b0_for_eddy_topup'], [1, 'b0_corrected'], [2, 'b0_mask_for_eddy_topup'], [3, 'counter_b0'], [4, 'counter_b0_eddy']]
Outputs : []
Emits : []


Name : QC_Resample_DWI
Inputs : [[0, 'b0_resampled'], [1, 'wm_for_resampled_dwi'], [2, 'gm_for_resampled_dwi'], [3, 'csf_for_resampled_dwi']]
Outputs : []
Emits : []


Name : QC_Resample_T1
Inputs : [[0, 't1_resampled']]
Outputs : []
Emits : []


Name : QC_DTI
Inputs : [[0, 'fa_for_dti_qa'], [1, 'md_for_dti_qa'], [2, 'rd_for_dti_qa'], [3, 'ad_for_dti_qa'], [4, 'residual_for_dti_qa'], [5, 'evecs_for_dti_qa'], [6, 'wm_for_dti'], [7, 'gm_for_dti'], [8, 'csf_for_dti']]
Outputs : []
Emits : []


Name : QC_FRF
Inputs : [[0, 'compute_frf']]
Outputs : []
Emits : []


Name : QC_FODF
Inputs : [[0, 'afd_max_for_fodf_qa'], [1, 'afd_sum_for_fodf_qa'], [2, 'afd_total_for_fodf_qa'], [3, 'nufo_for_fodf_qa'], [4, 'wm_for_fodf'], [5, 'gm_for_fodf'], [6, 'csf_for_fodf']]
Outputs : []
Emits : []


Name : QC_Tracking
Inputs : [[0, 'tracking_t1']]
Outputs : []
Emits : []


Name : QC_Segment_Tissues
Inputs : [[0, 'wm_for_seg'], [1, 'gm_for_seg'], [2, 'csf_for_seg']]
Outputs : []
Emits : []


Name : QC_PFT_Maps
Inputs : [[0, 'seeding'], [1, 'include'], [2, 'exclude']]
Outputs : []
Emits : []


Name : QC_Local_Tracking_Mask
Inputs : [[0, 'mask']]
Outputs : []
Emits : []


Name : QC_Local_Seeding_Mask
Inputs : [[0, 'seeding']]
Outputs : []
Emits : []


Name : QC_Register_T1
Inputs : [[0, 't1_warped_for_registration'], [1, 'rgb'], [2, 'wm_for_registration'], [3, 'gm_for_registration'], [4, 'csf_for_registration']]
Outputs : []
Emits : []


Name : QC_DWI_Protocol
Inputs : [[0, 'all_bval'], [1, 'all_bvec'], [2, 'all_json']]
Outputs : []
Emits : []


Name : QC_Raw_T1
Inputs : [[0, 'all_t1']]
Outputs : []
Emits : []


Name : QC_Raw_DWI
Inputs : [[0, 'all_dwi']]
Outputs : []
Emits : []


Name : Screenshots_RBx
Inputs : [[0, 'bundles_anat_for_screenshots']]
Outputs : [[0, 'screenshots_for_report']]
Emits : []


Name : QC_RBx
Inputs : [[0, 'screenshots_for_qc_rbx']]
Outputs : []
Emits : []


Name : QC_Register_Lesions_to_Template
Inputs : [[0, 't1_lesions_registered'], [1, 'labels_for_register_lesions_qc']]
Outputs : []
Emits : []


Name : QC_Register_Tractograms_to_Template
Inputs : [[0, 't1_tractograms_registered'], [1, 'labels_for_register_tractograms_qc']]
Outputs : []
Emits : []


Name : Create_disconets_csv
Inputs : [[0, 'matrices_labels_for_create_csv']]
Outputs : [[0, 'stats_to_be_collected']]
Emits : []


Name : QC_SC_Matrices
Inputs : [[0, 'lesion_png'], [1, 'stats_for_matrix']]
Outputs : []
Emits : []


