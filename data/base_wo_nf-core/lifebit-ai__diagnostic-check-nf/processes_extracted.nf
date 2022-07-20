Name : manta
Inputs : [[0, 'pairBamManta'], [1, 'ch_fasta'], [2, 'ch_fai']]
Outputs : [[0, 'vcfManta'], [1, 'mantaToStrelka']]
Emits : []


Name : strelka
Inputs : [[0, 'pairBamStrelka'], [1, 'ch_fasta'], [2, 'ch_fai']]
Outputs : [[0, 'vcfStrelka']]
Emits : []


