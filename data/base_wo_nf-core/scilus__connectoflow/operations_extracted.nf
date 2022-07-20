OPERATION_1 string : Channel
    .fromPath("$root/**/*t1.nii.gz",
                    maxDepth:1)
    .map{[it.parent.name, it]}
    .into{in_t1;subjects_for_count}
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_t1', 'P'], ['subjects_for_count', 'P']]


OPERATION_2 string : Channel
    .fromPath("$root/**/*$params.labels_img_prefix*labels.nii.gz",
                    maxDepth:1)
    .map{[it.parent.name, it]}
    .set{in_labels}
OPERATION_2 origin : []
OPERATION_2 gives  : [['in_labels', 'P']]


OPERATION_3 string : in_transfo = Channel
    .fromFilePairs("$root/**/{*0GenericAffine.mat,*1Warp.nii.gz}",
                    size: 2,
                    maxDepth:1,
                    flat: true) {it.parent.name}
OPERATION_3 origin : []
OPERATION_3 gives  : [['in_transfo', 'P']]


OPERATION_4 string : in_tracking = Channel
    .fromFilePairs("$root/**/{*tracking*.*,}",
                    size: -1,
                    maxDepth:1) {it.parent.name}
OPERATION_4 origin : []
OPERATION_4 gives  : [['in_tracking', 'P']]


OPERATION_5 string : Channel
    .fromPath("$root/**/*fodf.nii.gz",
                    maxDepth:1)
    .map{[it.parent.name, it]}
    .into{fodf_for_afd_rd;fodf_for_count}
OPERATION_5 origin : []
OPERATION_5 gives  : [['fodf_for_afd_rd', 'P'], ['fodf_for_count', 'P']]


OPERATION_6 string : Channel
    .fromFilePairs("$params.input/**/*lesion_mask.nii.gz",
        size: -1) { it.parent.name }
    .set{lesion_for_lesion_load}
OPERATION_6 origin : []
OPERATION_6 gives  : [['lesion_for_lesion_load', 'P']]


OPERATION_7 string : Channel.fromPath(file(params.template))
    .into{template_for_registration;template_for_transformation_data;template_for_transformation_metrics;template_for_transformation_lesions}
OPERATION_7 origin : [['file(params.template', 'A']]
OPERATION_7 gives  : [['template_for_registration', 'P'], ['template_for_transformation_data', 'P'], ['template_for_transformation_metrics', 'P'], ['template_for_transformation_lesions', 'P']]


OPERATION_8 string : Channel.fromPath(file(params.labels_list))
    .into{labels_list_for_compute;labels_list_for_visualize}
OPERATION_8 origin : [['file(params.labels_list', 'A']]
OPERATION_8 gives  : [['labels_list_for_compute', 'P'], ['labels_list_for_visualize', 'P']]


OPERATION_9 string : in_opt_metrics = Channel
    .fromFilePairs("$root/**/metrics/*.nii.gz",
                    size: -1,
                    maxDepth:2) {it.parent.parent.name}
OPERATION_9 origin : []
OPERATION_9 gives  : [['in_opt_metrics', 'P']]


OPERATION_10 string : in_dwi_data = Channel
    .fromFilePairs("$root/**/{*dwi.bval,*dwi.bvec,*dwi.nii.gz,*peaks.nii.gz}",
                    size: 4,
                    maxDepth:1,
                    flat: true) {it.parent.name}
OPERATION_10 origin : []
OPERATION_10 gives  : [['in_dwi_data', 'P']]


OPERATION_11 string : anat_for_transformation = Channel.empty()
OPERATION_11 origin : []
OPERATION_11 gives  : [['anat_for_transformation', 'P']]


OPERATION_12 string : ori_anat = Channel.empty()
OPERATION_12 origin : []
OPERATION_12 gives  : [['ori_anat', 'P']]


