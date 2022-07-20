OPERATION_1 string : Channel
    .fromPath("$input/**/Segment_*/*mask_wm.nii.gz", maxDepth:3)
    .collect(sort:true)
    .into{wm_for_resampled_dwi;wm_for_dti;wm_for_fodf;wm_for_registration}
OPERATION_1 origin : [['"$input/**/Segment_*/*mask_wm.nii.gz", maxDepth:3', 'A']]
OPERATION_1 gives  : [['wm_for_resampled_dwi', 'P'], ['wm_for_dti', 'P'], ['wm_for_fodf', 'P'], ['wm_for_registration', 'P']]


OPERATION_2 string : Channel
    .fromPath("$input/**/Segment_*/*mask_gm.nii.gz", maxDepth:3)
    .collect(sort:true)
    .into{gm_for_resampled_dwi;gm_for_dti;gm_for_fodf;gm_for_registration}
OPERATION_2 origin : [['"$input/**/Segment_*/*mask_gm.nii.gz", maxDepth:3', 'A']]
OPERATION_2 gives  : [['gm_for_resampled_dwi', 'P'], ['gm_for_dti', 'P'], ['gm_for_fodf', 'P'], ['gm_for_registration', 'P']]


OPERATION_3 string : Channel
    .fromPath("$input/**/Segment_*/*mask_csf.nii.gz", maxDepth:3)
    .collect(sort:true)
    .into{csf_for_resampled_dwi;csf_for_dti;csf_for_fodf;csf_for_registration}
OPERATION_3 origin : [['"$input/**/Segment_*/*mask_csf.nii.gz", maxDepth:3', 'A']]
OPERATION_3 gives  : [['csf_for_resampled_dwi', 'P'], ['csf_for_dti', 'P'], ['csf_for_fodf', 'P'], ['csf_for_registration', 'P']]


OPERATION_4 string : Channel
    .fromPath("$input/**/Bet_DWI/*b0_bet_mask.nii.gz", maxDepth:3)
    .collect(sort:true)
    .map{[it]}
    .set{b0_bet_mask_for_bet}
OPERATION_4 origin : [['"$input/**/Bet_DWI/*b0_bet_mask.nii.gz", maxDepth:3', 'A']]
OPERATION_4 gives  : [['b0_bet_mask_for_bet', 'P']]


OPERATION_5 string : Channel
    .fromPath(["$input/**/Eddy/*dwi_corrected.nii.gz", "$input/**/Eddy_Topup/*dwi_corrected.nii.gz"], maxDepth:3)
    .collect(sort:true)
    .map{[it]}
    .set{dwi_eddy_for_bet}
OPERATION_5 origin : [['["$input/**/Eddy/*dwi_corrected.nii.gz", "$input/**/Eddy_Topup/*dwi_corrected.nii.gz"], maxDepth:3', 'A']]
OPERATION_5 gives  : [['dwi_eddy_for_bet', 'P']]


OPERATION_6 string : Channel
    .fromPath("$input/**/Bet_T1/*t1_bet_mask.nii.gz", maxDepth:3)
    .collect(sort:true)
    .map{[it]}
    .set{t1_bet_mask_for_bet}
OPERATION_6 origin : [['"$input/**/Bet_T1/*t1_bet_mask.nii.gz", maxDepth:3', 'A']]
OPERATION_6 gives  : [['t1_bet_mask_for_bet', 'P']]


OPERATION_7 string : Channel
    .fromPath("$input/**/Resample_T1/*t1_resampled.nii.gz",
      maxDepth:3)
    .collect(sort:true)
    .map{[it]}
    .set{t1_for_bet}
OPERATION_7 origin : []
OPERATION_7 gives  : [['t1_for_bet', 'P']]


