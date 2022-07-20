Name : download_fastqs
Inputs : [[0, 'FASTQ_RUNS']]
Outputs : [[0, 'DOWNLOADED_FASTQS']]
Emits : []


Name : alevin_config
Inputs : [[0, 'FINAL_FASTQS_FOR_CONFIG']]
Outputs : [[0, 'ALEVIN_CONFIG']]
Emits : []


Name : alevin
Inputs : [[0, 'FINAL_FASTQS_FOR_ALEVIN'], [0, 'ALEVIN_CONFIG'], [1, 'TRANSCRIPT_TO_GENE']]
Outputs : [[0, 'ALEVIN_RESULTS']]
Emits : []


Name : alevin_to_mtx
Inputs : [[0, 'ALEVIN_RESULTS_FOR_PROCESSING']]
Outputs : [[0, 'ALEVIN_MTX']]
Emits : []


Name : droplet_qc_plot
Inputs : [[0, 'ALEVIN_QC_INPUTS']]
Outputs : [[0, 'ALEVIN_QC_PLOTS']]
Emits : []


Name : remove_empty_drops
Inputs : [[0, 'ALEVIN_MTX_FOR_EMPTYDROPS']]
Outputs : [[0, 'NONEMPTY_RDS']]
Emits : []


Name : rds_to_mtx
Inputs : [[0, 'NONEMPTY_RDS']]
Outputs : [[0, 'NONEMPTY_MTX']]
Emits : []


Name : compile_results
Inputs : [[0, 'COMPILED_RESULTS']]
Outputs : [[0, 'RESULTS_FOR_COUNTING']]
Emits : []


Name : validate_results
Inputs : [[0, 'ALEVIN_RESULTS_COUNT'], [1, 'TARGET_RESULT_COUNT']]
Outputs : [[0, 'DONE']]
Emits : []


