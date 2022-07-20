OPERATION_1 string : in_tractogram = Channel
        .fromFilePairs("$root/**/*.trk",
                       size:1,
                       maxDepth:1,
                       flat: true) {it.parent.name}
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_tractogram', 'P']]


OPERATION_2 string : Channel
    .fromPath("$root/**/*_t1.nii.gz",
              maxDepth:1)
             .map{[it.parent.name, it]}
             .into{t1s_for_register; t1s_for_transformation; check_t1s; t1s_empty}
OPERATION_2 origin : []
OPERATION_2 gives  : [['t1s_for_register', 'P'], ['t1s_for_transformation', 'P'], ['check_t1s', 'P'], ['t1s_empty', 'P']]


OPERATION_3 string : Channel.from(sides).into{sides_ipsi;
                         sides_split_CC_BG;
                         sides_split_BG_Thal;
                         sides_split_BG_Put;
                         sides_split_BG_Caud;
                         side_corticopontineF;
                         side_corticopontinePOT;
                         side_cst}
OPERATION_3 origin : [['sides', 'V']]
OPERATION_3 gives  : [['sides_ipsi', 'P'], ['sides_split_CC_BG', 'P'], ['sides_split_BG_Thal', 'P'], ['sides_split_BG_Put', 'P'], ['sides_split_BG_Caud', 'P'], ['side_corticopontineF', 'P'], ['side_corticopontinePOT', 'P'], ['side_cst', 'P']]


OPERATION_4 string : for_remove_invalid_streamlines = Channel.empty()
OPERATION_4 origin : []
OPERATION_4 gives  : [['for_remove_invalid_streamlines', 'P']]


OPERATION_5 string : Channel.from(bg_list).into{bg_thal_list;
                           bg_put_list}
OPERATION_5 origin : [['bg_list', 'V']]
OPERATION_5 gives  : [['bg_thal_list', 'P'], ['bg_put_list', 'P']]


OPERATION_6 string : asso_frontal_ee_list = Channel.from(['SFG_MFG', 70],['SFG_IFG', 70], ['SFG_PrCG', 90], ['SFG_FrOrbG', 70], ['MFG_IFG', 70], ['MFG_PrCG', 110], ['MFG_FrOrbG', 60], ['IFG_PrCG', 110], ['IFG_FrOrbG', 60])
OPERATION_6 origin : [["['SFG_MFG', 70],['SFG_IFG', 70], ['SFG_PrCG', 90], ['SFG_FrOrbG', 70], ['MFG_IFG', 70], ['MFG_PrCG', 110], ['MFG_FrOrbG', 60], ['IFG_PrCG', 110], ['IFG_FrOrbG', 60]", 'V']]
OPERATION_6 gives  : [['asso_frontal_ee_list', 'P']]


OPERATION_7 string : asso_occipital_ee_list = Channel.from(['MOG_SOG', 60],['MOG_IOG', 50], ['MOG_CuG', 60], ['SOG_CuG', 30], ['CuG_LG', 60])
OPERATION_7 origin : [["['MOG_SOG', 60],['MOG_IOG', 50], ['MOG_CuG', 60], ['SOG_CuG', 30], ['CuG_LG', 60]", 'V']]
OPERATION_7 gives  : [['asso_occipital_ee_list', 'P']]


OPERATION_8 string : asso_parietal_ee_list = Channel.from(['SPG_PoCG', 50], ['SPG_AG', 80], ['SPG_SMG', 70], ['SPG_PrCuG', 50], ['AG_PoCG', 10000], ['AG_SMG', 90], ['AG_PrCuG', 90] , ['SMG_PoCG', 60], ['SMG_PrCuG',100], ['PoCG_PrCuG', 80])
OPERATION_8 origin : [["['SPG_PoCG', 50], ['SPG_AG', 80], ['SPG_SMG', 70], ['SPG_PrCuG', 50], ['AG_PoCG', 10000], ['AG_SMG', 90], ['AG_PrCuG', 90] , ['SMG_PoCG', 60], ['SMG_PrCuG',100], ['PoCG_PrCuG', 80]", 'V']]
OPERATION_8 gives  : [['asso_parietal_ee_list', 'P']]


OPERATION_9 string : asso_temporal_ee_list = Channel.from(['STG_MTG', 60], ['STG_ITG',80], ['STG_Tpole',110], ['MTG_ITG',60], ['MTG_Tpole', 100000], ['ITG_Tpole', 60])
OPERATION_9 origin : [["['STG_MTG', 60], ['STG_ITG',80], ['STG_Tpole',110], ['MTG_ITG',60], ['MTG_Tpole', 100000], ['ITG_Tpole', 60]", 'V']]
OPERATION_9 gives  : [['asso_temporal_ee_list', 'P']]


OPERATION_10 string : in_tractogram.into{check_trks;
                       in_tractogram_for_unplausible;
                       in_tractogram_for_transformation;
                       in_tractogram_for_mix}
