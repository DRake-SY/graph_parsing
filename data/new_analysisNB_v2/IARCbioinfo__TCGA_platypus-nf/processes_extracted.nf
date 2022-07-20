Name : convert2annovar
Inputs : [[0, 'vcf']]
Outputs : [[0, 'convert_VCF']]
Emits : []


Name : germline_filter
Inputs : [[0, 'convert_VCF']]
Outputs : [[0, 'germ_filt']]
Emits : []


Name : reformat
Inputs : [[0, 'germ_filt']]
Outputs : [[0, 'reformated']]
Emits : []


Name : filter_blood_tissue
Inputs : [[0, 'reformated']]
Outputs : [[0, 'blood_tissue_filtered']]
Emits : []


Name : annotation
Inputs : [[0, 'blood_tissue_filtered']]
Outputs : [[0, 'annotated']]
Emits : []


Name : merge
Inputs : [[0, 'annotated']]
Outputs : [[0, 'reformated_for_annovar']]
Emits : []


