Name : Register_T1
Inputs : [[0, 't1s_for_register']]
Outputs : [[0, 'transformation_for_t1s'], [0, 'transformation_for_trk']]
Emits : []


Name : Transform_NII
Inputs : [[0, 'nii_and_template_for_transformation']]
Outputs : []
Emits : []


Name : Transform_TRK
Inputs : [[0, 'trk_and_template_for_transformation']]
Outputs : [[0, 'transformed_for_remove_out_not_JHU'], [0, 'transformed_for_unplausible']]
Emits : []


Name : Remove_invalid_streamlines
Inputs : [[0, 'for_remove_invalid_streamlines']]
Outputs : [[0, 'rm_invalid_for_remove_out_not_JHU']]
Emits : []


Name : Remove_out_not_JHU
Inputs : [[0, 'for_remove_out_not_JHU']]
Outputs : [[0, 'wb_for_rm_crossing_gyri'], [2, 'sid']]
Emits : []


Name : Remove_crossing_Gyri
Inputs : [[0, 'wb_for_rm_crossing_gyri']]
Outputs : [[0, 'wb_for_pruning'], [2, 'sid']]
Emits : []


Name : Pruning
Inputs : [[0, 'wb_for_pruning']]
Outputs : [[0, 'wb_for_rmloop'], [2, 'sid']]
Emits : []


Name : remove_loops
Inputs : [[0, 'wb_for_rmloop']]
Outputs : [[0, 'wb_for_rm_end_in_cc_dwm'], [1, 'sid']]
Emits : []


Name : remove_ee_CC_DWM
Inputs : [[0, 'wb_for_rm_end_in_cc_dwm']]
Outputs : [[0, 'wb_for_extract_end_in_cerebellum'], [0, 'wb_for_extract_first_unplausible'], [1, 'sid']]
Emits : []


Name : extract_first_unplausible
Inputs : [[0, 'unplausible_streamlines']]
Outputs : [[0, 'unplausible_for_fornix']]
Emits : []


Name : extract_fornix
Inputs : [[0, 'unplausible_for_fornix']]
Outputs : [[0, 'fornix_for_trk_plausible'], [0, 'fornix_for_rename']]
Emits : []


Name : extract_ee_cerebellum
Inputs : [[0, 'wb_for_extract_end_in_cerebellum']]
Outputs : [[0, 'wb_for_extract_end_in_brainstem'], [1, 'ee_cerebellum_for_extract_plausible']]
Emits : []


Name : extract_plausible_cerebellum
Inputs : [[0, 'ee_cerebellum_for_extract_plausible']]
Outputs : [[0, 'cerebellum_for_trk_plausible'], [0, 'cerebellum_for_rename']]
Emits : []


Name : extract_ee_brainstem
Inputs : [[0, 'wb_for_extract_end_in_brainstem']]
Outputs : [[0, 'wb_for_split_end_in_CGMSWI'], [1, 'all_brainstem_for_extract_plausible']]
Emits : []


Name : extract_plausible_brainstem
Inputs : [[0, 'all_brainstem_for_extract_plausible']]
Outputs : [[0, 'brainstem_for_trk_plausible'], [0, 'brainstem_for_rename'], [7, 'brainstem_corticopontine_frontal_for_rename'], [8, 'brainstem_ee_corticopontine_parietotemporooccipital_for_rename'], [9, 'brainstem_pyramidal_for_rename']]
Emits : []


Name : remove_out_of_CGM_DWM
Inputs : [[0, 'wb_for_split_end_in_CGMSWI']]
Outputs : [[0, 'wb_for_extract_all_commissural'], [1, 'endNotInCGMSWI']]
Emits : []


Name : extract_all_commissural
Inputs : [[0, 'wb_for_extract_all_commissural']]
Outputs : [[0, 'cc_for_ee_BG'], [0, 'cc_for_remove_unplausible'], [1, 'no_cc_for_split_asso_BG']]
Emits : []


Name : split_CC_BG
Inputs : [[0, 'cc_for_ee_BG'], [1, 'sides']]
Outputs : [[0, 'inCCBG']]
Emits : []


