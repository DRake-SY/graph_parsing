Name : getFASTQ
Inputs : [[0, 'SRA']]
Outputs : [[0, 'fastq_files_to_map'], [0, 'fastq_files_to_qc'], [0, 'fastq_files_to_screen']]
Emits : []


Name : getChrSeq
Inputs : [[0, 'chr_list']]
Outputs : [[0, 'chrfa']]
Emits : []


Name : makeGenomeIndex
Inputs : [[0, 'chrfa']]
Outputs : [[0, 'genome_idx']]
Emits : []


Name : mapFASTQ
Inputs : [[0, 'genome_idx'], [1, 'fastq_files_to_map']]
Outputs : [[0, 'bamfiles'], [1, 'star_stats']]
Emits : []


Name : getAnnotations
Inputs : []
Outputs : [[0, 'gtf_file']]
Emits : []


Name : indexBAM
Inputs : [[0, 'bamfiles']]
Outputs : [[0, 'indexedBAM_1'], [0, 'indexedBAM_2']]
Emits : []


Name : countFeature
Inputs : [[0, 'gtf_file'], [1, 'indexedBAM_1']]
Outputs : [[0, 'counts'], [1, 'counts_summary']]
Emits : []


Name : countExon
Inputs : [[0, 'gtf_file'], [1, 'indexedBAM_2']]
Outputs : [[0, 'exoncounts'], [1, 'exoncounts_summary']]
Emits : []


Name : statAnalysis
Inputs : [[0, 'counts'], [1, 'samples_metadata_1']]
Outputs : []
Emits : []


Name : statAnalysisSplicing
Inputs : [[0, 'exoncounts'], [1, 'samples_metadata_2'], [2, 'gtf_file']]
Outputs : []
Emits : []


Name : fastqc
Inputs : [[0, 'fastq_files_to_qc']]
Outputs : [[1, 'fastqc_results']]
Emits : []


Name : get_fastq_screen_genomes
Inputs : []
Outputs : [[0, 'FastQ_Screen_Genomes']]
Emits : []


Name : fastq_screen
Inputs : [[0, 'fastq_files_to_screen'], [1, 'FastQ_Screen_Genomes']]
Outputs : [[0, 'fastq_screen_txt']]
Emits : []


Name : multi_qc
Inputs : [[0, 'fastqc_results'], [1, 'star_stats'], [2, 'counts_summary'], [3, 'exoncounts_summary'], [4, 'fastq_screen_txt']]
Outputs : []
Emits : []


