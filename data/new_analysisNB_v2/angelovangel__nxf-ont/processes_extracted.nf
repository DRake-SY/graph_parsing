Name : get_test_data
Inputs : []
Outputs : [[0, 'ch_input_files']]
Emits : []


Name : guppy_basecaller
Inputs : [[0, 'ch_input_files'], [1, 'ch_input_csv']]
Outputs : [[0, 'ch_fastq'], [0, 'ch_for_seqkit'], [1, 'ch_log_guppy_basecaller'], [2, 'ch_log_rename'], [3, 'ch_summary_guppy'], [4, 'ch_version_guppy']]
Emits : []


Name : guppy_barcoder
Inputs : [[0, 'ch_input_files'], [1, 'ch_input_csv']]
Outputs : [[0, 'ch_fastq'], [0, 'ch_for_seqkit'], [1, 'ch_log_guppy_barcoder'], [2, 'ch_log_rename'], [3, 'ch_summary_guppy'], [4, 'ch_version_guppy']]
Emits : []


Name : rename_barcode
Inputs : [[0, 'ch_input_files'], [1, 'ch_input_csv']]
Outputs : [[0, 'ch_fastq'], [0, 'ch_for_seqkit'], [1, 'ch_log_rename']]
Emits : []


Name : porechop
Inputs : [[0, 'ch_fastq']]
Outputs : [[0, 'ch_porechop'], [1, 'ch_log_porechop']]
Emits : []


Name : pycoqc
Inputs : [[0, 'params']]
Outputs : []
Emits : []


Name : seqtools
Inputs : [[0, '!params'], [1, 'fastq_stats_report_ch']]
Outputs : []
Emits : []


