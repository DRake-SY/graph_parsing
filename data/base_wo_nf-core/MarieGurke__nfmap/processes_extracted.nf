Name : index_ref
Inputs : [[0, 'ref_index_ch']]
Outputs : [[0, 'ref_mapPE_ch'], [1, 'ref_mapSE_ch']]
Emits : []


Name : mapping
Inputs : [[0, 'ref_and_reads']]
Outputs : [[0, 'mapped_ch'], [1, 'id_channel']]
Emits : []


Name : filtering
Inputs : [[0, 'mapped_ch']]
Outputs : [[0, 'filtered_ch']]
Emits : []


Name : merge_bams
Inputs : [[0, 'filtered_ch']]
Outputs : [[0, 'merged_bam']]
Emits : []


Name : stats_file
Inputs : []
Outputs : [[0, 'stats_file_ch']]
Emits : []


Name : stats
Inputs : [[0, 'stats_file_ch'], [1, 'merged_bam']]
Outputs : [[2, 'stats_file']]
Emits : []