OPERATION_10 origin : [['in_tractogram', 'P']]
OPERATION_10 gives  : [['check_trks', 'P'], ['in_tractogram_for_unplausible', 'P'], ['in_tractogram_for_transformation', 'P'], ['in_tractogram_for_mix', 'P']]


OPERATION_11 string : check_trks.count().into{check_subjects_number; number_subj_for_null_check}
OPERATION_11 origin : [['check_trks', 'P']]
OPERATION_11 gives  : [['check_subjects_number', 'P'], ['number_subj_for_null_check', 'P']]


OPERATION_12 string : check_t1s.count().set{number_t1s_for_compare}
OPERATION_12 origin : [['check_t1s', 'P']]
OPERATION_12 gives  : [['number_t1s_for_compare', 'P']]


OPERATION_13 string : number_subj_for_null_check
.subscribe{a -> if (a == 0)
    error "Error ~ No subjects found. Please check the naming convention, your --input path."}
OPERATION_13 origin : [['number_subj_for_null_check', 'P']]
OPERATION_13 gives  : []


OPERATION_14 string : check_subjects_number
  .concat(number_t1s_for_compare)
  .toList()
  .subscribe{a, b -> if (a != b && b > 0)
  error "Error ~ Some subjects have a T1w and others don't.\n" +
        "Please be sure to have the same acquisitions for all subjects."}
