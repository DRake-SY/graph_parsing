OPERATION_1 string : ch_input_csv = Channel.fromPath( params.csv, checkIfExists: true )
OPERATION_1 origin : [['params.csv, checkIfExists: true', 'A']]
OPERATION_1 gives  : [['ch_input_csv', 'P']]


OPERATION_2 string : ch_input_csv = Channel.empty()
OPERATION_2 origin : []
OPERATION_2 gives  : [['ch_input_csv', 'P']]


OPERATION_3 string : ch_input_files = Channel.fromPath(params.input, checkIfExists: true)
OPERATION_3 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_3 gives  : [['ch_input_files', 'P']]


OPERATION_4 string : ch_input_files = Channel.fromPath(params.input, checkIfExists: true)
OPERATION_4 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_4 gives  : [['ch_input_files', 'P']]


OPERATION_5 string : ch_input_files = Channel.fromPath(params.input, checkIfExists: true)
OPERATION_5 origin : [['params.input, checkIfExists: true', 'A']]
OPERATION_5 gives  : [['ch_input_files', 'P']]


OPERATION_6 string : Channel.fromPath('bin/fastq-stats-report.Rmd').set{ fastq_stats_report_ch }
OPERATION_6 origin : [["'bin/fastq-stats-report.Rmd'", 'A']]
OPERATION_6 gives  : [['fastq_stats_report_ch', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(18)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


