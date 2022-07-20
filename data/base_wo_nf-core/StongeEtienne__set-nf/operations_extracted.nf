OPERATION_1 string : map_for_rois_seed = Channel
        .fromFilePairs("${tractoflow}/**/DTI_Metrics/*fa.nii.gz",
                       size: 1, maxDepth:3, flat: true) {it.parent.parent.name}
        .ifEmpty { exit 1, "Cannot find ${tractoflow}/**/DTI_Metrics/*fa.nii.gz"}
OPERATION_1 origin : []
OPERATION_1 gives  : [['map_for_rois_seed', 'P']]


OPERATION_2 string : ants_transfo_to_convert = Channel
        .fromFilePairs("${tractoflow}/**/Register_T1/*{output0GenericAffine.mat,output1InverseWarp.nii.gz}",
                       size: 2, maxDepth:3, flat: true) {it.parent.parent.name}
        .ifEmpty { exit 1, "Cannot find ${tractoflow}/**/Register_T1/*{output0GenericAffine.mat,output1InverseWarp.nii.gz}" }
OPERATION_2 origin : []
OPERATION_2 gives  : [['ants_transfo_to_convert', 'P']]


OPERATION_3 string : fodf_and_map_for_pft = Channel
        .fromFilePairs("${tractoflow}/**/{FODF_Metrics/*fodf.nii.gz,PFT_Maps/*map_exclude.nii.gz,PFT_Maps/*map_include.nii.gz}",
                       size: 3, maxDepth:3, flat: true) {it.parent.parent.name}
        .ifEmpty { exit 1, "Cannot find ${tractoflow}/**/{FODF_Metrics/*fodf.nii.gz,PFT_Maps/*map_exclude.nii.gz,PFT_Maps/*map_include.nii.gz}" }
OPERATION_3 origin : []
OPERATION_3 gives  : [['fodf_and_map_for_pft', 'P']]


OPERATION_4 string : ants_transfo_to_convert = Channel
            .fromFilePairs("${antswarp}/**/Register_T1/*{output0GenericAffine.mat,output1InverseWarp.nii.gz}",
                           size: 2, maxDepth:3, flat: true) {it.parent.parent.name}
            .ifEmpty { exit 1, "Cannot find ${antswarp}/**/Register_T1/*{output0GenericAffine.mat,output1InverseWarp.nii.gz}" }
OPERATION_4 origin : []
OPERATION_4 gives  : [['ants_transfo_to_convert', 'P']]


OPERATION_5 string : map_for_rois_seed = Channel
                .fromFilePairs("${rois_seed}/**/*fa.nii.gz",
                               size: 1, maxDepth:3, flat: true) {it.parent.parent.name}
                .ifEmpty { exit 1, "Cannot find ${rois_seed}/**/*fa.nii.gz" }
OPERATION_5 origin : []
OPERATION_5 gives  : [['map_for_rois_seed', 'P']]


OPERATION_6 string : map_for_rois_seed = Channel
                .fromFilePairs("${rois_seed}/**/*fa.nii.gz",
                               size: 1, maxDepth:3, flat: true) {it.parent.parent.name}
                .ifEmpty { exit 1, "Cannot find ${rois_seed}/**/*fa.nii.gz" }
OPERATION_6 origin : []
OPERATION_6 gives  : [['map_for_rois_seed', 'P']]


OPERATION_7 string : fodf_for_pft = Channel
            .fromFilePairs("${fodf}/**/*/*fodf.nii.gz",
                           size: 1, maxDepth:3, flat: true) {it.parent.parent.name}
            .ifEmpty { exit 1, "Cannot find ${fodf}/**/*/*fodf.nii.gz" }
OPERATION_7 origin : []
OPERATION_7 gives  : [['fodf_for_pft', 'P']]


OPERATION_8 string : maps_for_pft = Channel
            .fromFilePairs("${pft_maps}/**/*/*{map_exclude.nii.gz,map_include.nii.gz}",
                           size: 2, maxDepth:3, flat: true) {it.parent.parent.name}
            .ifEmpty { exit 1, "Cannot find ${pft_maps}/**/*/*{map_exclude.nii.gz,map_include.nii.gz}" }