OPERATION_14 origin : [['check_subjects_number', 'P'], ['number_t1s_for_compare', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : transformation_for_t1s
    .cross(t1s_for_transformation)
    .map { [ it[0][0], it[0][1], it[1][1] ] }
    .set{nii_and_template_for_transformation}
OPERATION_15 origin : [['transformation_for_t1s', 'P'], ['t1s_for_transformation', 'P']]
OPERATION_15 gives  : [['nii_and_template_for_transformation', 'P']]


OPERATION_16 string : transformation_for_trk
    .cross(in_tractogram_for_transformation)
    .map { [ it[0][0], it[0][1], it[1][1] ] }
    .set{trk_and_template_for_transformation}
OPERATION_16 origin : [['transformation_for_trk', 'P'], ['in_tractogram_for_transformation', 'P']]
OPERATION_16 gives  : [['trk_and_template_for_transformation', 'P']]


OPERATION_17 string : t1s_empty.count().get()==0){
  for_remove_invalid_streamlines = for_remove_invalid_streamlines.mix(in_tractogram_for_mix)
  in_tractogram_for_unplausible.into{trk_for_extract_first_unplausible; trk_for_extract_unplausible}
}
else{
  transformed_for_unplausible.into{trk_for_extract_first_unplausible; trk_for_extract_unplausible}
}
PROCESS DEF Remove_invalid_streamlines

rm_invalid_for_remove_out_not_JHU.mix(transformed_for_remove_out_not_JHU).set{for_remove_out_not_JHU}
PROCESS DEF Remove_out_not_JHU
PROCESS DEF Remove_crossing_Gyri

  
                                               
  PROCESS DEF Pruning
PROCESS DEF remove_loops
PROCESS DEF remove_ee_CC_DWM

trk_for_extract_first_unplausible.join(wb_for_extract_first_unplausible).set{unplausible_streamlines}PROCESS DEF extract_first_unplausible
PROCESS DEF extract_fornix

PROCESS DEF extract_ee_cerebellum

PROCESS DEF extract_plausible_cerebellum


  
                
  
PROCESS DEF extract_ee_brainstem

  
           
  
PROCESS DEF extract_plausible_brainstem

  
                             
  
PROCESS DEF remove_out_of_CGM_DWM
PROCESS DEF extract_all_commissural
PROCESS DEF split_CC_BG
PROCESS DEF first_cc_cleaning

  
                                  
  
PROCESS DEF Split_no_CC_Asso_and_BG

if (params.bg_lists) { 
bg_list = 
 } else { 
bg_list = 
 } 
OPERATION_5
  
       
  PROCESS DEF split_BG_Thal

BG_ipsi_Thal_split_for_merge.groupTuple(by
OPERATION_17 origin : [['t1s_empty', 'P'], ['wb_for_extract_first_unplausible', 'P'], ['in_tractogram_for_mix', 'P'], ['transformed_for_remove_out_not_JHU', 'P']]
OPERATION_17 gives  : [['for_remove_out_not_JHU', 'P'], ['unplausible_streamlines', 'P'], ['trk_for_extract_first_unplausible', 'P'], ['trk_for_extract_unplausible', 'P'], ['trk_for_extract_first_unplausible', 'P'], ['trk_for_extract_unplausible', 'P']]


OPERATION_18 string : BG_ipsi_Thal_for_filter_CuGWM.filter{it[2]=='CuGWM'}.set{CuGWM_for_combine}
OPERATION_18 origin : [['BG_ipsi_Thal_for_filter_CuGWM', 'P']]
OPERATION_18 gives  : [['CuGWM_for_combine', 'P']]


OPERATION_19 string : BG_ipsi_Thal_for_filter_LGWM.filter{it[2]=='LGWM'}.set{LGWM_for_combine}
OPERATION_19 origin : [['BG_ipsi_Thal_for_filter_LGWM', 'P']]
OPERATION_19 gives  : [['LGWM_for_combine', 'P']]


OPERATION_20 string : CuGWM_for_combine.concat(LGWM_for_combine).groupTuple(by:[0,1]).set{optic_radiation_for_rename}
OPERATION_20 origin : [['CuGWM_for_combine', 'P'], ['LGWM_for_combine', 'P']]
OPERATION_20 gives  : [['optic_radiation_for_rename', 'P']]


OPERATION_21 string : BG_ipsi_Thal_for_merge.groupTuple().map{it}.set{BG_ipsi_Thal_list_for_merge}
OPERATION_21 origin : [['BG_ipsi_Thal_for_merge', 'P']]
OPERATION_21 gives  : [['BG_ipsi_Thal_list_for_merge', 'P']]


OPERATION_22 string : BG_ipsi_Put_for_merge.groupTuple().map{it}.set{BG_ipsi_Put_list_for_merge}
OPERATION_22 origin : [['BG_ipsi_Put_for_merge', 'P']]
OPERATION_22 gives  : [['BG_ipsi_Put_list_for_merge', 'P']]


OPERATION_23 string : BG_ipsi_Caud_for_merge.groupTuple().map{it}.set{BG_ipsi_Caud_list_for_merge}
OPERATION_23 origin : [['BG_ipsi_Caud_for_merge', 'P']]
OPERATION_23 gives  : [['BG_ipsi_Caud_list_for_merge', 'P']]


OPERATION_24 string : asso_all_intra_inter.into{asso_all_intra_inter_for_ventral_f_o_f_p_filtering;
                          asso_all_intra_inter_for_ventral_f_t_filtering;
                          asso_all_intra_inter_for_dorsal_f_o_f_t_filtering;
                          asso_all_intra_inter_for_dorsal_f_p_filtering;
                          asso_all_intra_inter_for_p_o_filtering;
                          asso_all_intra_inter_for_p_t_filtering;
                          asso_all_intra_inter_for_o_t_filtering;
                          asso_all_intra_inter_for_ins_filtering;
                          asso_all_intra_inter_for_cing_filtering;
                          asso_all_intra_inter_for_be_frontal_filtering;
                          asso_all_intra_inter_for_ee_frontal_filtering;
                          asso_all_intra_inter_for_be_occipital_filtering;
                          asso_all_intra_inter_for_ee_occipital_filtering;
                          asso_all_intra_inter_for_be_parietal_filtering;
                          asso_all_intra_inter_for_ee_parietal_filtering;
                          asso_all_intra_inter_for_be_temporal_filtering;
                          asso_all_intra_inter_for_ee_temporal_filtering
                          asso_all_intra_inter_plausible}
OPERATION_24 origin : [['asso_all_intra_inter', 'P']]
OPERATION_24 gives  : []


OPERATION_25 string : asso_all_intra_inter_plausible.groupTuple().map{it.flatten().toList()}.set{asso_all_intra_inter_list}
OPERATION_25 origin : [['asso_all_intra_inter_plausible', 'P']]
OPERATION_25 gives  : [['asso_all_intra_inter_list', 'P']]


OPERATION_26 string : cc_for_merge_plausible_01.into{ccCleanedPlausible; CC_for_homotopic}
OPERATION_26 origin : [['cc_for_merge_plausible_01', 'P']]
OPERATION_26 gives  : [['ccCleanedPlausible', 'P'], ['CC_for_homotopic', 'P']]


OPERATION_27 string : assoCGM.groupTuple().map{it.flatten().toList()}.set{assoCGM_list}
OPERATION_27 origin : [['assoCGM', 'P']]
OPERATION_27 gives  : [['assoCGM_list', 'P']]


OPERATION_28 string : CC_Homotopic_for_filter_IFGWM.filter{it[1]=='IFGWM'}.set{CC_IFGWM_for_combine_frontal}
OPERATION_28 origin : [['CC_Homotopic_for_filter_IFGWM', 'P']]
OPERATION_28 gives  : [['CC_IFGWM_for_combine_frontal', 'P']]


OPERATION_29 string : CC_Homotopic_for_filter_SFGWM.filter{it[1]=='SFGWM'}.set{CC_SFGWM_for_combine_frontal}
OPERATION_29 origin : [['CC_Homotopic_for_filter_SFGWM', 'P']]
OPERATION_29 gives  : [['CC_SFGWM_for_combine_frontal', 'P']]


OPERATION_30 string : CC_Homotopic_for_filter_MFGWM.filter{it[1]=='MFGWM'}.set{CC_MFGWM_for_combine_frontal}
OPERATION_30 origin : [['CC_Homotopic_for_filter_MFGWM', 'P']]
OPERATION_30 gives  : [['CC_MFGWM_for_combine_frontal', 'P']]


OPERATION_31 string : CC_Homotopic_for_filter_MFOGWM.filter{it[1]=='MFOGWM'}.set{CC_MFOGWM_for_combine_frontal}
OPERATION_31 origin : [['CC_Homotopic_for_filter_MFOGWM', 'P']]
OPERATION_31 gives  : [['CC_MFOGWM_for_combine_frontal', 'P']]


OPERATION_32 string : CC_Homotopic_for_filter_LFOGWM.filter{it[1]=='LFOGWM'}.set{CC_LFOGWM_for_combine_frontal}
OPERATION_32 origin : [['CC_Homotopic_for_filter_LFOGWM', 'P']]
OPERATION_32 gives  : [['CC_LFOGWM_for_combine_frontal', 'P']]


OPERATION_33 string : CC_Homotopic_for_filter_PrCGWM.filter{it[1]=='PrCGWM'}.set{CC_PrCGWM_for_combine_frontal}
OPERATION_33 origin : [['CC_Homotopic_for_filter_PrCGWM', 'P']]
OPERATION_33 gives  : [['CC_PrCGWM_for_combine_frontal', 'P']]


OPERATION_34 string : CC_Homotopic_for_filter_RGGWM.filter{it[1]=='RGGWM'}.set{CC_RGGWM_for_combine_frontal}
OPERATION_34 origin : [['CC_Homotopic_for_filter_RGGWM', 'P']]
OPERATION_34 gives  : [['CC_RGGWM_for_combine_frontal', 'P']]


OPERATION_35 string : CC_IFGWM_for_combine_frontal.concat(CC_SFGWM_for_combine_frontal).concat(CC_MFGWM_for_combine_frontal).concat(CC_MFOGWM_for_combine_frontal).concat(CC_LFOGWM_for_combine_frontal).concat(CC_PrCGWM_for_combine_frontal).concat(CC_RGGWM_for_combine_frontal).groupTuple(by:0).set{CC_Homotopic_frontal_for_rename}
OPERATION_35 origin : [['CC_IFGWM_for_combine_frontal', 'P'], ['CC_SFGWM_for_combine_frontal', 'P'], ['CC_MFGWM_for_combine_frontal', 'P'], ['CC_MFOGWM_for_combine_frontal', 'P'], ['CC_LFOGWM_for_combine_frontal', 'P'], ['CC_PrCGWM_for_combine_frontal', 'P'], ['CC_RGGWM_for_combine_frontal', 'P']]
OPERATION_35 gives  : [['CC_Homotopic_frontal_for_rename', 'P']]


OPERATION_36 string : CC_Homotopic_for_filter_SOGWM.filter{it[1]=='SOGWM'}.set{CC_SOGWM_for_combine_occipital}
OPERATION_36 origin : [['CC_Homotopic_for_filter_SOGWM', 'P']]
OPERATION_36 gives  : [['CC_SOGWM_for_combine_occipital', 'P']]


OPERATION_37 string : CC_Homotopic_for_filter_MOGWM.filter{it[1]=='MOGWM'}.set{CC_MOGWM_for_combine_occipital}
OPERATION_37 origin : [['CC_Homotopic_for_filter_MOGWM', 'P']]
OPERATION_37 gives  : [['CC_MOGWM_for_combine_occipital', 'P']]


OPERATION_38 string : CC_Homotopic_for_filter_IOGWM.filter{it[1]=='IOGWM'}.set{CC_IOGWM_for_combine_occipital}
OPERATION_38 origin : [['CC_Homotopic_for_filter_IOGWM', 'P']]
OPERATION_38 gives  : [['CC_IOGWM_for_combine_occipital', 'P']]


OPERATION_39 string : CC_Homotopic_for_filter_CuGWM.filter{it[1]=='CuGWM'}.set{CC_CuGWM_for_combine_occipital}
OPERATION_39 origin : [['CC_Homotopic_for_filter_CuGWM', 'P']]
OPERATION_39 gives  : [['CC_CuGWM_for_combine_occipital', 'P']]


OPERATION_40 string : CC_Homotopic_for_filter_LGWM.filter{it[1]=='LGWM'}.set{CC_LGWM_for_combine_occipital}
OPERATION_40 origin : [['CC_Homotopic_for_filter_LGWM', 'P']]
OPERATION_40 gives  : [['CC_LGWM_for_combine_occipital', 'P']]


OPERATION_41 string : CC_SOGWM_for_combine_occipital.concat(CC_MOGWM_for_combine_occipital).concat(CC_IOGWM_for_combine_occipital).concat(CC_CuGWM_for_combine_occipital).concat(CC_LGWM_for_combine_occipital).groupTuple(by:0).set{CC_Homotopic_occipital_for_rename}
OPERATION_41 origin : [['CC_SOGWM_for_combine_occipital', 'P'], ['CC_MOGWM_for_combine_occipital', 'P'], ['CC_IOGWM_for_combine_occipital', 'P'], ['CC_CuGWM_for_combine_occipital', 'P'], ['CC_LGWM_for_combine_occipital', 'P']]
OPERATION_41 gives  : [['CC_Homotopic_occipital_for_rename', 'P']]


OPERATION_42 string : CC_Homotopic_for_filter_STGWM.filter{it[1]=='STGWM'}.set{CC_STGWM_for_combine_temporal}
OPERATION_42 origin : [['CC_Homotopic_for_filter_STGWM', 'P']]
OPERATION_42 gives  : [['CC_STGWM_for_combine_temporal', 'P']]


OPERATION_43 string : CC_Homotopic_for_filter_T_pole_gwm.filter{it[1]=='T_pole_gwm'}.set{CC_T_pole_gwm_for_combine_temporal}
OPERATION_43 origin : [['CC_Homotopic_for_filter_T_pole_gwm', 'P']]
OPERATION_43 gives  : [['CC_T_pole_gwm_for_combine_temporal', 'P']]


OPERATION_44 string : CC_Homotopic_for_filter_MTGWM.filter{it[1]=='MTGWM'}.set{CC_MTGWM_for_combine_temporal}
OPERATION_44 origin : [['CC_Homotopic_for_filter_MTGWM', 'P']]
OPERATION_44 gives  : [['CC_MTGWM_for_combine_temporal', 'P']]


OPERATION_45 string : CC_Homotopic_for_filter_ITGWM.filter{it[1]=='ITGWM'}.set{CC_ITGWM_for_combine_temporal}
OPERATION_45 origin : [['CC_Homotopic_for_filter_ITGWM', 'P']]
OPERATION_45 gives  : [['CC_ITGWM_for_combine_temporal', 'P']]


OPERATION_46 string : CC_Homotopic_for_filter_PHG.filter{it[1]=='PHG'}.set{CC_PHG_for_combine_temporal}
OPERATION_46 origin : [['CC_Homotopic_for_filter_PHG', 'P']]
OPERATION_46 gives  : [['CC_PHG_for_combine_temporal', 'P']]


OPERATION_47 string : CC_Homotopic_for_filter_Hippo.filter{it[1]=='Hippo'}.set{CC_Hippo_for_combine_temporal}
OPERATION_47 origin : [['CC_Homotopic_for_filter_Hippo', 'P']]
OPERATION_47 gives  : [['CC_Hippo_for_combine_temporal', 'P']]


OPERATION_48 string : CC_Homotopic_for_filter_FuGWM.filter{it[1]=='FuGWM'}.set{CC_FuGWM_for_combine_temporal}
OPERATION_48 origin : [['CC_Homotopic_for_filter_FuGWM', 'P']]
OPERATION_48 gives  : [['CC_FuGWM_for_combine_temporal', 'P']]


OPERATION_49 string : CC_STGWM_for_combine_temporal.concat(CC_T_pole_gwm_for_combine_temporal).concat(CC_MTGWM_for_combine_temporal).concat(CC_ITGWM_for_combine_temporal).concat(CC_PHG_for_combine_temporal).concat(CC_Hippo_for_combine_temporal).concat(CC_FuGWM_for_combine_temporal).groupTuple(by:0).set{CC_Homotopic_temporal_for_rename}
OPERATION_49 origin : [['CC_STGWM_for_combine_temporal', 'P'], ['CC_T_pole_gwm_for_combine_temporal', 'P'], ['CC_MTGWM_for_combine_temporal', 'P'], ['CC_ITGWM_for_combine_temporal', 'P'], ['CC_PHG_for_combine_temporal', 'P'], ['CC_Hippo_for_combine_temporal', 'P'], ['CC_FuGWM_for_combine_temporal', 'P']]
OPERATION_49 gives  : [['CC_Homotopic_temporal_for_rename', 'P']]


OPERATION_50 string : CC_Homotopic_for_filter_SPGWM.filter{it[1]=='SPGWM'}.set{CC_SPGWM_for_combine_parietal}
OPERATION_50 origin : [['CC_Homotopic_for_filter_SPGWM', 'P']]
OPERATION_50 gives  : [['CC_SPGWM_for_combine_parietal', 'P']]


OPERATION_51 string : CC_Homotopic_for_filter_SMGWM.filter{it[1]=='SMGWM'}.set{CC_SMGWM_for_combine_parietal}
OPERATION_51 origin : [['CC_Homotopic_for_filter_SMGWM', 'P']]
OPERATION_51 gives  : [['CC_SMGWM_for_combine_parietal', 'P']]


OPERATION_52 string : CC_Homotopic_for_filter_PrCuGWM.filter{it[1]=='PrCuGWM'}.set{CC_PrCuGWM_for_combine_parietal}
OPERATION_52 origin : [['CC_Homotopic_for_filter_PrCuGWM', 'P']]
OPERATION_52 gives  : [['CC_PrCuGWM_for_combine_parietal', 'P']]


OPERATION_53 string : CC_Homotopic_for_filter_PoCGWM.filter{it[1]=='PoCGWM'}.set{CC_PoCGWM_for_combine_parietal}
OPERATION_53 origin : [['CC_Homotopic_for_filter_PoCGWM', 'P']]
OPERATION_53 gives  : [['CC_PoCGWM_for_combine_parietal', 'P']]


OPERATION_54 string : CC_Homotopic_for_filter_AGWM.filter{it[1]=='AGWM'}.set{CC_AGWM_for_combine_parietal}
OPERATION_54 origin : [['CC_Homotopic_for_filter_AGWM', 'P']]
OPERATION_54 gives  : [['CC_AGWM_for_combine_parietal', 'P']]


OPERATION_55 string : CC_SPGWM_for_combine_parietal.concat(CC_SMGWM_for_combine_parietal).concat(CC_PrCuGWM_for_combine_parietal).concat(CC_PoCGWM_for_combine_parietal).concat(CC_AGWM_for_combine_parietal).groupTuple(by:0).set{CC_Homotopic_parietal_for_rename}
OPERATION_55 origin : [['CC_SPGWM_for_combine_parietal', 'P'], ['CC_SMGWM_for_combine_parietal', 'P'], ['CC_PrCuGWM_for_combine_parietal', 'P'], ['CC_PoCGWM_for_combine_parietal', 'P'], ['CC_AGWM_for_combine_parietal', 'P']]
OPERATION_55 gives  : [['CC_Homotopic_parietal_for_rename', 'P']]


OPERATION_56 string : CC_Homotopic_for_filter_CingGWM.filter{it[1]=='CingGWM'}.set{CC_Homotopic_cingulum_for_rename}
OPERATION_56 origin : [['CC_Homotopic_for_filter_CingGWM', 'P']]
OPERATION_56 gives  : [['CC_Homotopic_cingulum_for_rename', 'P']]


OPERATION_57 string : CC_Homotopic_for_filter_Ins.filter{it[1]=='Ins'}.set{CC_Homotopic_insular_for_rename}
OPERATION_57 origin : [['CC_Homotopic_for_filter_Ins', 'P']]
OPERATION_57 gives  : [['CC_Homotopic_insular_for_rename', 'P']]


OPERATION_58 string : CC_Homotopic_for_merge.groupTuple().map{it}.set{CC_Homotopic_list_for_merge}
OPERATION_58 origin : [['CC_Homotopic_for_merge', 'P']]
OPERATION_58 gives  : [['CC_Homotopic_list_for_merge', 'P']]


OPERATION_59 string : asso_all_intra_inter_ventral_f_t_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_all_intra_inter_ventral_f_t_list_for_merge}
OPERATION_59 origin : [['asso_all_intra_inter_ventral_f_t_for_merge', 'P']]
OPERATION_59 gives  : [['asso_all_intra_inter_ventral_f_t_list_for_merge', 'P']]


OPERATION_60 string : asso_all_intra_inter_ventral_all_f_t_for_merge.groupTuple(by:[0,1]).join(asso_all_intra_inter_ventral_all_f_o_f_p_for_merge.groupTuple(by:[0,1]), by:[0,1]).map{it.flatten().toList()}.set{asso_all_intra_inter_ventral_all_for_merge}
OPERATION_60 origin : [['asso_all_intra_inter_ventral_all_f_t_for_merge', 'P']]
OPERATION_60 gives  : [['asso_all_intra_inter_ventral_all_for_merge', 'P']]


OPERATION_61 string : asso_all_intra_inter_dorsal_f_p_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_all_intra_inter_dorsal_f_p_list_for_merge}
OPERATION_61 origin : [['asso_all_intra_inter_dorsal_f_p_for_merge', 'P']]
OPERATION_61 gives  : [['asso_all_intra_inter_dorsal_f_p_list_for_merge', 'P']]