OPERATION_13 string : ori_labels = Channel.empty()
OPERATION_13 origin : []
OPERATION_13 gives  : [['ori_labels', 'P']]


OPERATION_14 string : h5_labels_list_for_compute = Channel.empty()
OPERATION_14 origin : []
OPERATION_14 gives  : [['h5_labels_list_for_compute', 'P']]


OPERATION_15 string : h5_labels_similarity_list_for_compute = Channel.empty()
OPERATION_15 origin : []
OPERATION_15 gives  : [['h5_labels_similarity_list_for_compute', 'P']]


OPERATION_16 string : dwi_for_count, data_for_commit = in_dwi_data
    .map{sid, bval, bvec, dwi, peaks ->
        [tuple(sid, dwi),
        tuple(sid, bval, bvec, dwi, peaks)]}
    .separate(2)
OPERATION_16 origin : [['in_dwi_data', 'P']]
OPERATION_16 gives  : [['dwi_for_count', 'P'], ['data_for_commit', 'P']]


OPERATION_17 string : subjects_for_count.count().into{ number_subj_for_null_check; number_subj_for_compare_dwi; number_subj_for_compare_fodf; number_subj_for_compare_similarity}
OPERATION_17 origin : [['subjects_for_count', 'P']]
OPERATION_17 gives  : [['number_subj_for_null_check', 'P'], ['number_subj_for_compare_dwi', 'P'], ['number_subj_for_compare_fodf', 'P'], ['number_subj_for_compare_similarity', 'P']]


OPERATION_18 string : dwi_for_count.count().into{ dwi_for_null_check; dwi_for_compare }
OPERATION_18 origin : [['dwi_for_count', 'P']]
OPERATION_18 gives  : [['dwi_for_null_check', 'P'], ['dwi_for_compare', 'P']]


OPERATION_19 string : fodf_for_count.count().into{ fodf_for_null_check; fodf_for_compare }
OPERATION_19 origin : [['fodf_for_count', 'P']]
OPERATION_19 gives  : [['fodf_for_null_check', 'P'], ['fodf_for_compare', 'P']]


OPERATION_20 string : number_subj_for_null_check
.subscribe{a -> if (a == 0)
    error "Error ~ No subjects found. Please check the naming convention, your --input path."}
OPERATION_20 origin : [['number_subj_for_null_check', 'P']]
OPERATION_20 gives  : []


OPERATION_21 string : number_subj_for_compare_similarity
.subscribe{a -> if (a < params.nbr_subjects_for_avg_connections && params.use_similarity_metric)
    error "Error --nbr_subjects_for_avg_connections is higher than the number of subjects. Please modify it or use --he number of subjects. Please modify it or use --use_similarity_metric"}
OPERATION_21 origin : [['number_subj_for_compare_similarity', 'P']]
OPERATION_21 gives  : []


OPERATION_22 string : dwi_for_null_check
.subscribe{a -> if (a == 0)
    run_commit = false}
OPERATION_22 origin : [['dwi_for_null_check', 'P']]
OPERATION_22 gives  : []


OPERATION_23 string : fodf_for_null_check
.subscribe{a -> if (a == 0)
    run_afd_rd = false}
OPERATION_23 origin : [['fodf_for_null_check', 'P']]
OPERATION_23 gives  : []


OPERATION_24 string : number_subj_for_compare_dwi
    .concat(dwi_for_compare)
    .toList()
    .subscribe{a, b -> if (a != b && b > 0)
    error "Error ~ Mismatch between the number of subjects and DWI"}
OPERATION_24 origin : [['number_subj_for_compare_dwi', 'P'], ['dwi_for_compare', 'P']]
OPERATION_24 gives  : []


OPERATION_25 string : number_subj_for_compare_fodf
    .concat(fodf_for_compare)
    .toList()
    .subscribe{a, b -> if (a != b && b > 0)
    error "Error ~ Mismatch between the number of subjects and FODF"}
