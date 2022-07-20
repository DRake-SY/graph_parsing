OPERATION_1 string : Channel.fromPath(file(params.template))
    .into {template_for_registration; template_for_transformation_nii; template_for_transformation_trk}
OPERATION_1 origin : [['file(params.template', 'A']]
OPERATION_1 gives  : [['template_for_registration', 'P'], ['template_for_transformation_nii', 'P'], ['template_for_transformation_trk', 'P']]


OPERATION_2 string : trk_for_transformation = Channel
    .fromFilePairs("$root/**/*.trk",
                   size:-1,
                   maxDepth:1,
                   flat: true) {it.parent.name}
OPERATION_2 origin : []
OPERATION_2 gives  : [['trk_for_transformation', 'P']]


OPERATION_3 string : Channel
    .fromPath("$root/**/*.nii.gz",
              maxDepth:1)
    .branch {
        t1: it =~ "t1.nii.gz"
        other: true
    }
    .set { result }
OPERATION_3 origin : []
OPERATION_3 gives  : [['result', 'P']]


OPERATION_4 string : result.t1().map{[it.parent.name, it]}
.into { t1_for_registration; check_subjects_number }
OPERATION_4 origin : [['result', 'P']]
OPERATION_4 gives  : [['t1_for_registration', 'P'], ['check_subjects_number', 'P']]


OPERATION_5 string : result.other().map{[it.parent.name, it]}
.set { nii_for_transformation }
OPERATION_5 origin : [['result', 'P']]
OPERATION_5 gives  : [['nii_for_transformation', 'P']]


OPERATION_6 string : t1_for_registration
    .combine(template_for_registration)
    .set {t1_and_template_for_registration}
OPERATION_6 origin : [['t1_for_registration', 'P'], ['template_for_registration', 'P']]
OPERATION_6 gives  : [['t1_and_template_for_registration', 'P']]


OPERATION_7 string : check_subjects_number.count().set{ number_subj_for_null_check }
OPERATION_7 origin : [['check_subjects_number', 'P']]
OPERATION_7 gives  : [['number_subj_for_null_check', 'P']]


OPERATION_8 string : number_subj_for_null_check
.subscribe{a -> if (a == 0)
    error "Error ~ No subjects found. Please check the naming convention, your --input path or your BIDS folder."}
OPERATION_8 origin : [['number_subj_for_null_check', 'P']]
OPERATION_8 gives  : []


OPERATION_9 string : nii_for_transformation
    .join(transformation_for_nii)
    .combine(template_for_transformation_nii)
    .set{nii_and_template_for_transformation}
OPERATION_9 origin : [['nii_for_transformation', 'P'], ['transformation_for_nii', 'P'], ['template_for_transformation_nii', 'P']]
OPERATION_9 gives  : [['nii_and_template_for_transformation', 'P']]


OPERATION_10 string : trk_for_transformation
    .join(transformation_for_trk)
    .combine(template_for_transformation_trk)
    .set{trk_and_template_for_transformation}
OPERATION_10 origin : [['trk_for_transformation', 'P'], ['transformation_for_trk', 'P'], ['template_for_transformation_trk', 'P']]
OPERATION_10 gives  : [['trk_and_template_for_transformation', 'P']]


