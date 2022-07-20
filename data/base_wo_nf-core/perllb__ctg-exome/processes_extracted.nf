Name : parsesheet
Inputs : [[0, 'sheet'], [1, 'index']]
Outputs : [[0, 'demux_sheet']]
Emits : []


Name : demux
Inputs : [[0, 'demux_sheet']]
Outputs : [[0, 'mv_fastq']]
Emits : []


Name : moveFastq
Inputs : [[0, 'mv_fastq'], [1, 'move_fastq_csv']]
Outputs : [[0, 'run_analysis'], [1, 'fastqc_go']]
Emits : []


Name : dragen_align_vc
Inputs : [[0, 'run_analysis'], [1, 'analyze_csv']]
Outputs : [[0, 'done_analyze'], [1, 'dragen_metrics'], [2, 'annotate_vcf']]
Emits : []


Name : annotate
Inputs : [[0, 'annotate_vcf']]
Outputs : [[0, 'filter_vcf']]
Emits : []


Name : fastqc
Inputs : [[0, 'fastqc_go']]
Outputs : [[0, 'multiqc_fastqc']]
Emits : []


Name : dragen_stats
Inputs : [[0, 'dragen_metrics'], [1, 'dragen_summary']]
Outputs : [[0, 'multiqc_dragen'], [1, 'completed']]
Emits : []


Name : multiqc
Inputs : [[0, 'multiqc_fastqc']]
Outputs : []
Emits : []


Name : multiqc_run
Inputs : [[0, 'completed']]
Outputs : []
Emits : []


