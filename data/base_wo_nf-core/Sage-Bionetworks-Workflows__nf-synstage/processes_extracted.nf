Name : synapse_get
Inputs : [[0, 'ch_synapse_ids'], [1, 'ch_synapse_config']]
Outputs : [[0, 'ch_synapse_files']]
Emits : []


Name : update_input
Inputs : [[0, 'input_file'], [1, 'ch_synapse_sed']]
Outputs : [[0, 'ch_input_tweaked']]
Emits : []


