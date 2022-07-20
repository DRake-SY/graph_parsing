OPERATION_1 string : Channel.fromFilePairs("$root/**/*${params.lesion_name}.nii.gz",
                     size: 1,
                     maxDepth: 1,
                     flat: true) {it.parent.name}
          .into{lesions; lesions_for_registration; check_lesions}
OPERATION_1 origin : []
OPERATION_1 gives  : [['lesions', 'P'], ['lesions_for_registration', 'P'], ['check_lesions', 'P']]


OPERATION_2 string : Channel.fromFilePairs("$root/**/*t1.nii.gz",
                          size: 1,
                          maxDepth: 1,
                          flat: true) {it.parent.name}
          .into{t1s_for_register; check_t1s}
OPERATION_2 origin : []
OPERATION_2 gives  : [['t1s_for_register', 'P'], ['check_t1s', 'P']]


OPERATION_3 string : Channel.fromFilePairs("$tractograms/**/*.trk",
                          size: 1,
                          maxDepth: 1,
                          flat: true) {it.parent.name}
          .into{trks_for_combine; check_trks; trks_for_transformation}
OPERATION_3 origin : []
OPERATION_3 gives  : [['trks_for_combine', 'P'], ['check_trks', 'P'], ['trks_for_transformation', 'P']]


OPERATION_4 string : Channel.fromFilePairs("$tractograms/**/*t1.nii.gz",
                          size: 1,
                          maxDepth: 1,
                          flat: true) {it.parent.name}
            .into{trks_t1s_for_register; check_trks_t1s}
OPERATION_4 origin : []
OPERATION_4 gives  : [['trks_t1s_for_register', 'P'], ['check_trks_t1s', 'P']]


OPERATION_5 string : Channel.fromFilePairs("$atlas/{atlas_labels.nii.gz,atlas_labels.txt,atlas_t1.nii.gz,atlas_list.txt}",
                          size: 4,
                          maxDepth: 0,
                          flat: true) {it.parent.name}
      .into{atlas_for_combine; atlas_for_trk_registration; atlas_for_lesion_registration; atlas_for_copy; check_atlas}
OPERATION_5 origin : []
OPERATION_5 gives  : [['atlas_for_combine', 'P'], ['atlas_for_trk_registration', 'P'], ['atlas_for_lesion_registration', 'P'], ['atlas_for_copy', 'P'], ['check_atlas', 'P']]


OPERATION_6 string : check_lesions.count().into{check_lesions_number; check_lesions_number_compare_t1}
OPERATION_6 origin : [['check_lesions', 'P']]
OPERATION_6 gives  : [['check_lesions_number', 'P'], ['check_lesions_number_compare_t1', 'P']]


OPERATION_7 string : check_t1s.count().into{check_t1s_number; check_t1s_number_for_registration}
OPERATION_7 origin : [['check_t1s', 'P']]
OPERATION_7 gives  : [['check_t1s_number', 'P'], ['check_t1s_number_for_registration', 'P']]


OPERATION_8 string : check_trks_t1s.count().into{check_trks_t1s_numbers; check_trks_t1s_for_compare; trks_t1s_empty; check_trks_t1s_for_registration}
OPERATION_8 origin : [['check_trks_t1s', 'P']]
OPERATION_8 gives  : [['check_trks_t1s_numbers', 'P'], ['check_trks_t1s_for_compare', 'P'], ['trks_t1s_empty', 'P'], ['check_trks_t1s_for_registration', 'P']]


OPERATION_9 string : check_trks.count().into{check_trks_numbers; check_trks_for_compare}
OPERATION_9 origin : [['check_trks', 'P']]
OPERATION_9 gives  : [['check_trks_numbers', 'P'], ['check_trks_for_compare', 'P']]


OPERATION_10 string : check_lesions_number
.subscribe{a -> if (a == 0)
    error "Error ~ No subjects found. Please check the naming convention, your --input path."}
OPERATION_10 origin : [['check_lesions_number', 'P']]
OPERATION_10 gives  : []


OPERATION_11 string : check_atlas
.count()
.subscribe{a -> if (a == 0)
    error "Error ~ No atlas found. Please check the naming convention, your --atlas path."}