OPERATION_8 origin : []
OPERATION_8 gives  : [['maps_for_pft', 'P']]


OPERATION_9 string : in_surfaces = Channel
                .fromFilePairs("${surfaces}/**/*{lh*aparc.annot,lh*pial.vtk,lh*white.vtk,rh*aparc.annot,rh*pial.vtk,rh*white.vtk,wmparc*}",
                               size: 7, maxDepth:3, flat: true) {it.parent.name}
                .ifEmpty { exit 1, "Cannot find freesurfer data:  ${surfaces}/**/*{lh*aparc.annot,lh*pial.vtk,lh*white.vtk,rh*aparc.annot,rh*pial.vtk,rh*white.vtk,wmparc*}" }
OPERATION_9 origin : []
OPERATION_9 gives  : [['in_surfaces', 'P']]


OPERATION_10 string : in_surfaces = Channel
                .fromFilePairs("${surfaces}/**/*{lh*a2009s.annot,lh*pial.vtk,lh*white.vtk,rh*a2009s.annot,rh*pial.vtk,rh*white.vtk,wmparc*}",
                               size: 7, maxDepth:3, flat: true) {it.parent.name}
                .ifEmpty { exit 1, "Cannot find freesurfer data: ${surfaces}/**/*{lh*a2009s.annot,lh*pial.vtk,lh*white.vtk,rh*a2009s.annot,rh*pial.vtk,rh*white.vtk,wmparc*}" }
OPERATION_10 origin : []
OPERATION_10 gives  : [['in_surfaces', 'P']]


OPERATION_11 string : in_surfaces_label = Channel
                .fromFilePairs("${surfaces}/**/{label/lh.aparc.annot,label/rh.aparc.annot}",
                               size: 2, maxDepth:3, flat: true) {it.parent.parent.name}
                .ifEmpty { exit 1, "Cannot find freesurfer data: ${surfaces}/**/{label/lh.aparc.annot,label/rh.aparc.annot}" }
OPERATION_11 origin : []
OPERATION_11 gives  : [['in_surfaces_label', 'P']]


OPERATION_12 string : in_surfaces_label = Channel
                .fromFilePairs("${surfaces}/**/{label/lh.aparc.a2009s.annot,label/rh.aparc.a2009s.annot}",
                               size: 2, maxDepth:3, flat: true) {it.parent.parent.name}
                .ifEmpty { exit 1, "Cannot find freesurfer data ${surfaces}/**/{label/lh.aparc.a2009s.annot,label/rh.aparc.a2009s.annot}" }
OPERATION_12 origin : []
OPERATION_12 gives  : [['in_surfaces_label', 'P']]


OPERATION_13 string : in_surfaces_wmparc = Channel
            .fromFilePairs("${surfaces}/**/mri/wmparc*",
                           size: 1, maxDepth:3, flat: true) {it.parent.parent.name}
            .ifEmpty { exit 1, "Cannot find freesurfer data ${surfaces}/**/mri/wmparc*" }
OPERATION_13 origin : []
OPERATION_13 gives  : [['in_surfaces_wmparc', 'P']]


OPERATION_14 string : in_surfaces_mesh = Channel
            .fromFilePairs("${surfaces}/**/{surf/lh.pial,surf/lh.white,surf/rh.pial,surf/rh.white}",
                           size: 4, maxDepth:3, flat: true) {it.parent.parent.name}
            .ifEmpty { exit 1, "Cannot find freesurfer data ${surfaces}/**/{surf/lh.pial,surf/lh.white,surf/rh.pial,surf/rh.white}" }
OPERATION_14 origin : []
OPERATION_14 gives  : [['in_surfaces_mesh', 'P']]


