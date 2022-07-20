OPERATION_1 string : ch_synapse_config = Channel.value( file(params.synapse_config) )
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_synapse_config', 'P']]


OPERATION_2 string : text
  .splitCsv()
  .map { row -> [ row[0], file(row[0]), row[1] ] }
  .set { ch_parent_ids }
OPERATION_2 origin : [['text', 'P']]
OPERATION_2 gives  : [['ch_parent_ids', 'P']]


OPERATION_3 string : ch_file_ids
  .collectFile(name: "file_ids.csv", storeDir: publish_dir, newLine: true)
OPERATION_3 origin : [['ch_file_ids', 'P']]
OPERATION_3 gives  : []