OPERATION_8 string : Channel
    .fromPath("$input/**/Denoise_DWI/*dwi_denoised.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{dwi_denoised}
OPERATION_8 origin : [['"$input/**/Denoise_DWI/*dwi_denoised.nii.gz", maxDepth:3', 'A']]
OPERATION_8 gives  : [['dwi_denoised', 'P']]


OPERATION_9 string : Channel
    .fromPath("$input/**/Denoise_T1/*t1_denoised.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{t1_denoised}
OPERATION_9 origin : [['"$input/**/Denoise_T1/*t1_denoised.nii.gz", maxDepth:3', 'A']]
OPERATION_9 gives  : [['t1_denoised', 'P']]


OPERATION_10 string : Channel
    .fromPath(["$input/**/Bet_Prelim_DWI/*b0_bet.nii.gz"],
      maxDepth:3)
    .collect(sort:true)
    .into{b0_for_eddy_topup;for_counter_b0}
OPERATION_10 origin : []
OPERATION_10 gives  : [['b0_for_eddy_topup', 'P'], ['for_counter_b0', 'P']]


OPERATION_11 string : Channel
    .fromPath("$input/**/Bet_DWI/*b0_bet_mask.nii.gz",
      maxDepth:3)
    .collect(sort:true)
    .set{b0_mask_for_eddy_topup}
OPERATION_11 origin : []
OPERATION_11 gives  : [['b0_mask_for_eddy_topup', 'P']]


OPERATION_12 string : Channel
    .fromPath(["$input/**/Extract_B0/*b0.nii.gz","$input/**/Bet_DWI/*b0_no_bet.nii.gz"], maxDepth:3)
    .collect(sort:true)
    .into{b0_corrected;for_counter_b0_corrected}
OPERATION_12 origin : [['["$input/**/Extract_B0/*b0.nii.gz","$input/**/Bet_DWI/*b0_no_bet.nii.gz"], maxDepth:3', 'A']]
OPERATION_12 gives  : [['b0_corrected', 'P'], ['for_counter_b0_corrected', 'P']]


OPERATION_13 string : Channel
    .fromPath("$input/**/*_B0/*b0_resampled.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{b0_resampled}
OPERATION_13 origin : [['"$input/**/*_B0/*b0_resampled.nii.gz", maxDepth:3', 'A']]
OPERATION_13 gives  : [['b0_resampled', 'P']]


OPERATION_14 string : Channel
    .fromPath("$input/**/Resample_T1/*t1_resampled.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{t1_resampled}
OPERATION_14 origin : [['"$input/**/Resample_T1/*t1_resampled.nii.gz", maxDepth:3', 'A']]
OPERATION_14 gives  : [['t1_resampled', 'P']]


OPERATION_15 string : dti_metrics = Channel
    .fromFilePairs("$input/**/DTI_Metrics/*{fa.nii.gz,md.nii.gz,rd.nii.gz,ad.nii.gz,residual.nii.gz,evecs_v1.nii.gz}",
                    size: 6,
                    maxDepth:3,
                    flat:true)
OPERATION_15 origin : []
OPERATION_15 gives  : [['dti_metrics', 'P']]


OPERATION_16 string : Channel
    .fromPath("$input/**/Compute_FRF/*frf.txt", maxDepth:3)
    .collect(sort:true)
    .set{compute_frf}
OPERATION_16 origin : [['"$input/**/Compute_FRF/*frf.txt", maxDepth:3', 'A']]
OPERATION_16 gives  : [['compute_frf', 'P']]


OPERATION_17 string : fodf_metrics = Channel
    .fromFilePairs("$input/**/FODF_Metrics/*{afd_max.nii.gz,afd_sum.nii.gz,afd_total.nii.gz,nufo.nii.gz}",
                    size: 4,
                    maxDepth:3,
                    flat:true)
OPERATION_17 origin : []
OPERATION_17 gives  : [['fodf_metrics', 'P']]


OPERATION_18 string : Channel
    .fromPath("$input/**/*_Tracking/*.trk", maxDepth:3)
    .map{["report", it.parent.parent.name, it]}
    .set{tractograms}
OPERATION_18 origin : [['"$input/**/*_Tracking/*.trk", maxDepth:3', 'A']]
OPERATION_18 gives  : [['tractograms', 'P']]


OPERATION_19 string : Channel
    .fromPath("$input/**/Register_T1/*t1_warped.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{t1_warped_for_registration}
OPERATION_19 origin : [['"$input/**/Register_T1/*t1_warped.nii.gz", maxDepth:3', 'A']]
OPERATION_19 gives  : [['t1_warped_for_registration', 'P']]


OPERATION_20 string : Channel
    .fromPath("$input/**/Register_T1/*t1_warped.nii.gz", maxDepth:3)
    .map{["report", it.parent.parent.name, it]}
    .set{t1_warped_for_tracking}
OPERATION_20 origin : [['"$input/**/Register_T1/*t1_warped.nii.gz", maxDepth:3', 'A']]
OPERATION_20 gives  : [['t1_warped_for_tracking', 'P']]


OPERATION_21 string : Channel
    .fromPath("$input/**/Segment_Tissues/*map_wm.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{wm_maps}
OPERATION_21 origin : [['"$input/**/Segment_Tissues/*map_wm.nii.gz", maxDepth:3', 'A']]
OPERATION_21 gives  : [['wm_maps', 'P']]


OPERATION_22 string : Channel
    .fromPath("$input/**/Segment_Freesurfer/*mask_wm.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{wm_masks}
OPERATION_22 origin : [['"$input/**/Segment_Freesurfer/*mask_wm.nii.gz", maxDepth:3', 'A']]
OPERATION_22 gives  : [['wm_masks', 'P']]


OPERATION_23 string : Channel
    .fromPath("$input/**/Segment_Tissues/*map_gm.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{gm_maps}
OPERATION_23 origin : [['"$input/**/Segment_Tissues/*map_gm.nii.gz", maxDepth:3', 'A']]
OPERATION_23 gives  : [['gm_maps', 'P']]


OPERATION_24 string : Channel
    .fromPath("$input/**/Segment_Freesurfer/*mask_gm.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{gm_masks}
OPERATION_24 origin : [['"$input/**/Segment_Freesurfer/*mask_gm.nii.gz", maxDepth:3', 'A']]
OPERATION_24 gives  : [['gm_masks', 'P']]


OPERATION_25 string : Channel
    .fromPath("$input/**/Segment_Tissues/*map_csf.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{csf_maps}
OPERATION_25 origin : [['"$input/**/Segment_Tissues/*map_csf.nii.gz", maxDepth:3', 'A']]
OPERATION_25 gives  : [['csf_maps', 'P']]


OPERATION_26 string : Channel
    .fromPath("$input/**/Segment_Freesurfer/*mask_csf.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{csf_masks}
OPERATION_26 origin : [['"$input/**/Segment_Freesurfer/*mask_csf.nii.gz", maxDepth:3', 'A']]
OPERATION_26 gives  : [['csf_masks', 'P']]


OPERATION_27 string : Channel
    .fromPath("$input/**/PFT_Seeding_Mask/*seeding_mask.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{seeding}
OPERATION_27 origin : [['"$input/**/PFT_Seeding_Mask/*seeding_mask.nii.gz", maxDepth:3', 'A']]
OPERATION_27 gives  : [['seeding', 'P']]


OPERATION_28 string : Channel
    .fromPath("$input/**/PFT_Tracking_Maps/*map_include.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{include}
OPERATION_28 origin : [['"$input/**/PFT_Tracking_Maps/*map_include.nii.gz", maxDepth:3', 'A']]
OPERATION_28 gives  : [['include', 'P']]


OPERATION_29 string : Channel
    .fromPath("$input/**/PFT_Tracking_Maps/*map_exclude.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{exclude}
OPERATION_29 origin : [['"$input/**/PFT_Tracking_Maps/*map_exclude.nii.gz", maxDepth:3', 'A']]
OPERATION_29 gives  : [['exclude', 'P']]


OPERATION_30 string : Channel
    .fromPath("$input/**/Local_Tracking_Mask/*tracking_mask.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{mask}
OPERATION_30 origin : [['"$input/**/Local_Tracking_Mask/*tracking_mask.nii.gz", maxDepth:3', 'A']]
OPERATION_30 gives  : [['mask', 'P']]


OPERATION_31 string : Channel
    .fromPath("$input/**/Local_Seeding_Mask/*seeding_mask.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{seeding}
OPERATION_31 origin : [['"$input/**/Local_Seeding_Mask/*seeding_mask.nii.gz", maxDepth:3', 'A']]
OPERATION_31 gives  : [['seeding', 'P']]


OPERATION_32 string : Channel
    .fromPath("$input/**/DTI_Metrics/*rgb.nii.gz", maxDepth:3)
    .collect(sort:true)
    .set{rgb}
OPERATION_32 origin : [['"$input/**/DTI_Metrics/*rgb.nii.gz", maxDepth:3', 'A']]
OPERATION_32 gives  : [['rgb', 'P']]


OPERATION_33 string : Channel
    .fromPath("$input/**/*bval", maxDepth:1)
    .collect(sort:true)
    .set{all_raw_bval}
OPERATION_33 origin : [['"$input/**/*bval", maxDepth:1', 'A']]
OPERATION_33 gives  : [['all_raw_bval', 'P']]


OPERATION_34 string : Channel
    .fromPath("$input/sub-*/**/*dwi.bval", maxDepth:4)
    .collect(sort:true)
    .set{all_bids_bval}
OPERATION_34 origin : [['"$input/sub-*/**/*dwi.bval", maxDepth:4', 'A']]
OPERATION_34 gives  : [['all_bids_bval', 'P']]


OPERATION_35 string : Channel
  .fromPath("$input/sub-*/**/*dwi.json", maxDepth:4)
  .map{it}
  .toSortedList()
  .set{all_bids_json}
OPERATION_35 origin : [['"$input/sub-*/**/*dwi.json", maxDepth:4', 'A']]
OPERATION_35 gives  : [['all_bids_json', 'P']]


OPERATION_36 string : Channel
  .fromPath("$input/**/*dwi.json", maxDepth:1)
  .map{it}
  .toSortedList()
  .set{all_raw_json}
OPERATION_36 origin : [['"$input/**/*dwi.json", maxDepth:1', 'A']]
OPERATION_36 gives  : [['all_raw_json', 'P']]


OPERATION_37 string : Channel
    .fromPath("$input/**/*bvec", maxDepth:1)
    .collect(sort:true)
    .set{all_raw_bvec}
OPERATION_37 origin : [['"$input/**/*bvec", maxDepth:1', 'A']]
OPERATION_37 gives  : [['all_raw_bvec', 'P']]


OPERATION_38 string : Channel
    .fromPath("$input/sub-*/**/*dwi.bvec", maxDepth:4)
    .collect(sort:true)
    .set{all_bids_bvec}
OPERATION_38 origin : [['"$input/sub-*/**/*dwi.bvec", maxDepth:4', 'A']]
OPERATION_38 gives  : [['all_bids_bvec', 'P']]


OPERATION_39 string : Channel
    .fromPath("$input/**/*t1.nii.gz", maxDepth:2)
    .collect(sort:true)
    .set{all_raw_t1}
OPERATION_39 origin : [['"$input/**/*t1.nii.gz", maxDepth:2', 'A']]
OPERATION_39 gives  : [['all_raw_t1', 'P']]


OPERATION_40 string : Channel
    .fromPath("$input/sub-*/**/*T1w.nii.gz", maxDepth:4)
    .collect(sort:true)
    .set{all_bids_t1}
OPERATION_40 origin : [['"$input/sub-*/**/*T1w.nii.gz", maxDepth:4', 'A']]
OPERATION_40 gives  : [['all_bids_t1', 'P']]


OPERATION_41 string : Channel
    .fromPath("$input/**/*dwi.nii.gz", maxDepth:1)
    .collect(sort:true)
    .set{all_raw_dwi}
OPERATION_41 origin : [['"$input/**/*dwi.nii.gz", maxDepth:1', 'A']]
OPERATION_41 gives  : [['all_raw_dwi', 'P']]


OPERATION_42 string : Channel
    .fromPath("$input/sub-*/**/*dwi.nii.gz", maxDepth:4)
    .collect(sort:true)
    .set{all_bids_dwi}
OPERATION_42 origin : [['"$input/sub-*/**/*dwi.nii.gz", maxDepth:4', 'A']]
OPERATION_42 gives  : [['all_bids_dwi', 'P']]


OPERATION_43 string : anat_rbx = Channel
    .fromFilePairs("$params.input/**/Register_Anat/*native_anat.nii.gz",
              maxDepth: 2,
              size: 1,
              flat: true) { it.parent.parent.name }
OPERATION_43 origin : []
OPERATION_43 gives  : [['anat_rbx', 'P']]


OPERATION_44 string : bundles_rbx = Channel
    .fromFilePairs("$params.input/**/Clean_Bundles/*.trk",
                   maxDepth: 2,
                   size: -1) { it.parent.parent.name }
OPERATION_44 origin : []
OPERATION_44 gives  : [['bundles_rbx', 'P']]


OPERATION_45 string : Channel.fromPath("$input/**/Register_Lesions_T1s/*space.nii.gz", maxDepth:4)
    .collect(sort:true)
    .set{t1_lesions_registered}
OPERATION_45 origin : [['"$input/**/Register_Lesions_T1s/*space.nii.gz", maxDepth:4', 'A']]
OPERATION_45 gives  : [['t1_lesions_registered', 'P']]


OPERATION_46 string : Channel
    .fromPath("$input/*_labels.nii.gz")
    .collect()
    .into{labels_for_register_lesions_qc;labels_for_register_tractograms_qc}
OPERATION_46 origin : [['"$input/*_labels.nii.gz"', 'A']]
OPERATION_46 gives  : [['labels_for_register_lesions_qc', 'P'], ['labels_for_register_tractograms_qc', 'P']]


OPERATION_47 string : Channel.fromPath("$input/**/Register_Tractograms_T1s/*space.nii.gz", maxDepth:4)
    .collect(sort:true)
    .set{t1_tractograms_registered}
OPERATION_47 origin : [['"$input/**/Register_Tractograms_T1s/*space.nii.gz", maxDepth:4', 'A']]
OPERATION_47 gives  : [['t1_tractograms_registered', 'P']]


OPERATION_48 string : Channel.fromPath("$input/**/**/Compute_Connectivity/Connectivity_w_lesion/*lesion_sc.npy",
    maxDepth:6)
    .map{[it.parent.parent.parent.parent.name, it.parent.parent.parent.name, it]}
    .set{matrice_lesion_for_combine}
OPERATION_48 origin : []
OPERATION_48 gives  : [['matrice_lesion_for_combine', 'P']]


OPERATION_49 string : Channel.fromPath("$input/**/**/Compute_Connectivity/*atlas_sc.npy",
    maxDepth:5)
    .map{[it.parent.parent.parent.name, it.parent.parent.name, it]}
    .set{matrice_atlas_for_combine}
OPERATION_49 origin : []
OPERATION_49 gives  : [['matrice_atlas_for_combine', 'P']]


OPERATION_50 string : Channel.fromPath("$input/*labels.txt")
    .set{labels}
OPERATION_50 origin : [['"$input/*labels.txt"', 'A']]
OPERATION_50 gives  : [['labels', 'P']]


OPERATION_51 string : Channel.fromPath("$input/**/**/Compute_Connectivity/Connectivity_w_lesion/*lesion_sc_matrix.png", maxDepth:6)
    .collect(sort: true)
    .map{[it.parent.parent.parent.parent.name, it]}
    .map{sid, png -> [sid.unique().join(",").replaceAll(",", " "), png].toList()}
    .set{lesion_png}
OPERATION_51 origin : [['"$input/**/**/Compute_Connectivity/Connectivity_w_lesion/*lesion_sc_matrix.png", maxDepth:6', 'A']]
OPERATION_51 gives  : [['lesion_png', 'P']]


OPERATION_52 string : dwi_eddy_for_bet.combine(b0_bet_mask_for_bet).set{dwi_mask_for_bet}
OPERATION_52 origin : [['dwi_eddy_for_bet', 'P'], ['b0_bet_mask_for_bet', 'P']]
OPERATION_52 gives  : [['dwi_mask_for_bet', 'P']]


OPERATION_53 string : t1_for_bet.combine(t1_bet_mask_for_bet).set{t1_mask_for_bet}
OPERATION_53 origin : [['t1_for_bet', 'P'], ['t1_bet_mask_for_bet', 'P']]
OPERATION_53 gives  : [['t1_mask_for_bet', 'P']]


OPERATION_54 string : for_counter_b0
    .flatten()
    .count()
    .set{counter_b0}
OPERATION_54 origin : [['for_counter_b0', 'P']]
OPERATION_54 gives  : [['counter_b0', 'P']]


OPERATION_55 string : for_counter_b0_corrected
    .flatten()
    .count()
    .set{counter_b0_eddy}
OPERATION_55 origin : [['for_counter_b0_corrected', 'P']]
OPERATION_55 gives  : [['counter_b0_eddy', 'P']]


OPERATION_56 string : fa, md, rd, ad, residual, evecs = dti_metrics
    .map{sid, ad, evecs, fa, md, rd, residual -> [tuple(fa),
                              tuple(md),
                              tuple(rd),
                              tuple(ad),
                              tuple(residual),
                              tuple(evecs)]}
    .separate(6)
OPERATION_56 origin : [['dti_metrics', 'P']]
OPERATION_56 gives  : [['fa', 'P'], ['md', 'P'], ['rd', 'P'], ['ad', 'P'], ['residual', 'P'], ['evecs', 'P']]


OPERATION_57 string : fa
    .flatten()
    .collect(sort:true)
    .set{fa_for_dti_qa}
OPERATION_57 origin : [['fa', 'P']]
OPERATION_57 gives  : [['fa_for_dti_qa', 'P']]


OPERATION_58 string : md
    .flatten()
    .collect(sort:true)
    .set{md_for_dti_qa}
OPERATION_58 origin : [['md', 'P']]
OPERATION_58 gives  : [['md_for_dti_qa', 'P']]


OPERATION_59 string : rd
    .flatten()
    .collect(sort:true)
    .set{rd_for_dti_qa}
OPERATION_59 origin : [['rd', 'P']]
OPERATION_59 gives  : [['rd_for_dti_qa', 'P']]


OPERATION_60 string : ad
    .flatten()
    .collect(sort:true)
    .set{ad_for_dti_qa}
OPERATION_60 origin : [['ad', 'P']]
OPERATION_60 gives  : [['ad_for_dti_qa', 'P']]


OPERATION_61 string : residual
    .flatten()
    .collect(sort:true)
    .set{residual_for_dti_qa}
OPERATION_61 origin : [['residual', 'P']]
OPERATION_61 gives  : [['residual_for_dti_qa', 'P']]


OPERATION_62 string : evecs
    .flatten()
    .collect(sort:true)
    .set{evecs_for_dti_qa}
OPERATION_62 origin : [['evecs', 'P']]
OPERATION_62 gives  : [['evecs_for_dti_qa', 'P']]


OPERATION_63 string : afd_max, afd_sum, afd_total, nufo = fodf_metrics
    .map{sid, afd_max, afd_sum, afd_total, nufo -> [tuple(afd_max),
                              tuple(afd_sum),
                              tuple(afd_total),
                              tuple(nufo)]}
    .separate(4)
OPERATION_63 origin : [['fodf_metrics', 'P']]
OPERATION_63 gives  : [['afd_max', 'P'], ['afd_sum', 'P'], ['afd_total', 'P'], ['nufo', 'P']]


OPERATION_64 string : afd_max
    .flatten()
    .collect(sort:true)
    .set{afd_max_for_fodf_qa}
OPERATION_64 origin : [['afd_max', 'P']]
OPERATION_64 gives  : [['afd_max_for_fodf_qa', 'P']]


OPERATION_65 string : afd_sum
    .flatten()
    .collect(sort:true)
    .set{afd_sum_for_fodf_qa}
OPERATION_65 origin : [['afd_sum', 'P']]
OPERATION_65 gives  : [['afd_sum_for_fodf_qa', 'P']]


OPERATION_66 string : afd_total
    .flatten()
    .collect(sort:true)
    .set{afd_total_for_fodf_qa}
OPERATION_66 origin : [['afd_total', 'P']]
OPERATION_66 gives  : [['afd_total_for_fodf_qa', 'P']]


OPERATION_67 string : nufo
    .flatten()
    .collect(sort:true)
    .set{nufo_for_fodf_qa}
OPERATION_67 origin : [['nufo', 'P']]
OPERATION_67 gives  : [['nufo_for_fodf_qa', 'P']]


OPERATION_68 string : tractograms
    .combine(t1_warped_for_tracking, by:[0,1])
    .groupTuple(sort:true)
    .map{it -> it[2..-1]}
    .set{tracking_t1}
OPERATION_68 origin : [['tractograms', 'P']]
OPERATION_68 gives  : [['tracking_t1', 'P']]


OPERATION_69 string : wm_maps
  .mix(wm_masks)
  .collect(sort:true)
  .set{wm_for_seg}
OPERATION_69 origin : [['wm_maps', 'P'], ['wm_masks', 'P']]
OPERATION_69 gives  : [['wm_for_seg', 'P']]


OPERATION_70 string : gm_maps
  .mix(gm_masks)
  .collect(sort:true)
  .set{gm_for_seg}
OPERATION_70 origin : [['gm_maps', 'P'], ['gm_masks', 'P']]
OPERATION_70 gives  : [['gm_for_seg', 'P']]


OPERATION_71 string : csf_maps
  .mix(csf_masks)
  .collect(sort:true)
  .set{csf_for_seg}
OPERATION_71 origin : [['csf_maps', 'P'], ['csf_masks', 'P']]
OPERATION_71 gives  : [['csf_for_seg', 'P']]


OPERATION_72 string : all_raw_bval
  .mix(all_bids_bval)
  .collect(sort:true)
  .set{all_bval}
OPERATION_72 origin : [['all_raw_bval', 'P'], ['all_bids_bval', 'P']]
OPERATION_72 gives  : [['all_bval', 'P']]


OPERATION_73 string : all_raw_json
  .mix(all_bids_json)
  .collect(sort:true)
  .set{all_json}
OPERATION_73 origin : [['all_raw_json', 'P'], ['all_bids_json', 'P']]
OPERATION_73 gives  : [['all_json', 'P']]


OPERATION_74 string : all_raw_bvec
  .mix(all_bids_bvec)
  .collect(sort:true)
  .set{all_bvec}
OPERATION_74 origin : [['all_raw_bvec', 'P'], ['all_bids_bvec', 'P']]
OPERATION_74 gives  : [['all_bvec', 'P']]


OPERATION_75 string : all_raw_t1
  .mix(all_bids_t1)
  .collect(sort:true)
  .set{all_t1}
OPERATION_75 origin : [['all_raw_t1', 'P'], ['all_bids_t1', 'P']]
OPERATION_75 gives  : [['all_t1', 'P']]


OPERATION_76 string : all_raw_dwi
  .mix(all_bids_dwi)
  .collect(sort:true)
  .set{all_dwi}
OPERATION_76 origin : [['all_raw_dwi', 'P'], ['all_bids_dwi', 'P']]
OPERATION_76 gives  : [['all_dwi', 'P']]


OPERATION_77 string : bundles_rbx
    .flatMap{ sid, bundles -> bundles.collect{ [sid, it] } }
    .map{sid, bundle -> [sid, bundle.getName().replace(sid, "").replace(".trk", "").replace("__", "").replace("_L", "").replace("_R", ""), bundle]}
    .groupTuple(by: [0,1])
    .combine(anat_rbx, by:0)
    .set{bundles_anat_for_screenshots}
OPERATION_77 origin : [['bundles_rbx', 'P']]
OPERATION_77 gives  : [['bundles_anat_for_screenshots', 'P']]


OPERATION_78 string : screenshots_for_report
    .groupTuple(by: 1, sort:true)
    .map{b_names, _, bundles -> [b_names.unique().join(",").replaceAll(",", " "), bundles].toList()}
    .set{screenshots_for_qc_rbx}
OPERATION_78 origin : [['screenshots_for_report', 'P']]
OPERATION_78 gives  : [['screenshots_for_qc_rbx', 'P']]


OPERATION_79 string : matrice_atlas_for_combine.join(matrice_lesion_for_combine, by: [0,1])
    .set{matrice_for_create_csv}
OPERATION_79 origin : [['matrice_atlas_for_combine', 'P']]
OPERATION_79 gives  : [['matrice_for_create_csv', 'P']]


OPERATION_80 string : matrice_for_create_csv.combine(labels)
    .set{matrices_labels_for_create_csv}
OPERATION_80 origin : [['matrice_for_create_csv', 'P'], ['labels', 'P']]
OPERATION_80 gives  : [['matrices_labels_for_create_csv', 'P']]


OPERATION_81 string : stats_to_be_collected
  .collect()
  .set{stats_for_matrix}
OPERATION_81 origin : [['stats_to_be_collected', 'P']]
OPERATION_81 gives  : [['stats_for_matrix', 'P']]