Name : first_cc_cleaning
Inputs : [[0, 'cc_for_remove_unplausible']]
Outputs : [[0, 'cc_for_merge_plausible_01'], [1, 'sid']]
Emits : []


Name : Split_no_CC_Asso_and_BG
Inputs : [[0, 'no_cc_for_split_asso_BG']]
Outputs : [[0, 'asso_BG_for_split_Thal'], [0, 'asso_BG_for_split_Put'], [0, 'asso_BG_for_split_Caud'], [2, 'asso_noBG_for_split_hemi']]
Emits : []


Name : split_BG_Thal
Inputs : [[0, 'asso_BG_for_split_Thal'], [1, 'bg_thal_list'], [2, 'sides_split_BG_Thal']]
Outputs : [[0, 'BG_ipsi_Thal_for_merge'], [1, 'BG_ipsi_Thal_split_for_merge'], [2, 'BG_ipsi_Thal_for_filter_CuGWM'], [2, 'BG_ipsi_Thal_for_filter_LGWM']]
Emits : []


Name : merge_BG_Thal
Inputs : [[0, 'BG_ipsi_Thal_list_for_merge']]
Outputs : [[0, 'BG_ipsi_Thal_for_trk_plausible']]
Emits : []


Name : split_BG_Put
Inputs : [[0, 'asso_BG_for_split_Put'], [1, 'bg_put_list'], [2, 'sides_split_BG_Put']]
Outputs : [[0, 'BG_ipsi_Put_for_merge'], [1, 'BG_ipsi_Put_for_rename']]
Emits : []


Name : merge_BG_Put
Inputs : [[0, 'BG_ipsi_Put_list_for_merge']]
Outputs : [[0, 'BG_ipsi_Put_for_trk_plausible']]
Emits : []


Name : split_BG_Caud
Inputs : [[0, 'asso_BG_for_split_Caud'], [1, 'bg_caud_list'], [2, 'sides_split_BG_Caud']]
Outputs : [[0, 'BG_ipsi_Caud_for_merge'], [1, 'BG_ipsi_Caud_for_rename']]
Emits : []


Name : merge_BG_Caud
Inputs : [[0, 'BG_ipsi_Caud_list_for_merge']]
Outputs : [[0, 'BG_ipsi_Caud_for_trk_plausible']]
Emits : []


Name : split_asso_in_hemi
Inputs : [[0, 'asso_noBG_for_split_hemi'], [1, 'sides']]
Outputs : [[0, 'asso_for_extract_u_shape'], [1, 'sid']]
Emits : []


Name : split_ushape_CGM_asso
Inputs : [[0, 'asso_for_extract_u_shape']]
Outputs : [[0, 'assoCGM'], [1, 'assoUShape'], [2, 'asso_u_shape_for_trk_plausible'], [3, 'asso_u_shape_for_rename'], [4, 'asso_for_remove_long_range']]
Emits : []


Name : Remove_Unplausible_Long_Range_Asso
Inputs : [[0, 'asso_for_remove_long_range']]
Outputs : [[0, 'asso_all_intra_inter'], [1, 'sid']]
Emits : []


