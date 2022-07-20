OPERATION_1 string : Channel.from(file(params.sample_sheet)
        .splitCsv(header: true, sep: ","))
        .map { sample ->
            tuple(sample["name"], file(sample["short_R1"]), file(sample["short_R2"]))}
        .set{ illumina_ch }
OPERATION_1 origin : []
OPERATION_1 gives  : [['illumina_ch', 'P']]


OPERATION_2 string : Channel.from(file(params.sample_sheet)
        .splitCsv(header: true, sep: ","))
        .map { sample ->
            tuple(sample["name"], file(sample["long_reads"]))}
        .set{ long_read_ch }
OPERATION_2 origin : []
OPERATION_2 gives  : [['long_read_ch', 'P']]


OPERATION_3 string : Channel.from(file(params.sample_sheet)
            .splitCsv(header: true, sep: ","))
            .map { sample ->
                tuple(sample["name"], file(sample["long_reads"]), file(sample["short_R1"]), file(sample["short_R2"]))}
            .set{ hybrid_ch }
OPERATION_3 origin : []
OPERATION_3 gives  : [['hybrid_ch', 'P']]


OPERATION_4 string : contigsShortReadsOnly
    .mix(contigsLongReadsOnly,contigsHybrid)
    .into { contigsForSummary; contigsForProkka }
OPERATION_4 origin : [['contigsShortReadsOnly', 'P'], ['contigsLongReadsOnly', 'P'], ['contigsHybrid', 'P']]
OPERATION_4 gives  : [['contigsForSummary', 'P'], ['contigsForProkka', 'P']]


OPERATION_5 string : contigsShortReadsOnly
        .into { contigsForSummary; contigsForProkka }
OPERATION_5 origin : [['contigsShortReadsOnly', 'P']]
OPERATION_5 gives  : [['contigsForSummary', 'P'], ['contigsForProkka', 'P']]


OPERATION_6 string : contigsLongReadsOnly
        .into { contigsForSummary; contigsForProkka }
OPERATION_6 origin : [['contigsLongReadsOnly', 'P']]
OPERATION_6 gives  : [['contigsForSummary', 'P'], ['contigsForProkka', 'P']]


