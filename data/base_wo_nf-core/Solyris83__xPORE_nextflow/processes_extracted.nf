Name : minimap2_fastq
Inputs : [[0, 'reads_minimap2_ch'], [1, 'params'], [2, 'params']]
Outputs : [[0, 'minimap2_sam_ch']]
Emits : []


Name : nanopolish_index
Inputs : [[0, 'reads_nanopolish_index_ch'], [1, 'params']]
Outputs : [[0, 'reads_index_ch'], [1, 'reads_fai_ch'], [2, 'reads_gzi_ch'], [3, 'reads_readdb_ch']]
Emits : []


Name : nanopolish_eventalign
Inputs : [[0, 'reads_nanopolish_eventalign_ch'], [1, 'minimap2_sam_ch'], [2, 'params'], [3, 'params'], [4, 'reads_index_ch'], [5, 'reads_fai_ch'], [6, 'reads_gzi_ch'], [7, 'reads_readdb_ch'], [8, 'params']]
Outputs : [[0, 'summary_ch'], [1, 'eventalign_ch'], [2, 'log_ch_0_3b'], [3, 'sampleID_ch_0_3b']]
Emits : []


Name : xpore_dataprep
Inputs : [[0, 'eventalign_ch'], [1, 'params'], [2, 'params'], [3, 'params'], [4, 'sampleID_ch_0_3b']]
Outputs : [[0, 'step1_eventalign_index_ch'], [1, 'step1_data_json_ch'], [2, 'step1_data_index_ch'], [3, 'step1_data_readcount_ch'], [4, 'step1_trascript_merged_ch'], [5, 'step1_data_log_ch'], [6, 'log_ch_1'], [7, 'sampleID_ch_1']]
Emits : []


Name : xpore_diffmod
Inputs : [[0, 'params'], [1, 'sampleID_ch_1']]
Outputs : [[0, 'log_ch_3']]
Emits : []