OPERATION_15 string : in_civet_surf = Channel
            .fromFilePairs("${surfaces}/**/{surfaces/*gray_surface_left_81920.obj,surfaces/*gray_surface_right_81920.obj,surfaces/*white_surface_left_81920.obj,surfaces/*white_surface_right_81920.obj}",
                           size: 4, maxDepth:4, flat: true) {it.parent.parent.name}
            .ifEmpty { exit 1, "Cannot find civet data: ${surfaces}/**/{surfaces/*gray_surface_left_81920.obj,surfaces/*gray_surface_right_81920.obj,surfaces/*white_surface_left_81920.obj,surfaces/*white_surface_right_81920.obj}" }
OPERATION_15 origin : []
OPERATION_15 gives  : [['in_civet_surf', 'P']]


OPERATION_16 string : in_civet_transfo = Channel
            .fromFilePairs("${surfaces}/**/transforms/linear/*t1_tal.xfm",
                            size: 1, maxDepth:5, flat: true) {it.parent.parent.parent.name}
             .ifEmpty { exit 1, "Cannot find civet data: ${surfaces}/**/transforms/linear/*t1_tal.xfm" }
OPERATION_16 origin : []
OPERATION_16 gives  : [['in_civet_transfo', 'P']]


OPERATION_17 string : in_civet_animal = Channel
            .fromFilePairs("${surfaces}/**/segment/*animal_labels.mnc",
                            size: 1, maxDepth:5, flat: true) {it.parent.parent.name}
             .ifEmpty { exit 1, "Cannot find civet data: ${surfaces}/**/segment/*animal_labels.mnc" }
OPERATION_17 origin : []
OPERATION_17 gives  : [['in_civet_animal', 'P']]


OPERATION_18 string : feedback_ch = Channel.create()
OPERATION_18 origin : []
OPERATION_18 gives  : [['feedback_ch', 'P']]


OPERATION_19 string : intersections_for_concatenate = Channel.create()
OPERATION_19 origin : []
OPERATION_19 gives  : [['intersections_for_concatenate', 'P']]


OPERATION_20 string : streamlines_for_concatenate = Channel.create()
OPERATION_20 origin : []
OPERATION_20 gives  : [['streamlines_for_concatenate', 'P']]


OPERATION_21 string : fodf_for_pft
        .join(maps_for_pft)
        .set{fodf_and_map_for_pft}
OPERATION_21 origin : [['fodf_for_pft', 'P'], ['maps_for_pft', 'P']]
OPERATION_21 gives  : [['fodf_and_map_for_pft', 'P']]


OPERATION_22 string : annots_for_surfaces_masks, annots_for_surfaces_labels, label_vol_to_convert, surfaces_for_surfaces_masks, surfaces_for_surfaces_labels, surfaces_for_lps = in_surfaces
          .map{sid, lh_annot, lh_pial, lh_white, rh_annot, rh_pial, rh_white, wmparc ->
              [tuple(sid, lh_annot, rh_annot),
              tuple(sid, lh_annot, rh_annot),
              tuple(sid, wmparc),
              tuple(sid, lh_white, rh_white),
              tuple(sid, lh_white, rh_white),
              tuple(sid, lh_pial, rh_pial, lh_white, rh_white)]}
          .separate(6)
OPERATION_22 origin : [['in_surfaces', 'P']]
OPERATION_22 gives  : [['annots_for_surfaces_masks', 'P'], ['annots_for_surfaces_labels', 'P'], ['label_vol_to_convert', 'P'], ['surfaces_for_surfaces_masks', 'P'], ['surfaces_for_surfaces_labels', 'P'], ['surfaces_for_lps', 'P']]


OPERATION_23 string : in_surfaces_label
            .join(in_surfaces_wmparc)
            .join(in_surfaces_mesh)
            .set{in_surfaces}
OPERATION_23 origin : [['in_surfaces_label', 'P'], ['in_surfaces_wmparc', 'P'], ['in_surfaces_mesh', 'P']]
OPERATION_23 gives  : [['in_surfaces', 'P']]