OPERATION_62 string : asso_all_intra_inter_dorsal_all_f_T_for_filter.filter{it[2]=='T_dorsal_f'}.set{asso_all_intra_inter_dorsal_all_f_T_for_rename}
OPERATION_62 origin : [['asso_all_intra_inter_dorsal_all_f_T_for_filter', 'P']]
OPERATION_62 gives  : [['asso_all_intra_inter_dorsal_all_f_T_for_rename', 'P']]


OPERATION_63 string : asso_all_intra_inter_dorsal_all_f_O_for_filter.filter{it[2]=='O_dorsal_f'}.set{asso_all_intra_inter_dorsal_all_f_O_for_rename}
OPERATION_63 origin : [['asso_all_intra_inter_dorsal_all_f_O_for_filter', 'P']]
OPERATION_63 gives  : [['asso_all_intra_inter_dorsal_all_f_O_for_rename', 'P']]


OPERATION_64 string : asso_all_intra_inter_dorsal_all_f_p_for_merge.groupTuple(by:[0,1]).join(asso_all_intra_inter_dorsal_all_f_o_f_t_for_merge.groupTuple(by:[0,1]), by:[0,1]).map{it.flatten().toList()}.set{asso_all_intra_inter_dorsal_all_for_merge}
OPERATION_64 origin : [['asso_all_intra_inter_dorsal_all_f_p_for_merge', 'P']]
OPERATION_64 gives  : [['asso_all_intra_inter_dorsal_all_for_merge', 'P']]


