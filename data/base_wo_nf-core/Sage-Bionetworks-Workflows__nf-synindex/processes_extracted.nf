Name : get_user_id
Inputs : [[0, 'ch_synapse_config']]
Outputs : [[0, 'ch_user_id']]
Emits : []


Name : update_owner
Inputs : [[0, 'ch_user_id'], [1, 's3_prefix']]
Outputs : [[0, 'ch_update_owner_done']]
Emits : []


Name : register_bucket
Inputs : [[0, 'bucket_name'], [1, 'base_key'], [2, 'ch_synapse_config'], [3, 'ch_update_owner_done']]
Outputs : [[0, 'ch_storage_id']]
Emits : []


Name : list_objects
Inputs : [[0, 's3_prefix'], [1, 'bucket_name']]
Outputs : [[0, 'ch_objects']]
Emits : []


Name : synapse_mirror
Inputs : [[0, 'ch_objects'], [1, 's3_prefix'], [2, 'params'], [3, 'ch_synapse_config']]
Outputs : [[0, 'ch_parent_ids_csv']]
Emits : []


Name : synapse_index
Inputs : [[0, 'ch_parent_ids'], [1, 'ch_storage_id'], [2, 'ch_synapse_config']]
Outputs : [[0, 'ch_file_ids']]
Emits : []