OPERATION_24 string : annots_for_surfaces_masks, annots_for_surfaces_labels, label_vol_to_convert, freesurfer_surfaces_to_convert = in_surfaces
          .map{sid, lh_annot, rh_annot, wmparc, lh_pial, lh_white, rh_pial, rh_white ->
              [tuple(sid, lh_annot, rh_annot),
              tuple(sid, lh_annot, rh_annot),
              tuple(sid, wmparc),
              tuple(sid, lh_pial, rh_pial, lh_white, rh_white)]}
          .separate(4)
OPERATION_24 origin : [['in_surfaces', 'P']]
OPERATION_24 gives  : [['annots_for_surfaces_masks', 'P'], ['annots_for_surfaces_labels', 'P'], ['label_vol_to_convert', 'P'], ['freesurfer_surfaces_to_convert', 'P']]


OPERATION_25 string : in_civet_surf
        .join(in_civet_transfo)
        .join(in_civet_animal)
        .combine(in_civet_template)
        .set{in_civet}
OPERATION_25 origin : [['in_civet_surf', 'P'], ['in_civet_transfo', 'P'], ['in_civet_animal', 'P'], ['in_civet_template', 'P']]
OPERATION_25 gives  : [['in_civet', 'P']]


OPERATION_26 string : annots_for_surfaces_masks, annots_for_surfaces_labels, xfm_transfo_to_convert, animal_to_convert, civet_surfaces_to_convert = in_civet
      .map{sid, lh_pial, rh_pial, lh_white, rh_white, xfm_transfo, animal_labels, lh_annot, rh_annot  ->
          [tuple(sid, lh_annot, rh_annot),
          tuple(sid, lh_annot, rh_annot),
          tuple(sid, xfm_transfo),
          tuple(sid, animal_labels, xfm_transfo),
          tuple(sid, lh_pial, rh_pial, lh_white, rh_white, xfm_transfo)]}
      .separate(5)
OPERATION_26 origin : [['in_civet', 'P']]
OPERATION_26 gives  : [['annots_for_surfaces_masks', 'P'], ['annots_for_surfaces_labels', 'P'], ['xfm_transfo_to_convert', 'P'], ['animal_to_convert', 'P'], ['civet_surfaces_to_convert', 'P']]


OPERATION_27 string : annots_for_surfaces_masks
    .join(surfaces_for_surfaces_masks)
    .set{data_for_surfaces_masks}
OPERATION_27 origin : [['annots_for_surfaces_masks', 'P'], ['surfaces_for_surfaces_masks', 'P']]
OPERATION_27 gives  : [['data_for_surfaces_masks', 'P']]


OPERATION_28 string : surfaces_for_surfaces_labels
    .join(annots_for_surfaces_labels)
    .set{data_for_surfaces_labels}
OPERATION_28 origin : [['surfaces_for_surfaces_labels', 'P'], ['annots_for_surfaces_labels', 'P']]
OPERATION_28 gives  : [['data_for_surfaces_labels', 'P']]


OPERATION_29 string : map_for_rois_seed
    .join(rois_for_masks)
    .set{map_and_rois_for_masks}
OPERATION_29 origin : [['map_for_rois_seed', 'P'], ['rois_for_masks', 'P']]
OPERATION_29 gives  : [['map_and_rois_for_masks', 'P']]


OPERATION_30 string : surfaces_to_concatenate
    .join(rois_to_concatenate)
    .set{surfaces_and_rois_to_concatenate}
OPERATION_30 origin : [['surfaces_to_concatenate', 'P'], ['rois_to_concatenate', 'P']]
OPERATION_30 gives  : [['surfaces_and_rois_to_concatenate', 'P']]


OPERATION_31 string : masks_for_concatenate
    .join(rois_mask_for_concatenate)
    .set{all_masks_for_concatenate}
OPERATION_31 origin : [['masks_for_concatenate', 'P'], ['rois_mask_for_concatenate', 'P']]
OPERATION_31 gives  : [['all_masks_for_concatenate', 'P']]


OPERATION_32 string : labels_for_cocatenate
    .join(rois_labels_for_concatenate)
    .set{all_labels_for_concatenate}
