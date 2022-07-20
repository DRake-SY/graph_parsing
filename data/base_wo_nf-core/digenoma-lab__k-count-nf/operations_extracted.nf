OPERATION_1 string : Channel.fromPath(file(params.reads_csv)).splitCsv(header: true, sep: '\t', strip: true)
                      .map{row -> [ row.sampleID, [file(row.fwd), file(row.rev)]]}
                      .ifEmpty{exit 1, "params.reads_csv was empty - no input files supplied" }
                      .set{reads_kmc}
OPERATION_1 origin : [['file(params.reads_csv', 'A']]
OPERATION_1 gives  : [['reads_kmc', 'P']]


OPERATION_2 string : Channel.fromFilePairs(params.reads, size: 2 )
        .ifEmpty{exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!" }
        .set{reads_kmc}
OPERATION_2 origin : [['params.reads, size: 2', 'A']]
OPERATION_2 gives  : [['reads_kmc', 'P']]


