Name : WorkflowVersion
Inputs : []
Outputs : []
Emits : []


Name : Nremove
Inputs : [[0, 'fastq_ch']]
Outputs : [[0, 'fastq_Nremove_ch']]
Emits : []


Name : Backup
Inputs : [[0, 'config_file'], [1, 'log_file']]
Outputs : []
Emits : []


