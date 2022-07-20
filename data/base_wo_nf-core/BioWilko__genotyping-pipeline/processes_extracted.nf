Name : custom_metadata
Inputs : []
Outputs : [[0, 'metadata_ch']]
Emits : []


Name : pull_cog_ids
Inputs : [[0, 'metadata_ch']]
Outputs : [[0, 'id_ch'], [1, 'sender_ids_ch']]
Emits : []


Name : cat_msa
Inputs : [[0, 'aln_ids_ch']]
Outputs : [[0, 'msa_out_ch']]
Emits : []


Name : cat_consensus
Inputs : [[0, 'consensus_id_ch']]
Outputs : [[0, 'consensus_out_ch']]
Emits : []


Name : aln2type
Inputs : [[0, 'msa_out_ch']]
Outputs : [[0, 'type_ch']]
Emits : []


Name : pangolin
Inputs : [[0, 'consensus_out_ch']]
Outputs : [[0, 'lineage_ch']]
Emits : []


Name : report
Inputs : [[0, 'type_ch'], [1, 'lineage_ch'], [2, 'sender_ids_ch']]
Outputs : []
Emits : []


