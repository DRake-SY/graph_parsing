OPERATION_1 string : Channel.fromPath(params.reference)
    .into {fasta_ch;fasta_ch1}
OPERATION_1 origin : [['params.reference', 'A']]
OPERATION_1 gives  : [['fasta_ch', 'P'], ['fasta_ch1', 'P']]


OPERATION_2 string : Channel
  .fromFilePairs( params.reads )
  .ifEmpty { error "Oops! Cannot find any file matching: ${params.reads}"  }
  .into { read_pairs_ch; read_pairs2_ch }
OPERATION_2 origin : [['params.reads', 'A']]
OPERATION_2 gives  : [['read_pairs_ch', 'P'], ['read_pairs2_ch', 'P']]