OPERATION_65 string : asso_intra_inter_p_o_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_intra_inter_p_o_list_for_merge}
OPERATION_65 origin : [['asso_intra_inter_p_o_for_merge', 'P']]
OPERATION_65 gives  : [['asso_intra_inter_p_o_list_for_merge', 'P']]


OPERATION_66 string : asso_intra_inter_p_t_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_intra_inter_p_t_list_for_merge}
OPERATION_66 origin : [['asso_intra_inter_p_t_for_merge', 'P']]
OPERATION_66 gives  : [['asso_intra_inter_p_t_list_for_merge', 'P']]


OPERATION_67 string : asso_intra_inter_o_t_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_intra_inter_o_t_list_for_merge}
OPERATION_67 origin : [['asso_intra_inter_o_t_for_merge', 'P']]
OPERATION_67 gives  : [['asso_intra_inter_o_t_list_for_merge', 'P']]


OPERATION_68 string : asso_intra_inter_ins_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_intra_inter_ins_list_for_merge}
OPERATION_68 origin : [['asso_intra_inter_ins_for_merge', 'P']]
OPERATION_68 gives  : [['asso_intra_inter_ins_list_for_merge', 'P']]


OPERATION_69 string : asso_frontal_be_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_frontal_be_list_for_merge}PROCESS DEF merge_asso_be_frontal_gyrus
OPERATION_69 origin : [['asso_frontal_be_for_merge', 'P']]
OPERATION_69 gives  : [['asso_frontal_be_list_for_merge', 'P']]


