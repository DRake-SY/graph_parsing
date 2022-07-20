Name : run_strelkaGenotyping
Inputs : [[0, 'pairs2genotype'], [1, 'bed'], [2, 'tbi'], [3, 'fasta_ref'], [4, 'fasta_ref_fai']]
Outputs : []
Emits : []


Name : run_strelka_somatic
Inputs : [[0, 'pairs'], [1, 'bed'], [2, 'tbi'], [3, 'fasta_ref'], [4, 'fasta_ref_fai']]
Outputs : [[0, 'vcffiles'], [1, 'tbifiles'], [2, 'regionfiles']]
Emits : []


Name : getAllelicFractionSomatic
Inputs : [[0, 'vcffiles']]
Outputs : [[0, 'passfiles']]
Emits : []


Name : run_strelka_germline
Inputs : [[0, 'bamFiles'], [1, 'bed'], [2, 'tbi'], [3, 'fasta_ref'], [4, 'fasta_ref_fai']]
Outputs : [[0, 'vcffiles'], [1, 'vcftbifiles']]
Emits : []


Name : filter_pass
Inputs : [[0, 'vcffiles2']]
Outputs : [[0, 'filtered']]
Emits : []


