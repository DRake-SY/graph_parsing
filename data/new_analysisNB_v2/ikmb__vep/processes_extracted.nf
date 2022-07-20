Name : vcf_sites_only
Inputs : [[0, 'vcfs']]
Outputs : [[0, 'vcf_sites']]
Emits : []


Name : vep
Inputs : [[0, 'vcf_sites']]
Outputs : [[0, 'vcf_vep']]
Emits : []