OPERATION_70 string : asso_all_intra_inter_for_ee_frontal_filtering.combine(asso_frontal_ee_list).set{asso_frontal_ee_for_extract}PROCESS DEF asso_ee_frontal_gyrus
OPERATION_70 origin : [['asso_all_intra_inter_for_ee_frontal_filtering', 'P'], ['asso_frontal_ee_list', 'P']]
OPERATION_70 gives  : [['asso_frontal_ee_for_extract', 'P']]


OPERATION_71 string : asso_frontal_ee_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_frontal_ee_list_for_merge}PROCESS DEF merge_asso_ee_frontal_gyrus
OPERATION_71 origin : [['asso_frontal_ee_for_merge', 'P']]
OPERATION_71 gives  : [['asso_frontal_ee_list_for_merge', 'P']]


OPERATION_72 string : asso_occipital_be_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_occipital_be_list_for_merge}PROCESS DEF merge_asso_be_occipital_gyrus
OPERATION_72 origin : [['asso_occipital_be_for_merge', 'P']]
OPERATION_72 gives  : [['asso_occipital_be_list_for_merge', 'P']]


OPERATION_73 string : asso_all_intra_inter_for_ee_occipital_filtering.combine(asso_occipital_ee_list).set{asso_occipital_ee_for_extract}PROCESS DEF asso_ee_occipital_gyrus
OPERATION_73 origin : [['asso_all_intra_inter_for_ee_occipital_filtering', 'P'], ['asso_occipital_ee_list', 'P']]
OPERATION_73 gives  : [['asso_occipital_ee_for_extract', 'P']]


