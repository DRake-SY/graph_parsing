OPERATION_1 string : Channel.fromPath(params.reads)
    .map { f -> tuple(f.baseName, f) }
    .set { readsToAlign }
OPERATION_1 origin : [['params.reads', 'A']]
OPERATION_1 gives  : [['readsToAlign', 'P']]


OPERATION_2 string : Channel.fromPath(params.reads)
    .set { readsToCat }
OPERATION_2 origin : [['params.reads', 'A']]
OPERATION_2 gives  : [['readsToCat', 'P']]


OPERATION_3 string : referenceFaidx.into { referenceFaidx1; referenceFaidx2 }
OPERATION_3 origin : [['referenceFaidx', 'P']]
OPERATION_3 gives  : [['referenceFaidx1', 'P'], ['referenceFaidx2', 'P']]


OPERATION_4 string : referenceFaidx1
    .splitCsv(sep: "\t")
    .map { it[0] }
    .combine(referenceFaidx2)
    .combine(alignedAll)
    .combine(alignedAllBai)
    .set { contigsRefBam }
OPERATION_4 origin : [['referenceFaidx1', 'P'], ['referenceFaidx2', 'P'], ['alignedAll', 'P'], ['alignedAllBai', 'P']]
OPERATION_4 gives  : [['contigsRefBam', 'P']]


