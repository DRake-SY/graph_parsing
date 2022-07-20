Name : Compute_Priors
Inputs : [[0, 'sub_in_data_priors']]
Outputs : [[0, 'priors_for_mean']]
Emits : []


Name : Mean_Priors
Inputs : [[0, 'all_priors_for_mean']]
Outputs : []
Emits : []


Name : Compute_Kernel
Inputs : [[0, 'unique_data_for_kernels']]
Outputs : [[0, 'kernel_for_noddi']]
Emits : []


Name : Compute_NODDI
Inputs : [[0, 'data_with_kernel_for_noddi']]
Outputs : []
Emits : []


