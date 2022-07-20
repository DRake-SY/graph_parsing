Name : README
Inputs : []
Outputs : []
Emits : []


Name : Register_T1
Inputs : [[0, 't1_for_registration'], [1, 'template_for_registration']]
Outputs : [[0, 'transformation_for_nii'], [0, 'transformation_for_tractogram']]
Emits : []


Name : Transform_NII
Inputs : [[0, 'transformation_and_nii'], [1, 'template_for_transformation_nii']]
Outputs : []
Emits : []


Name : Transform_Tractogram
Inputs : [[0, 'transformation_and_tractogram'], [1, 'template_for_transformation_tractogram']]
Outputs : []
Emits : []


