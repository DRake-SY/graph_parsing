OPERATION_1 string : ch_synapse_config = Channel.value(file(params.synapse_config))
OPERATION_1 origin : []
OPERATION_1 gives  : [['ch_synapse_config', 'P']]


OPERATION_2 string : Channel
  .fromList(synapse_uris)
  .set { ch_synapse_ids }
OPERATION_2 origin : [['synapse_uris', 'V']]
OPERATION_2 gives  : [['ch_synapse_ids', 'P']]


OPERATION_3 string : ch_synapse_files
  .map { syn_uri, syn_id, syn_file -> /-e 's|\b${syn_uri}\b|${outdir}\/${syn_id}\/${syn_file.name}|g'/ }
  .reduce { a, b -> "${a} ${b}" }
  .set { ch_synapse_sed }
OPERATION_3 origin : [['ch_synapse_files', 'P']]
OPERATION_3 gives  : [['ch_synapse_sed', 'P']]


