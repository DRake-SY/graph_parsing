Name : integrity_coverage
Inputs : [[0, 'startReads']]
Outputs : [[0, 'SIDE_phred'], [1, 'integrityReads']]
Emits : []


Name : fastQC
Inputs : [[0, 'integrityReads']]
Outputs : [[0, 'MAIN_fastqc_out']]
Emits : []


Name : fastqc_report
Inputs : [[0, 'MAIN_fastqc_out']]
Outputs : [[0, 'MAIN_fastqc_trim']]
Emits : []


Name : trimmomatic
Inputs : [[0, 'MAIN_fastqc_trim'], [0, 'SIDE_phred'], [1, 'IN_trimmomatic_opts']]
Outputs : [[0, 'MAIN_trimmomatic_out']]
Emits : []


Name : bowtie
Inputs : [[0, 'MAIN_trimmomatic_out']]
Outputs : [[0, 'UNMAPPED_out']]
Emits : []


Name : metaspades
Inputs : [[0, 'UNMMAPPED_forAssembly'], [1, 'IN_spades_opts'], [2, 'IN_spades_kmers']]
Outputs : [[0, 'MAIN_spades_out']]
Emits : []


Name : bowtie_assembly
Inputs : [[0, 'MAIN_spades_out_mapping'], [1, 'UNMMAPPED_forBowtie']]
Outputs : [[0, 'MAIN_bowtie_assembly']]
Emits : []


Name : card_rgi_assembly
Inputs : [[0, 'MAIN_spades_out_card_rgi']]
Outputs : [[0, 'RGI_assembly']]
Emits : []


Name : card_rgi_reads
Inputs : [[0, 'UNMAPPED_forCARDrgi']]
Outputs : []
Emits : []


