Name : demux_index
Inputs : [[0, 'ch_demux']]
Outputs : [[0, 'ch_demux_index2']]
Emits : []


Name : demux_index2
Inputs : [[0, 'ch_demux_index2']]
Outputs : [[0, 'ch_demux_BC']]
Emits : []


Name : demux_BC
Inputs : [[0, 'ch_demux_BC']]
Outputs : [[0, 'ch_change_header']]
Emits : []


Name : change_header
Inputs : [[0, 'ch_change_header']]
Outputs : [[0, 'ch_umi_removal'], [0, 'ch_fastqc'], [1, 'ch_merge_samplesheet']]
Emits : []


Name : remove_umi
Inputs : [[0, 'ch_umi_removal']]
Outputs : []
Emits : []


Name : fastqc
Inputs : [[0, 'ch_fastqc']]
Outputs : [[0, 'fastqc_results']]
Emits : []


Name : get_software_versions
Inputs : []
Outputs : [[0, 'software_versions_yaml']]
Emits : []


