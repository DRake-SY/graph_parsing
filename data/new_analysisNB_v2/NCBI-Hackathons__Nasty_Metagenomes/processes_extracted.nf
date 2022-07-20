Name : fasterqDump
Inputs : [[0, 'IN_accessions_raw']]
Outputs : [[0, 'IN_fastq_raw']]
Emits : []


Name : fastp
Inputs : [[0, 'IN_fastq_raw']]
Outputs : [[0, 'OUT_fastq_QC']]
Emits : []


Name : magicBLAST
Inputs : [[0, 'OUT_fastq_QC_1'], [1, 'IN_blastDB']]
Outputs : [[0, 'OUT_magicblast']]
Emits : []


Name : samtools
Inputs : [[0, 'OUT_magicblast']]
Outputs : [[0, 'OUT_samtools']]
Emits : []


Name : check_coverage
Inputs : [[0, 'OUT_samtools'], [1, 'IN_reference']]
Outputs : [[0, 'OUT_baits']]
Emits : []


Name : mash_sketch
Inputs : [[0, 'IN_reference_1']]
Outputs : [[0, 'OUT_mash_sketch']]
Emits : []


Name : mash_screen
Inputs : [[0, 'OUT_fastq_QC_1'], [1, 'OUT_mash_sketch']]
Outputs : [[0, 'OUT_mash_screen']]
Emits : []


Name : mash_hits_compiler
Inputs : [[0, 'OUT_mash_screen'], [1, 'IN_reference_2']]
Outputs : [[0, 'OUT_baits']]
Emits : []


Name : prepare_fastq
Inputs : [[0, 'OUT_fastq_QC_1']]
Outputs : [[0, 'OUT_preprare_fastq']]
Emits : []


Name : read_translator
Inputs : [[0, 'OUT_preprare_fastq']]
Outputs : [[0, 'OUT_translator']]
Emits : []


Name : hmmer
Inputs : [[0, 'OUT_translator'], [1, 'IN_hmmerDB'], [2, 'IN_threshold']]
Outputs : [[0, 'OUT_hmmer']]
Emits : []


Name : hits_compiler
Inputs : [[0, 'OUT_hmmer'], [1, 'IN_nf_to_seq']]
Outputs : [[0, 'OUT_baits']]
Emits : []


Name : guided_assembly
Inputs : [[0, 'OUT_baits'], [0, 'OUT_fastq_QC_2']]
Outputs : [[0, 'OUT_guided_assembly']]
Emits : []