OPERATION_74 string : asso_occipital_ee_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_occipital_ee_list_for_merge}PROCESS DEF merge_asso_ee_occipital_gyrus
OPERATION_74 origin : [['asso_occipital_ee_for_merge', 'P']]
OPERATION_74 gives  : [['asso_occipital_ee_list_for_merge', 'P']]


OPERATION_75 string : asso_parietal_be_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_parietal_be_list_for_merge}PROCESS DEF merge_asso_be_parietal_gyrus
OPERATION_75 origin : [['asso_parietal_be_for_merge', 'P']]
OPERATION_75 gives  : [['asso_parietal_be_list_for_merge', 'P']]


OPERATION_76 string : asso_all_intra_inter_for_ee_parietal_filtering.combine(asso_parietal_ee_list).set{asso_parietal_ee_for_extract}PROCESS DEF asso_ee_parietal_gyrus
OPERATION_76 origin : [['asso_all_intra_inter_for_ee_parietal_filtering', 'P'], ['asso_parietal_ee_list', 'P']]
OPERATION_76 gives  : [['asso_parietal_ee_for_extract', 'P']]


OPERATION_77 string : asso_parietal_ee_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_parietal_ee_list_for_merge}PROCESS DEF merge_asso_ee_parietal_gyrus
OPERATION_77 origin : [['asso_parietal_ee_for_merge', 'P']]
OPERATION_77 gives  : [['asso_parietal_ee_list_for_merge', 'P']]


OPERATION_78 string : asso_temporal_be_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_temporal_be_list_for_merge}PROCESS DEF merge_asso_be_temporal_gyrus
OPERATION_78 origin : [['asso_temporal_be_for_merge', 'P']]
OPERATION_78 gives  : [['asso_temporal_be_list_for_merge', 'P']]


