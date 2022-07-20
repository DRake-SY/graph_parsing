Name : download_ref
Inputs : []
Outputs : [[0, 'vep_ref_dir']]
Emits : []


Name : vep
Inputs : [[0, 'input_vcfs'], [0, 'vep_ref_dir_assembly'], [0, 'ref_fa'], [0, 'ref_fai'], [0, 'ref_dict']]
Outputs : [[0, 'vcf_annotated']]
Emits : []


Name : vcf_to_tsv
Inputs : [[0, 'vcf_annotated'], [0, 'ref_fa2'], [0, 'ref_fai2'], [0, 'ref_dict2']]
Outputs : [[0, 'tsv_annotations']]
Emits : []


Name : split_VEP_fields
Inputs : [[0, 'tsv_annotations']]
Outputs : [[0, 'vep_tsvs']]
Emits : []


