OPERATION_1 string : Channel.from(tables.findAll { it[1] })
.map { it -> [it[0], file(it[1])] }
.view()
  .combine(Channel.fromPath(params.sampletable))
  .set { deqms_input }
OPERATION_1 origin : [['tables.findAll { it[1] }', 'V'], ['params.sampletable', 'A']]
OPERATION_1 gives  : [['deqms_input', 'P']]


OPERATION_2 string : summary.collect { k,v -> "${k.padRight(15)}: $v" }.join("\n")
OPERATION_2 origin : [['summary', 'P']]
OPERATION_2 gives  : []


OPERATION_3 string : qccollect
  .toList()
  .map { it -> [it.collect() { it[0] }, it.collect() { it[1] } ] }
  .set { collected_feats_qc }
OPERATION_3 origin : [['qccollect', 'P']]
OPERATION_3 gives  : [['collected_feats_qc', 'P']]


