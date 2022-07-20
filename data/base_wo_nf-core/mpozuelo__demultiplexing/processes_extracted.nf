Name : demux_index
Inputs : [[0, 'ch_demux']]
Outputs : [[0, 'ch_demux_BC']]
Emits : []


Name : demux_BC
Inputs : [[0, 'ch_demux_BC']]
Outputs : [[0, 'ch_fastqc']]
Emits : []


Name : fastqc
Inputs : [[0, 'ch_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


