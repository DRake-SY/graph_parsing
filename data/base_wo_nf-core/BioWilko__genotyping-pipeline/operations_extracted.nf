OPERATION_1 string : id_ch
  .splitText()
  .map{it -> it.trim()}
  .into {aln_ids_ch;consensus_id_ch}
OPERATION_1 origin : [['id_ch', 'P']]
OPERATION_1 gives  : [['aln_ids_ch', 'P'], ['consensus_id_ch', 'P']]


