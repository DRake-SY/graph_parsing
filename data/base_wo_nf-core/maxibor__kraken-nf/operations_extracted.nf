OPERATION_1 string : Channel
    .fromFilePairs( params.reads, size: params.pairedEnd ? 2 : 1 )
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\n" }
	.set {reads_to_trim}
OPERATION_1 origin : [['params.reads, size: params.pairedEnd ? 2 : 1', 'A']]
OPERATION_1 gives  : [['reads_to_trim', 'P']]


OPERATION_2 string : Channel
    .fromPath(params.krakendb, checkIfExists: true)
    .ifEmpty { exit 1, "Cannot find any KrakenDB matching: ${params.krakendb}\n" }
    .first()
    .set {krakendb}
OPERATION_2 origin : [['params.krakendb, checkIfExists: true', 'A']]
OPERATION_2 gives  : [['krakendb', 'P']]


OPERATION_3 string : kraken_report
    .into {kraken_report_parse; kraken_report_back}
OPERATION_3 origin : [['kraken_report', 'P']]
OPERATION_3 gives  : [['kraken_report_parse', 'P'], ['kraken_report_back', 'P']]


OPERATION_4 string : kraken_report_old
    .into {kraken_report_multiqc; kraken_report_bracken}
OPERATION_4 origin : [['kraken_report_old', 'P']]
OPERATION_4 gives  : [['kraken_report_multiqc', 'P'], ['kraken_report_bracken', 'P']]


OPERATION_5 string : kraken_report_multiqc
    .map {it -> it[1]}
    .set {kraken_report_multiqc_file}
OPERATION_5 origin : [['kraken_report_multiqc', 'P']]
OPERATION_5 gives  : [['kraken_report_multiqc_file', 'P']]


OPERATION_6 string : bracken_db = krakendb
OPERATION_6 origin : [['krakendb', 'P']]
OPERATION_6 gives  : [['bracken_db', 'P']]


