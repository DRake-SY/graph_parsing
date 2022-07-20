Name : getFastq
Inputs : [[0, 'SRAID']]
Outputs : [[0, 'sra_files']]
Emits : []


Name : dumpFastq
Inputs : [[0, 'sra_files']]
Outputs : [[0, 'fastq_files']]
Emits : []


Name : getChr
Inputs : [[0, 'liste_chromosomes']]
Outputs : [[0, 'genome_files']]
Emits : []


Name : concatChr
Inputs : [[0, 'genome_files']]
Outputs : [[0, 'genome_concat']]
Emits : []


Name : genomeIndex
Inputs : [[0, 'genome_concat']]
Outputs : [[0, 'star_index']]
Emits : []


Name : mapFastq
Inputs : [[0, 'fastq_files'], [1, 'star_index']]
Outputs : [[0, 'mapped_fastq_files_1'], [0, 'mapped_fastq_files_2']]
Emits : []


Name : samFastq
Inputs : [[0, 'mapped_fastq_files_1']]
Outputs : [[0, 'sam_fastq_files']]
Emits : []


Name : getGenomic_features
Inputs : []
Outputs : [[0, 'annotation']]
Emits : []


Name : getCount_feature
Inputs : [[0, 'annotation'], [1, 'mapped_fastq_files_2'], [2, 'sam_fastq_files']]
Outputs : [[0, 'FileCount'], [1, 'logsFileCount']]
Emits : []


Name : deseq
Inputs : [[0, 'SRAID2'], [1, 'FileCount'], [2, 'fichier_mutant']]
Outputs : [[0, 'result_filt_deseq'], [1, 'result_deseq'], [2, 'gene_counts']]
Emits : []


Name : plot
Inputs : [[0, 'result_deseq'], [1, 'gene_counts'], [2, 'result_filt_deseq']]
Outputs : []
Emits : []