OPERATION_25 origin : [['number_subj_for_compare_fodf', 'P'], ['fodf_for_compare', 'P']]
OPERATION_25 gives  : []


OPERATION_26 string : in_t1
        .set{ori_anat}
OPERATION_26 origin : [['in_t1', 'P']]
OPERATION_26 gives  : [['ori_anat', 'P']]


OPERATION_27 string : in_labels
        .set{ori_labels}
OPERATION_27 origin : [['in_labels', 'P']]
OPERATION_27 gives  : [['ori_labels', 'P']]


OPERATION_28 string : in_t1
        .join(in_labels)
        .join(in_transfo)
        .set{anat_for_transformation}
OPERATION_28 origin : [['in_t1', 'P'], ['in_labels', 'P'], ['in_transfo', 'P']]
OPERATION_28 gives  : [['anat_for_transformation', 'P']]


OPERATION_29 string : ori_anat
    .concat(transformed_anat)
    .into{anat_for_registration;anat_for_concatenate;anat_for_metrics;anat_for_lesions}
OPERATION_29 origin : [['ori_anat', 'P'], ['transformed_anat', 'P']]
OPERATION_29 gives  : [['anat_for_registration', 'P'], ['anat_for_concatenate', 'P'], ['anat_for_metrics', 'P'], ['anat_for_lesions', 'P']]


OPERATION_30 string : ori_labels
    .concat(transformed_labels)
    .into{labels_for_transformation;labels_for_decompose}
OPERATION_30 origin : [['ori_labels', 'P'], ['transformed_labels', 'P']]
OPERATION_30 gives  : [['labels_for_transformation', 'P'], ['labels_for_decompose', 'P']]


OPERATION_31 string : in_tracking.set{tracking_for_decompose}
OPERATION_31 origin : [['in_tracking', 'P']]
OPERATION_31 gives  : [['tracking_for_decompose', 'P']]


OPERATION_32 string : tracking_for_decompose
    .join(labels_for_decompose)
    .set{tracking_labels_for_decompose}
OPERATION_32 origin : [['tracking_for_decompose', 'P'], ['labels_for_decompose', 'P']]
OPERATION_32 gives  : [['tracking_labels_for_decompose', 'P']]


OPERATION_33 string : data_for_commit
    .join(h5_for_commit)
    .set{data_tracking_for_commit}
OPERATION_33 origin : [['data_for_commit', 'P'], ['h5_for_commit', 'P']]
OPERATION_33 gives  : [['data_tracking_for_commit', 'P']]


OPERATION_34 string : h5_for_skip_commit
        .into{h5_for_afd_rd;h5_for_skip_afd_rd}
OPERATION_34 origin : [['h5_for_skip_commit', 'P']]
OPERATION_34 gives  : [['h5_for_afd_rd', 'P'], ['h5_for_skip_afd_rd', 'P']]


OPERATION_35 string : h5_for_afd_rd
    .join(fodf_for_afd_rd)
    .set{h5_fodf_for_afd_rd}
OPERATION_35 origin : [['h5_for_afd_rd', 'P'], ['fodf_for_afd_rd', 'P']]
OPERATION_35 gives  : [['h5_fodf_for_afd_rd', 'P']]


OPERATION_36 string : anat_for_registration
    .combine(template_for_registration)
    .set{anats_for_registration}PROCESS DEF Register_Anat
OPERATION_36 origin : [['anat_for_registration', 'P'], ['template_for_registration', 'P']]
OPERATION_36 gives  : [['anats_for_registration', 'P']]


OPERATION_37 string : in_opt_metrics
    .transpose()
    .concat(anat_for_metrics)
    .groupTuple()
    .flatMap{ sid, metrics -> metrics.collect{ [sid, it] } }
    .combine(transformation_for_metrics, by: 0)
    .combine(template_for_transformation_metrics)
    .set{metrics_transformation_for_metrics}PROCESS DEF Transform_Metrics
