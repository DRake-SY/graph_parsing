Name : Compute_Kernel
Inputs : [[0, 'unique_data_for_kernels']]
Outputs : [[0, 'kernel_for_fw']]
Emits : []


Name : Compute_FreeWater
Inputs : [[0, 'data_with_kernel_for_fw']]
Outputs : [[0, 'fw_corrected_dwi']]
Emits : []


Name : FW_Corrected_Metrics
Inputs : [[0, 'data_for_dti_metrics']]
Outputs : []
Emits : []