OPERATION_32 origin : [['labels_for_cocatenate', 'P'], ['rois_labels_for_concatenate', 'P']]
OPERATION_32 gives  : [['all_labels_for_concatenate', 'P']]


OPERATION_33 string : surfaces_to_warp
        .into{surfaces_for_seed;surfaces_for_smooth;surfaces_for_density}
OPERATION_33 origin : [['surfaces_to_warp', 'P']]
OPERATION_33 gives  : [['surfaces_for_seed', 'P'], ['surfaces_for_smooth', 'P'], ['surfaces_for_density', 'P']]


OPERATION_34 string : ants_transfo_for_surfaces
        .join(surfaces_to_warp)
        .set{surfaces_with_transform}
OPERATION_34 origin : [['ants_transfo_for_surfaces', 'P'], ['surfaces_to_warp', 'P']]
OPERATION_34 gives  : [['surfaces_with_transform', 'P']]


OPERATION_35 string : surfaces_for_smooth
    .join(flow_mask_for_set_nf)
    .set{data_for_surface_smooth}
OPERATION_35 origin : [['surfaces_for_smooth', 'P'], ['flow_mask_for_set_nf', 'P']]
OPERATION_35 gives  : [['data_for_surface_smooth', 'P']]


OPERATION_36 string : surfaces_for_seed
    .join(seed_mask_for_set_nf)
    .set{data_rand_for_surface_seed}
OPERATION_36 origin : [['surfaces_for_seed', 'P'], ['seed_mask_for_set_nf', 'P']]
OPERATION_36 gives  : [['data_rand_for_surface_seed', 'P']]


OPERATION_37 string : surfaces_seeding_map_for_set
    .combine(random_generator_list)
    .combine([0])
    .set{setup_loop_ch}
OPERATION_37 origin : [['surfaces_seeding_map_for_set', 'P'], ['random_generator_list', 'P']]
OPERATION_37 gives  : [['setup_loop_ch', 'P']]


OPERATION_38 string : set_input_ch = setup_loop_ch.mix(feedback_ch).take(total_tracking)
OPERATION_38 origin : [['setup_loop_ch', 'P'], ['feedback_ch', 'P']]
OPERATION_38 gives  : [['set_input_ch', 'P']]


OPERATION_39 string : set_input_ch
    .combine(surface_flow_surfaces_for_pft, by : 0)
    .combine(fodf_and_map_for_pft, by : 0)
    .combine(intersections_mask_for_set_nf, by : 0)
    .combine(surface_type_for_set_nf, by : 0)
    .combine(surface_flow_lines_for_combine, by : 0)
    .set{data_for_set}
OPERATION_39 origin : [['set_input_ch', 'P']]
OPERATION_39 gives  : [['data_for_set', 'P']]


OPERATION_40 string : intersections_for_concatenate
    .groupTuple(size: nb_tracking_per_sub)
    .set{intersections_grouped_for_concatenate}
OPERATION_40 origin : [['intersections_for_concatenate', 'P']]
OPERATION_40 gives  : [['intersections_grouped_for_concatenate', 'P']]


OPERATION_41 string : surfaces_for_connectivity
    .join(labels_for_set_nf)
    .set{surf_and_labels_for_connectivity}
OPERATION_41 origin : [['surfaces_for_connectivity', 'P'], ['labels_for_set_nf', 'P']]
OPERATION_41 gives  : [['surf_and_labels_for_connectivity', 'P']]


OPERATION_42 string : intersections_for_connectivity
    .combine(surf_and_labels_for_connectivity, by : 0)
    .set{data_for_connectivity}
OPERATION_42 origin : [['intersections_for_connectivity', 'P']]
OPERATION_42 gives  : [['data_for_connectivity', 'P']]


OPERATION_43 string : intersections_for_density
    .combine(surfaces_for_density, by : 0)
    .set{data_for_density}
OPERATION_43 origin : [['intersections_for_density', 'P']]
OPERATION_43 gives  : [['data_for_density', 'P']]


