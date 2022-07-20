OPERATION_1 string : ch_pairs = Channel.fromFilePairs(imzml_ibd_pair, flat: true)
OPERATION_1 origin : [['imzml_ibd_pair, flat: true', 'A']]
OPERATION_1 gives  : [['ch_pairs', 'P']]


OPERATION_2 string : ch_pairs.into { ch_pairs1; ch_pairs2 }
OPERATION_2 origin : [['ch_pairs', 'P']]
OPERATION_2 gives  : [['ch_pairs1', 'P'], ['ch_pairs2', 'P']]


OPERATION_3 string : rec_imzml.view { "imzML: $it" }
OPERATION_3 origin : [['rec_imzml', 'P']]
OPERATION_3 gives  : []


OPERATION_4 string : rec_ibd.view { "ibd: $it" }
OPERATION_4 origin : [['rec_ibd', 'P']]
OPERATION_4 gives  : []