OPERATION_37 origin : [['in_opt_metrics', 'P'], ['template_for_transformation_metrics', 'P'], ['anat_for_metrics', 'P']]
OPERATION_37 gives  : [['metrics_transformation_for_metrics', 'P']]


OPERATION_38 string : lesion_for_lesion_load
    .join(transformation_for_lesions)
    .combine(template_for_transformation_lesions)
    .set{lesions_transformation_for_data}
OPERATION_38 origin : [['lesion_for_lesion_load', 'P'], ['transformation_for_lesions', 'P'], ['template_for_transformation_lesions', 'P']]
OPERATION_38 gives  : [['lesions_transformation_for_data', 'P']]


OPERATION_39 string : h5_for_skip_afd_rd
        .set{h5_for_transformation}
OPERATION_39 origin : [['h5_for_skip_afd_rd', 'P']]
OPERATION_39 gives  : [['h5_for_transformation', 'P']]


OPERATION_40 string : h5_for_transformation
    .join(labels_for_transformation)
    .join(transformation_for_data)
    .combine(template_for_transformation_data)
    .set{labels_tracking_transformation_for_data}PROCESS DEF Transform_Data
OPERATION_40 origin : [['h5_for_transformation', 'P'], ['labels_for_transformation', 'P'], ['transformation_for_data', 'P'], ['template_for_transformation_data', 'P']]
OPERATION_40 gives  : [['labels_tracking_transformation_for_data', 'P']]


OPERATION_41 string : h5_for_similarity
    .take(params.nbr_subjects_for_avg_connections)
    .collect()
    .set{all_h5_for_similarity}
OPERATION_41 origin : [['h5_for_similarity', 'P']]
OPERATION_41 gives  : [['all_h5_for_similarity', 'P']]


OPERATION_42 string : metrics_for_compute
    .concat(lesions_for_compute)
    .groupTuple()
    .set{all_metrics_for_compute}
OPERATION_42 origin : [['metrics_for_compute', 'P'], ['lesions_for_compute', 'P']]
OPERATION_42 gives  : [['all_metrics_for_compute', 'P']]


OPERATION_43 string : h5_labels_for_compute
        .join(all_metrics_for_compute)
        .combine(edges_for_similarity)
        .combine(labels_list_for_compute)
        .set{h5_labels_similarity_list_for_compute}
OPERATION_43 origin : [['h5_labels_for_compute', 'P'], ['all_metrics_for_compute', 'P'], ['edges_for_similarity', 'P'], ['labels_list_for_compute', 'P']]
OPERATION_43 gives  : [['h5_labels_similarity_list_for_compute', 'P']]


OPERATION_44 string : h5_labels_for_compute
        .join(all_metrics_for_compute)
        .combine(labels_list_for_compute)
        .set{h5_labels_list_for_compute}
OPERATION_44 origin : [['h5_labels_for_compute', 'P'], ['all_metrics_for_compute', 'P'], ['labels_list_for_compute', 'P']]
OPERATION_44 gives  : [['h5_labels_list_for_compute', 'P']]


OPERATION_45 string : matrices_w_similarity_for_merge
  .mix(matrices_wo_similarity_for_merge)
  .set{matrices_for_connectivity_in_csv}
OPERATION_45 origin : [['matrices_w_similarity_for_merge', 'P'], ['matrices_wo_similarity_for_merge', 'P']]
OPERATION_45 gives  : [['matrices_for_connectivity_in_csv', 'P']]


OPERATION_46 string : matrices_for_visualize_with_similarity
    .concat(matrices_for_visualize_without_similarity)
    .combine(labels_list_for_visualize)
    .set{matrices_labels_list_for_visualize}
OPERATION_46 origin : [['matrices_for_visualize_with_similarity', 'P'], ['labels_list_for_visualize', 'P'], ['matrices_for_visualize_without_similarity', 'P']]
OPERATION_46 gives  : [['matrices_labels_list_for_visualize', 'P']]


