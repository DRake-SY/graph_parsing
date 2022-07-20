OPERATION_1 string : Channel
    .fromPath(file(params.inputManifest))
    .splitCsv(header:true, sep:'\t')
    .map { row -> tuple(row.sampleID, row.bam, row.bai) }
    .set { bam_channel }
OPERATION_1 origin : [['file(params.inputManifest', 'A']]
OPERATION_1 gives  : [['bam_channel', 'P']]


OPERATION_2 string : fqPairs = Channel.create()
OPERATION_2 origin : []
OPERATION_2 gives  : [['fqPairs', 'P']]


OPERATION_3 string : fastqFiltered = razarFilteredEnd1.phase(razarFilteredEnd2).map{ fq1, fq2 -> [ fq1[0], fq1[1], fq2[1] ] }.tap(fqPairs)
OPERATION_3 origin : [['razarFilteredEnd1', 'P'], ['razarFilteredEnd2', 'P']]
OPERATION_3 gives  : [['fastqFiltered', 'P'], ['fqPairs', 'P']]


