OPERATION_1 string : in_data = Channel
        .fromFilePairs("$input/**/*{brain_mask.nii.gz,bval,bvec,dwi.nii.gz}",
                       size: 4,
                       maxDepth:1,
                       flat: true) {it.parent.name}
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_data', 'P']]


OPERATION_2 string : in_data_priors = Channel
        .fromFilePairs("$input/**/*{ad.nii.gz,fa.nii.gz,md.nii.gz}",
                       size: 3,
                       maxDepth:1,
                       flat: true) {it.parent.name}
OPERATION_2 origin : []
OPERATION_2 gives  : [['in_data_priors', 'P']]


OPERATION_3 string : all_data_for_kernels, data_for_noddi = in_data
    .map{sid, mask, bval, bvec, dwi ->
        [tuple(sid, mask, bval, bvec, dwi),
         tuple(sid, mask, bval, bvec, dwi)]}
    .separate(2)
OPERATION_3 origin : [['in_data', 'P']]
OPERATION_3 gives  : [['all_data_for_kernels', 'P'], ['data_for_noddi', 'P']]


OPERATION_4 string : in_data_priors.take(params.nb_subjects_for_priors).set{sub_in_data_priors}
OPERATION_4 origin : [['in_data_priors', 'P']]
OPERATION_4 gives  : [['sub_in_data_priors', 'P']]


OPERATION_5 string : priors_for_mean
    .groupTuple()
    .set{all_priors_for_mean}
OPERATION_5 origin : [['priors_for_mean', 'P']]
OPERATION_5 gives  : [['all_priors_for_mean', 'P']]


OPERATION_6 string : all_data_for_kernels.first().set{unique_data_for_kernels}
OPERATION_6 origin : [['all_data_for_kernels', 'P']]
OPERATION_6 gives  : [['unique_data_for_kernels', 'P']]


OPERATION_7 string : data_for_noddi
  .combine(kernel_for_noddi)
  .set{data_with_kernel_for_noddi}
OPERATION_7 origin : [['data_for_noddi', 'P'], ['kernel_for_noddi', 'P']]
OPERATION_7 gives  : [['data_with_kernel_for_noddi', 'P']]


