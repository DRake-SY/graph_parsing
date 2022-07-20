Name : QConRawReads
Inputs : [[0, 'reads_for_fastqc']]
Outputs : [[0, 'raw_fastqc_files']]
Emits : []


Name : dropTag
Inputs : [[0, 'reads'], [1, 'configFile']]
Outputs : [[0, 'tagged_files_for_alignment'], [1, 'tagged_files_for_fastqc'], [2, 'params_files_for_estimation'], [3, 'tagged_rds_for_report']]
Emits : []


Name : QCFiltReads
Inputs : [[0, 'tagged_files_for_fastqc']]
Outputs : [[0, 'trimmed_fastqc_files']]
Emits : []


Name : getReadLength
Inputs : [[0, 'fastq_file_for_size_est']]
Outputs : [[0, 'read_length']]
Emits : []


Name : buildIndex
Inputs : [[0, 'genomeFile'], [1, 'annotationFile'], [2, 'read_length']]
Outputs : [[0, 'STARgenomeIndex']]
Emits : []


Name : mapping
Inputs : [[0, 'STARgenomeIndex'], [1, 'tagged_files_for_alignment']]
Outputs : [[0, 'STARmappedTags_for_filter'], [1, 'STARmappedFolders_for_qualimap'], [2, 'STARmappedFolders_for_multiQC']]
Emits : []


Name : removeMultimapping
Inputs : [[0, 'STARmappedTags_for_filter']]
Outputs : [[0, 'STARmappedTags_for_est']]
Emits : []


Name : dropEst
Inputs : [[0, 'STARmappedTags_for_est'], [0, 'params_files_for_estimation'], [1, 'barcodeFile'], [2, 'annotationFile'], [3, 'configFile']]
Outputs : [[0, 'estimates_rds'], [1, 'estimates_tsv'], [2, 'estimates_mtx_for_plots'], [3, 'estimates_mtx']]
Emits : []


Name : dropReport
Inputs : [[0, 'estimates_rds'], [0, 'tagged_rds_for_report'], [1, 'dropestScript']]
Outputs : [[0, 'outreport']]
Emits : []


Name : multiQC_unfiltered
Inputs : [[0, 'raw_fastqc_files'], [1, 'STARmappedFolders_for_multiQC']]
Outputs : [[0, 'multiQC']]
Emits : []


