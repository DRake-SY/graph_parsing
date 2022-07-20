Name : run_fastp
Inputs : [[0, 'fastp_ch']]
Outputs : []
Emits : []


Name : run_jellyfish
Inputs : [[0, 'jellyfish_ch']]
Outputs : []
Emits : []


Name : run_genome_assembly
Inputs : [[0, 'assembly_ch']]
Outputs : [[1, 'fasta_ch']]
Emits : []


Name : run_convertFasta
Inputs : [[0, 'fasta_ch']]
Outputs : [[0, 'assemblyStats_ch'], [0, 'blast_ch'], [0, 'minimap2_ch'], [0, 'busco_ch'], [0, 'blobtools2_ch1']]
Emits : []


Name : run_assemblyStats
Inputs : [[0, 'assemblyStats_ch']]
Outputs : []
Emits : []


Name : run_blast
Inputs : [[0, 'blast_ch']]
Outputs : [[1, 'blobtools2_ch2']]
Emits : []


Name : run_mapping
Inputs : [[0, 'minimap1_ch'], [1, 'minimap2_ch']]
Outputs : [[0, 'blobtools2_ch3']]
Emits : []


Name : run_busco
Inputs : [[0, 'busco_ch']]
Outputs : []
Emits : []


Name : run_blobtools
Inputs : [[0, 'blobtools2_ch1'], [1, 'blobtools2_ch3'], [2, 'blobtools2_ch2']]
Outputs : []
Emits : []