Name : CC_Homotopic
Inputs : [[0, 'CC_for_homotopic'], [1, 'cc_homotopic_pairs']]
Outputs : [[0, 'CC_Homotopic_for_merge'], [1, 'CC_Homotopic_for_filter_AGWM'], [1, 'CC_Homotopic_for_filter_CingGWM'], [1, 'CC_Homotopic_for_filter_CuGWM'], [1, 'CC_Homotopic_for_filter_FuGWM'], [1, 'CC_Homotopic_for_filter_Hippo'], [1, 'CC_Homotopic_for_filter_IFGWM'], [1, 'CC_Homotopic_for_filter_Ins'], [1, 'CC_Homotopic_for_filter_IOGWM'], [1, 'CC_Homotopic_for_filter_ITGWM'], [1, 'CC_Homotopic_for_filter_LFOGWM'], [1, 'CC_Homotopic_for_filter_LGWM'], [1, 'CC_Homotopic_for_filter_MFGWM'], [1, 'CC_Homotopic_for_filter_MFOGWM'], [1, 'CC_Homotopic_for_filter_MOGWM'], [1, 'CC_Homotopic_for_filter_MTGWM'], [1, 'CC_Homotopic_for_filter_PHG'], [1, 'CC_Homotopic_for_filter_PoCGWM'], [1, 'CC_Homotopic_for_filter_PrCGWM'], [1, 'CC_Homotopic_for_filter_PrCuGWM'], [1, 'CC_Homotopic_for_filter_RGGWM'], [1, 'CC_Homotopic_for_filter_SFGWM'], [1, 'CC_Homotopic_for_filter_SMGWM'], [1, 'CC_Homotopic_for_filter_SOGWM'], [1, 'CC_Homotopic_for_filter_SPGWM'], [1, 'CC_Homotopic_for_filter_STGWM'], [1, 'CC_Homotopic_for_filter_T_pole_gwm']]
Emits : []


Name : CC_Homotopic_merge
Inputs : [[0, 'CC_Homotopic_list_for_merge']]
Outputs : [[0, 'CC_homo_for_trk_plausible'], [0, 'CC_homo_for_renaming']]
Emits : []


Name : asso_ventral_f_t
Inputs : [[0, 'asso_all_intra_inter_for_ventral_f_t_filtering'], [1, 'asso_ventral_f_t_list']]
Outputs : [[0, 'asso_all_intra_inter_ventral_f_t_for_merge'], [1, 'sid']]
Emits : []


Name : merge_asso_ventral_f_t
Inputs : [[0, 'asso_all_intra_inter_ventral_f_t_list_for_merge']]
Outputs : [[0, 'asso_all_intra_inter_ventral_all_f_t_for_merge']]
Emits : []


Name : asso_ventral_f_o_f_p
Inputs : [[0, 'asso_all_intra_inter_for_ventral_f_o_f_p_filtering'], [1, 'asso_ventral_f_o_f_p_lists']]
Outputs : [[0, 'asso_all_intra_inter_ventral_all_f_o_f_p_for_merge'], [1, 'sid']]
Emits : []


Name : merge_asso_ventral
Inputs : [[0, 'asso_all_intra_inter_ventral_all_for_merge']]
Outputs : [[0, 'asso_all_ventral_for_trk_plausible'], [1, 'asso_all_ventral_for_split_ifof_uf']]
Emits : []


Name : split_asso_ventral_ifof_uf
Inputs : [[0, 'asso_all_ventral_for_split_ifof_uf']]
Outputs : [[0, 'asso_IFOF_for_rename'], [1, 'asso_UF_for_rename']]
Emits : []


Name : asso_dorsal_f_p
Inputs : [[0, 'asso_all_intra_inter_for_dorsal_f_p_filtering'], [1, 'asso_dorsal_f_p_lists']]
Outputs : [[0, 'asso_all_intra_inter_dorsal_f_p_for_merge'], [1, 'asso_all_intra_inter_dorsal_f_p_for_rename'], [2, 'sid']]
Emits : []


Name : merge_asso_dorsal_f_p
Inputs : [[0, 'asso_all_intra_inter_dorsal_f_p_list_for_merge']]
Outputs : [[0, 'asso_all_intra_inter_dorsal_all_f_p_for_merge']]
Emits : []


Name : asso_dorsal_f_o_f_t
Inputs : [[0, 'asso_all_intra_inter_for_dorsal_f_o_f_t_filtering'], [1, 'asso_dorsal_f_o_f_t_list']]
Outputs : [[0, 'asso_all_intra_inter_dorsal_all_f_o_f_t_for_merge'], [1, 'asso_all_intra_inter_dorsal_all_f_T_for_filter'], [1, 'asso_all_intra_inter_dorsal_all_f_O_for_filter'], [2, 'sid']]
Emits : []


Name : merge_asso_dorsal
Inputs : [[0, 'asso_all_intra_inter_dorsal_all_for_merge']]
Outputs : [[0, 'asso_all_dorsal_for_trk_plausible']]
Emits : []


