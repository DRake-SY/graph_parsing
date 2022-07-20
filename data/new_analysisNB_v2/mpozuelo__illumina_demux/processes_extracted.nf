Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


Name : parse_samplesheet
Inputs : [[0, 'ch_samplesheet']]
Outputs : [[0, 'ch_samples_info'], [1, 'ch_demux_parameters']]
Emits : []


Name : demux
Inputs : [[0, 'ch_samplesheet'], [1, 'ch_demux_parameters']]
Outputs : []
Emits : []