OPERATION_79 string : asso_all_intra_inter_for_ee_temporal_filtering.combine(asso_temporal_ee_list).set{asso_temporal_ee_for_extract}PROCESS DEF asso_ee_temporal_gyrus
OPERATION_79 origin : [['asso_all_intra_inter_for_ee_temporal_filtering', 'P'], ['asso_temporal_ee_list', 'P']]
OPERATION_79 gives  : [['asso_temporal_ee_for_extract', 'P']]


OPERATION_80 string : asso_temporal_ee_for_merge.groupTuple(by:[0,1]).map{it}.set{asso_temporal_ee_list_for_merge}PROCESS DEF merge_asso_ee_temporal_gyrus
OPERATION_80 origin : [['asso_temporal_ee_for_merge', 'P']]
OPERATION_80 gives  : [['asso_temporal_ee_list_for_merge', 'P']]


OPERATION_81 string : fornix_for_trk_plausible.concat(cerebellum_for_trk_plausible,brainstem_for_trk_plausible,BG_ipsi_Thal_for_trk_plausible,BG_ipsi_Put_for_trk_plausible,BG_ipsi_Caud_for_trk_plausible,asso_u_shape_for_trk_plausible,CC_homo_for_trk_plausible,asso_all_dorsal_for_trk_plausible,asso_all_ventral_for_trk_plausible,all_P_O_for_trk_plausible,all_P_T_for_trk_plausible,all_O_T_for_trk_plausible,Ins_for_trk_plausible,Cing_for_trk_plausible,asso_all_intraF_be_for_trk_plausible,asso_all_intraF_ee_for_trk_plausible,asso_all_intraP_be_for_trk_plausible,asso_all_intraP_ee_for_trk_plausible,asso_all_intraO_be_for_trk_plausible,asso_all_intraO_ee_for_trk_plausible,asso_all_intraT_be_for_trk_plausible,asso_all_intraT_ee_for_trk_plausible).groupTuple(by: 0).set{merge_trk_plausible}
OPERATION_81 origin : [['fornix_for_trk_plausible', 'P'], ['cerebellum_for_trk_plausible', 'P'], ['brainstem_for_trk_plausible', 'P'], ['BG_ipsi_Thal_for_trk_plausible', 'P'], ['BG_ipsi_Put_for_trk_plausible', 'P'], ['BG_ipsi_Caud_for_trk_plausible', 'P'], ['asso_u_shape_for_trk_plausible', 'P'], ['CC_homo_for_trk_plausible', 'P'], ['asso_all_dorsal_for_trk_plausible', 'P'], ['asso_all_ventral_for_trk_plausible', 'P'], ['all_P_O_for_trk_plausible', 'P'], ['all_P_T_for_trk_plausible', 'P'], ['all_O_T_for_trk_plausible', 'P'], ['Ins_for_trk_plausible', 'P'], ['Cing_for_trk_plausible', 'P'], ['asso_all_intraF_be_for_trk_plausible', 'P'], ['asso_all_intraF_ee_for_trk_plausible', 'P'], ['asso_all_intraP_be_for_trk_plausible', 'P'], ['asso_all_intraP_ee_for_trk_plausible', 'P'], ['asso_all_intraO_be_for_trk_plausible', 'P'], ['asso_all_intraO_ee_for_trk_plausible', 'P'], ['asso_all_intraT_be_for_trk_plausible', 'P'], ['asso_all_intraT_ee_for_trk_plausible', 'P']]
OPERATION_81 gives  : [['merge_trk_plausible', 'P']]


OPERATION_82 string : trk_for_extract_unplausible.join(plausible_for_extract_unplausible).set{for_trk_unplausible}
OPERATION_82 origin : [['trk_for_extract_unplausible', 'P'], ['plausible_for_extract_unplausible', 'P']]
OPERATION_82 gives  : [['for_trk_unplausible', 'P']]


OPERATION_83 string : BG_ipsi_Caud_for_rename.concat(BG_ipsi_Put_for_rename).groupTuple(by:[0,1]).set{cortico_striate_for_rename}PROCESS DEF rename_cortico_striate
OPERATION_83 origin : [['BG_ipsi_Caud_for_rename', 'P'], ['BG_ipsi_Put_for_rename', 'P']]
OPERATION_83 gives  : [['cortico_striate_for_rename', 'P']]


OPERATION_84 string : asso_all_intra_inter_dorsal_all_f_O_for_rename.concat(asso_all_intra_inter_dorsal_f_p_for_rename).groupTuple(by:[0,1]).set{slf_for_rename}PROCESS DEF rename_slf
OPERATION_84 origin : [['asso_all_intra_inter_dorsal_all_f_O_for_rename', 'P'], ['asso_all_intra_inter_dorsal_f_p_for_rename', 'P']]
OPERATION_84 gives  : [['slf_for_rename', 'P']]