Name : asso_p_o
Inputs : [[0, 'asso_all_intra_inter_for_p_o_filtering'], [1, 'asso_p_o_list']]
Outputs : [[0, 'asso_intra_inter_p_o_for_merge'], [1, 'sid']]
Emits : []


Name : merge_p_o
Inputs : [[0, 'asso_intra_inter_p_o_list_for_merge']]
Outputs : [[0, 'all_P_O_for_trk_plausible']]
Emits : []


Name : asso_p_t
Inputs : [[0, 'asso_all_intra_inter_for_p_t_filtering'], [1, 'asso_p_t_list']]
Outputs : [[0, 'asso_intra_inter_p_t_for_merge'], [1, 'sid']]
Emits : []


Name : merge_p_t
Inputs : [[0, 'asso_intra_inter_p_t_list_for_merge']]
Outputs : [[0, 'all_P_T_for_trk_plausible']]
Emits : []


Name : asso_o_t
Inputs : [[0, 'asso_all_intra_inter_for_o_t_filtering'], [1, 'asso_o_t_list']]
Outputs : [[0, 'asso_intra_inter_o_t_for_merge'], [1, 'sid']]
Emits : []


Name : merge_o_t
Inputs : [[0, 'asso_intra_inter_o_t_list_for_merge']]
Outputs : [[0, 'all_O_T_for_trk_plausible'], [1, 'all_O_T_for_rename']]
Emits : []


Name : asso_ins
Inputs : [[0, 'asso_all_intra_inter_for_ins_filtering'], [1, 'asso_ins_list']]
Outputs : [[0, 'asso_intra_inter_ins_for_merge'], [1, 'sid']]
Emits : []


Name : merge_ins
Inputs : [[0, 'asso_intra_inter_ins_list_for_merge']]
Outputs : [[0, 'Ins_for_trk_plausible']]
Emits : []


Name : asso_Cing
Inputs : [[0, 'asso_all_intra_inter_for_cing_filtering']]
Outputs : [[0, 'Cing_for_trk_plausible'], [1, 'Cing_for_rename'], [2, 'sid']]
Emits : []


Name : asso_be_frontal_gyrus
Inputs : [[0, 'asso_all_intra_inter_for_be_frontal_filtering'], [1, 'asso_frontal_be_list']]
Outputs : [[0, 'asso_frontal_be_for_merge']]
Emits : []


Name : merge_asso_be_frontal_gyrus
Inputs : [[0, 'asso_frontal_be_list_for_merge']]
Outputs : [[0, 'asso_all_intraF_be_for_trk_plausible']]
Emits : []


Name : asso_ee_frontal_gyrus
Inputs : [[0, 'asso_frontal_ee_for_extract']]
Outputs : [[0, 'asso_frontal_ee_for_merge']]
Emits : []


Name : merge_asso_ee_frontal_gyrus
Inputs : [[0, 'asso_frontal_ee_list_for_merge']]
Outputs : [[0, 'asso_all_intraF_ee_for_trk_plausible']]
Emits : []


Name : asso_be_occipital_gyrus
Inputs : [[0, 'asso_all_intra_inter_for_be_occipital_filtering'], [1, 'asso_occipital_be_list']]
Outputs : [[0, 'asso_occipital_be_for_merge']]
Emits : []


Name : merge_asso_be_occipital_gyrus
Inputs : [[0, 'asso_occipital_be_list_for_merge']]
Outputs : [[0, 'asso_all_intraO_be_for_trk_plausible']]
Emits : []


Name : asso_ee_occipital_gyrus
Inputs : [[0, 'asso_occipital_ee_for_extract']]
Outputs : [[0, 'asso_occipital_ee_for_merge']]
Emits : []


Name : merge_asso_ee_occipital_gyrus
Inputs : [[0, 'asso_occipital_ee_list_for_merge']]
Outputs : [[0, 'asso_all_intraO_ee_for_trk_plausible']]
Emits : []


