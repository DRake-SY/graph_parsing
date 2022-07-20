OPERATION_1 string : in_data = Channel
        .fromFilePairs("$input/**/*{brain_mask.nii.gz,bval,bvec,dwi.nii.gz}",
                       size: 4,
                       maxDepth:1,
                       flat: true) {it.parent.name}
OPERATION_1 origin : []
OPERATION_1 gives  : [['in_data', 'P']]


OPERATION_2 string : all_data_for_kernels, data_for_fw, grads_mask_for_metrics = in_data
    .map{sid, brain_mask, bval, bvec, dwi -> [tuple(sid, brain_mask, bval, bvec, dwi),
                                                tuple(sid, brain_mask, bval, bvec, dwi),
                                                tuple(sid, brain_mask, bval, bvec)]}
    .separate(3)
OPERATION_2 origin : [['in_data', 'P']]
OPERATION_2 gives  : [['all_data_for_kernels', 'P'], ['data_for_fw', 'P'], ['grads_mask_for_metrics', 'P']]


OPERATION_3 string : all_data_for_kernels.first().set{unique_data_for_kernels}
OPERATION_3 origin : [['all_data_for_kernels', 'P']]
OPERATION_3 gives  : [['unique_data_for_kernels', 'P']]


OPERATION_4 string : data_for_fw
  .combine(kernel_for_fw)
  .set{data_with_kernel_for_fw}
OPERATION_4 origin : [['data_for_fw', 'P'], ['kernel_for_fw', 'P']]
OPERATION_4 gives  : [['data_with_kernel_for_fw', 'P']]


OPERATION_5 string : grads_mask_for_metrics
    .join(fw_corrected_dwi)
    .set{data_for_dti_metrics}
OPERATION_5 origin : [['grads_mask_for_metrics', 'P'], ['fw_corrected_dwi', 'P']]
OPERATION_5 gives  : [['data_for_dti_metrics', 'P']]


