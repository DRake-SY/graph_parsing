Name : index
Inputs : [[0, 'fasta_index']]
Outputs : [[0, 'ref_dragen']]
Emits : []


Name : dragen
Inputs : [[0, 'dragen']]
Outputs : [[0, 'results'], [1, 'vcf_bcftools']]
Emits : []


Name : bcftools
Inputs : [[0, 'vcf_bcftools']]
Outputs : [[0, 'bcftools_multiqc']]
Emits : []


Name : multiqc
Inputs : [[0, 'bcftools_multiqc']]
Outputs : [[0, 'multiqc']]
Emits : []