OPERATION_11 origin : [['check_atlas', 'P']]
OPERATION_11 gives  : []


OPERATION_12 string : check_lesions_number_compare_t1
  .concat(check_t1s_number)
  .toList()
  .subscribe{a, b -> if (a != b && b > 0)
  error "Error ~ Some subjects have a T1w and others don't.\n" +
        "Please be sure to have the same acquisitions for all subjects."}
OPERATION_12 origin : [['check_lesions_number_compare_t1', 'P'], ['check_t1s_number', 'P']]
OPERATION_12 gives  : []


OPERATION_13 string : check_trks_numbers
.subscribe{a -> if (a == 0)
    error "Error ~ No tractograms found. Please check the naming convention, your --tractograms path."
}
OPERATION_13 origin : [['check_trks_numbers', 'P']]
OPERATION_13 gives  : []


OPERATION_14 string : check_trks_for_compare
  .concat(check_trks_t1s_for_compare)
  .toList()
  .subscribe{a, b -> if (a != b && b > 0)
  error "Error ~ Some tractograms have a T1w and others don't.\n" +
        "Please be sure to have the same acquisitions for all tractograms."}
OPERATION_14 origin : [['check_trks_for_compare', 'P'], ['check_trks_t1s_for_compare', 'P']]
OPERATION_14 gives  : []


OPERATION_15 string : t1s_for_register.combine(atlas_for_lesion_registration).set{atlas_lesion_for_registration}
OPERATION_15 origin : [['t1s_for_register', 'P'], ['atlas_for_lesion_registration', 'P']]
OPERATION_15 gives  : [['atlas_lesion_for_registration', 'P']]


OPERATION_16 string : lesions_for_registration
    .join(transformation_for_registration_lesions)
    .set{lesion_mat_for_transformation}
OPERATION_16 origin : [['lesions_for_registration', 'P'], ['transformation_for_registration_lesions', 'P']]
OPERATION_16 gives  : [['lesion_mat_for_transformation', 'P']]


OPERATION_17 string : trks_t1s_for_register.combine(atlas_for_trk_registration).set{atlas_trk_for_registration}
OPERATION_17 origin : [['trks_t1s_for_register', 'P'], ['atlas_for_trk_registration', 'P']]
OPERATION_17 gives  : [['atlas_trk_for_registration', 'P']]


OPERATION_18 string : transformation_for_trk_registration
    .cross(trks_for_transformation)
    .map { [ it[0][0], it[1][1], it[0][1], it[0][2], it[0][3], it[0][4]] }
    .set{transfo_trk_for_registration}
OPERATION_18 origin : [['transformation_for_trk_registration', 'P'], ['trks_for_transformation', 'P']]
OPERATION_18 gives  : [['transfo_trk_for_registration', 'P']]


OPERATION_19 string : trks_for_combine.combine(atlas_for_combine).set{trk_atlases_for_decompose_connectivity}
OPERATION_19 origin : [['trks_for_combine', 'P'], ['atlas_for_combine', 'P']]
OPERATION_19 gives  : [['trk_atlases_for_decompose_connectivity', 'P']]


OPERATION_20 string : transformed_trks.combine(atlas_for_combine).set{trk_atlases_for_decompose_connectivity}
OPERATION_20 origin : [['transformed_trks', 'P'], ['atlas_for_combine', 'P']]
OPERATION_20 gives  : [['trk_atlases_for_decompose_connectivity', 'P']]


OPERATION_21 string : lesions.set{lesion_for_connectivity}
OPERATION_21 origin : [['lesions', 'P']]
OPERATION_21 gives  : [['lesion_for_connectivity', 'P']]


OPERATION_22 string : transformed_lesions.set{lesion_for_connectivity}
OPERATION_22 origin : [['transformed_lesions', 'P']]
OPERATION_22 gives  : [['lesion_for_connectivity', 'P']]


OPERATION_23 string : h5_for_combine_with_lesion.combine(lesion_for_connectivity)
  .set{h5_labels_lesion_for_compute_connectivity}
OPERATION_23 origin : [['h5_for_combine_with_lesion', 'P'], ['lesion_for_connectivity', 'P']]
OPERATION_23 gives  : [['h5_labels_lesion_for_compute_connectivity', 'P']]


