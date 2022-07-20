OPERATION_1 string : Channel 
    .fromFilePairs( reads, checkIfExists: true, size: -1 )                                                           
    .ifEmpty { error "Can not find any reads matching ${reads}" }
    .set{ read_pairs_ch }
OPERATION_1 origin : [['reads, checkIfExists: true, size: -1', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P']]


OPERATION_2 string : Channel
    .fromPath( reads, checkIfExists: true )
    .set { reads_ch }
OPERATION_2 origin : [['reads, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['reads_ch', 'P']]


OPERATION_3 string : Channel.fromPath("${baseDir}/bin/fastq-stats-report.Rmd").set{ fastq_stats_report_ch }
OPERATION_3 origin : [['"${baseDir}/bin/fastq-stats-report.Rmd"', 'A']]
OPERATION_3 gives  : [['fastq_stats_report_ch', 'P']]


OPERATION_4 string : Channel.fromPath("${baseDir}/bin/fastq-stats-report-ont.Rmd").set{ fastq_stats_report_ont_ch }
OPERATION_4 origin : [['"${baseDir}/bin/fastq-stats-report-ont.Rmd"', 'A']]
OPERATION_4 gives  : [['fastq_stats_report_ont_ch', 'P']]


