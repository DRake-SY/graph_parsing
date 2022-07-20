OPERATION_1 string : Channel
    .fromFilePairs( params.reads, checkExists:true )
    .into{ read_pairs_ch; read_pairs_ch2 }
OPERATION_1 origin : [['params.reads, checkExists:true', 'A']]
OPERATION_1 gives  : [['read_pairs_ch', 'P'], ['read_pairs_ch2', 'P']]


OPERATION_2 string : filteredPairedReads_ch1
  .collectFile { it[0]+'\t'+"${it[0]}-rep1"+'\t'+it[1].name+'\t'+it[2].name+'\n'}
  .set {rnaSPAdes_samples_ch}
OPERATION_2 origin : [['filteredPairedReads_ch1', 'P']]
OPERATION_2 gives  : [['rnaSPAdes_samples_ch', 'P']]


