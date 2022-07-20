OPERATION_1 string : Channel
        .fromPath(bt1_dir+"/*.bt2")
        .ifEmpty {exit 1, "Cannot find any index matching : ${bt1}\n"}
        .collect()
        .set {bt1_ch}
OPERATION_1 origin : [['bt1_dir+"/*.bt2"', 'A']]
OPERATION_1 gives  : [['bt1_ch', 'P']]


OPERATION_2 string : Channel
        .fromPath(bt2_dir+"/*.bt2")
        .ifEmpty {exit 1, "Cannot find any index matching : ${params.bt2}\n"}
        .collect()
        .set {bt2_ch}
OPERATION_2 origin : [['bt2_dir+"/*.bt2"', 'A']]
OPERATION_2 gives  : [['bt2_ch', 'P']]


OPERATION_3 string : Channel
            .fromPath(bt3_dir+"/*.bt2")
            .ifEmpty {exit 1, "Cannot find any index matching : ${params.bt3}\n"}
            .collect()
            .set {bt3_ch}
OPERATION_3 origin : [['bt3_dir+"/*.bt2"', 'A']]
OPERATION_3 gives  : [['bt3_ch', 'P']]


OPERATION_4 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_4 origin : [['params.readPaths', 'V']]
OPERATION_4 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_5 string : Channel
            .from(params.readPaths)
            .map { row -> [ row[0], [ file(row[1][0], checkIfExists: true), file(row[1][1], checkIfExists: true) ] ] }
            .ifEmpty { exit 1, "params.readPaths was empty - no input files supplied" }
            .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_5 origin : [['params.readPaths', 'V']]
OPERATION_5 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_6 string : Channel
        .fromFilePairs(params.reads, size: params.single_end ? 1 : 2)
        .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nIf this is single-end data, please specify --single_end on the command line." }
        .into { ch_read_files_fastqc; ch_read_files_trimming }
OPERATION_6 origin : [['params.reads, size: params.single_end ? 1 : 2', 'A']]
OPERATION_6 gives  : [['ch_read_files_fastqc', 'P'], ['ch_read_files_trimming', 'P']]


OPERATION_7 string : summary.collect { k,v -> "${k.padRight(25)}: $v" }.join("\n")
OPERATION_7 origin : [['summary', 'P']]
OPERATION_7 gives  : []


