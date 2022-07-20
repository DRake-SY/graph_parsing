OPERATION_1 string : Channel
    .fromPath(params.accession_file)
    .splitCsv()
    .map { sample -> sample[0].trim() }
    .into { ch_accession_id; ch_accession_id_2; ch_accession_id_3 }
OPERATION_1 origin : [['params.accession_file', 'A']]
OPERATION_1 gives  : [['ch_accession_id', 'P'], ['ch_accession_id_2', 'P'], ['ch_accession_id_3', 'P']]


OPERATION_2 string : Channel
    .value(params.accession)
    .into { ch_accession_id; ch_accession_id_2; ch_accession_id_3 }
OPERATION_2 origin : [['params.accession', 'V']]
OPERATION_2 gives  : [['ch_accession_id', 'P'], ['ch_accession_id_2', 'P'], ['ch_accession_id_3', 'P']]


OPERATION_3 string : Channel
    .fromPath(params.key_file)
    .into { ch_key_file; ch_key_file_2 }
OPERATION_3 origin : [['params.key_file', 'A']]
OPERATION_3 gives  : [['ch_key_file', 'P'], ['ch_key_file_2', 'P']]


OPERATION_4 string : Channel
  .fromPath(params.cart_file)
  .set { ch_cart_file }
OPERATION_4 origin : [['params.cart_file', 'A']]
OPERATION_4 gives  : [['ch_cart_file', 'P']]