Name : asso_be_parietal_gyrus
Inputs : [[0, 'asso_all_intra_inter_for_be_parietal_filtering'], [1, 'asso_parietal_be_list']]
Outputs : [[0, 'asso_parietal_be_for_merge']]
Emits : []


Name : merge_asso_be_parietal_gyrus
Inputs : [[0, 'asso_parietal_be_list_for_merge']]
Outputs : [[0, 'asso_all_intraP_be_for_trk_plausible']]
Emits : []


Name : asso_ee_parietal_gyrus
Inputs : [[0, 'asso_parietal_ee_for_extract']]
Outputs : [[0, 'asso_parietal_ee_for_merge']]
Emits : []


Name : merge_asso_ee_parietal_gyrus
Inputs : [[0, 'asso_parietal_ee_list_for_merge']]
Outputs : [[0, 'asso_all_intraP_ee_for_trk_plausible']]
Emits : []


Name : asso_be_temporal_gyrus
Inputs : [[0, 'asso_all_intra_inter_for_be_temporal_filtering'], [1, 'asso_temporal_be_list']]
Outputs : [[0, 'asso_temporal_be_for_merge']]
Emits : []


Name : merge_asso_be_temporal_gyrus
Inputs : [[0, 'asso_temporal_be_list_for_merge']]
Outputs : [[0, 'asso_all_intraT_be_for_trk_plausible']]
Emits : []


Name : asso_ee_temporal_gyrus
Inputs : [[0, 'asso_temporal_ee_for_extract']]
Outputs : [[0, 'asso_temporal_ee_for_merge']]
Emits : []


Name : merge_asso_ee_temporal_gyrus
Inputs : [[0, 'asso_temporal_ee_list_for_merge']]
Outputs : [[0, 'asso_all_intraT_ee_for_trk_plausible']]
Emits : []


Name : merge_trk_plausible
Inputs : [[0, 'merge_trk_plausible']]
Outputs : [[0, 'plausible_for_extract_unplausible']]
Emits : []


Name : extract_trk_unplausible
Inputs : [[0, 'for_trk_unplausible']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_cc_homotopic
Inputs : [[0, 'CC_Homotopic_frontal_for_rename'], [1, 'CC_Homotopic_occipital_for_rename'], [2, 'CC_Homotopic_temporal_for_rename'], [3, 'CC_Homotopic_parietal_for_rename'], [4, 'CC_Homotopic_insular_for_rename'], [5, 'CC_Homotopic_cingulum_for_rename']]
Outputs : [[0, 'sid'], [1, 'sid'], [2, 'sid'], [3, 'sid'], [4, 'sid'], [5, 'sid']]
Emits : []


Name : rename_cortico_striate
Inputs : [[0, 'cortico_striate_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_coronaradiata
Inputs : [[0, 'BG_ipsi_Thal_for_rename']]
Outputs : [[0, 'side']]
Emits : []


Name : rename_optical_radiation
Inputs : [[0, 'optic_radiation_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_ushape
Inputs : [[0, 'asso_u_shape_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_cing
Inputs : [[0, 'Cing_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_slf
Inputs : [[0, 'slf_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_af
Inputs : [[0, 'asso_all_intra_inter_dorsal_all_f_T_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_corticopontine_F
Inputs : [[0, 'brainstem_corticopontine_frontal_for_rename'], [1, 'side_corticopontineF']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_corticopontine_POT
Inputs : [[0, 'brainstem_ee_corticopontine_parietotemporooccipital_for_rename'], [1, 'side_corticopontinePOT']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_cst
Inputs : [[0, 'brainstem_pyramidal_for_rename'], [1, 'side_cst']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_fornix
Inputs : [[0, 'fornix_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_ifof
Inputs : [[0, 'asso_IFOF_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_uf
Inputs : [[0, 'asso_UF_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_ilf
Inputs : [[0, 'all_O_T_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_brainstem
Inputs : [[0, 'brainstem_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


Name : rename_cerebellum
Inputs : [[0, 'cerebellum_for_rename']]
Outputs : [[0, 'sid']]
Emits : []


