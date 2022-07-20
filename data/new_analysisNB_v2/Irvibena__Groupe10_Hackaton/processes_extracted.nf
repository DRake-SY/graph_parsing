Name : DownloadFastqFiles
Inputs : [[0, 'samples']]
Outputs : [[0, 'sra_files']]
Emits : []


Name : sraToFastqZip
Inputs : [[0, 'sra_files']]
Outputs : [[0, 'fastq_files']]
Emits : []


Name : DownloadChromosomes
Inputs : [[0, 'liste_chromosomes']]
Outputs : [[0, 'genome_humain_zip']]
Emits : []


Name : MergeChr
Inputs : [[0, 'genome_humain_zip']]
Outputs : [[0, 'genome_merge']]
Emits : []


Name : indexGen
Inputs : [[0, 'genome_merge']]
Outputs : [[0, 'star_index']]
Emits : []


Name : getGenomic_features
Inputs : []
Outputs : [[0, 'annotation']]
Emits : []


Name : mapping_Fastq
Inputs : [[0, 'fastq_files'], [1, 'star_index']]
Outputs : [[0, 'mapped_fastq_1'], [0, 'mapped_fastq_2']]
Emits : []


Name : indexBam
Inputs : [[0, 'mapped_fastq_1']]
Outputs : [[0, 'sam_fastq_files']]
Emits : []


Name : getCountReads_feature
Inputs : [[0, 'annotation'], [1, 'mapped_fastq_2']]
Outputs : [[0, 'FileReads'], [1, 'logsFileReads']]
Emits : []


Name : dataAnalysis
Inputs : [[0, 'FileReads'], [1, 'fichier_meta']]
Outputs : [[0, 'histo'], [1, 'MA'], [2, 'plots_counts'], [3, 'disp'], [4, 'object_res_1'], [5, 'object_res_2']]
Emits : []


Name : plotVolcano
Inputs : [[0, 'object_res_2']]
Outputs : []
Emits : []


