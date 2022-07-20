OPERATION_1 string : Channel.fromPath(file(params.template))
    .into {template_for_registration; template_for_transformation_nii; template_for_transformation_tractogram}
OPERATION_1 origin : [['file(params.template', 'A']]
OPERATION_1 gives  : [['template_for_registration', 'P'], ['template_for_transformation_nii', 'P'], ['template_for_transformation_tractogram', 'P']]


OPERATION_2 string : tractogram_for_transformation = Channel
    .fromFilePairs("$root/**/*{.tck,.trk}",
                   size:-1,
                   maxDepth:1,
                   flat: true) {it.parent.name}
OPERATION_2 origin : []
OPERATION_2 gives  : [['tractogram_for_transformation', 'P']]


OPERATION_3 string : Channel
    .fromPath("$root/**/*.nii.gz",
              maxDepth:1)
    .branch {
        t1: it ==~ ".*t1\\.nii\\.gz"                                          
        other: true
    }
    .set { result }
OPERATION_3 origin : []
OPERATION_3 gives  : [['result', 'P']]


OPERATION_4 string : result.t1().map{[it.parent.name, it]}
.into { t1_for_registration; check_subjects_number; validate_count }
OPERATION_4 origin : [['result', 'P']]
OPERATION_4 gives  : [['t1_for_registration', 'P'], ['check_subjects_number', 'P'], ['validate_count', 'P']]


OPERATION_5 string : validate_count
.groupTuple()
.subscribe { it -> if (it[1].size() != 1)
    error "Error ~ Multiple `*t1.nii.gz` files found for subject: ${it[0]} \nFiles found: ${it[1]}" }
OPERATION_5 origin : [['validate_count', 'P']]
OPERATION_5 gives  : []


OPERATION_6 string : result.other().map{[it.parent.name, it]}
.set { nii_for_transformation }
OPERATION_6 origin : [['result', 'P']]
OPERATION_6 gives  : [['nii_for_transformation', 'P']]


OPERATION_7 string : check_subjects_number.count().set{ number_subj_for_null_check }
OPERATION_7 origin : [['check_subjects_number', 'P']]
OPERATION_7 gives  : [['number_subj_for_null_check', 'P']]


OPERATION_8 string : number_subj_for_null_check
.subscribe{a -> if (a == 0)
    error "Error ~ No subjects found. Please check the naming convention, your --input path."}
OPERATION_8 origin : [['number_subj_for_null_check', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : transformation_for_nii
    .cross(nii_for_transformation)
    .map { [ it[0][0], it[0][1], it[1][1] ] }
    .set{transformation_and_nii}
OPERATION_9 origin : [['transformation_for_nii', 'P'], ['nii_for_transformation', 'P']]
OPERATION_9 gives  : [['transformation_and_nii', 'P']]


OPERATION_10 string : transformation_for_tractogram
    .cross(tractogram_for_transformation)
    .map { [ it[0][0], it[0][1], it[1][1] ] }
    .set{transformation_and_tractogram}
OPERATION_10 origin : [['transformation_for_tractogram', 'P'], ['tractogram_for_transformation', 'P']]
OPERATION_10 gives  : [['transformation_and_tractogram', 'P']]


