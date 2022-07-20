Name : split_fasta
Inputs : [[0, 'query']]
Outputs : [[0, 'rfam_query_chunks']]
Emits : []


Name : rfam_scan
Inputs : [[0, 'rfam_query_chunks']]
Outputs : [[0, 'rfam_scan_outputs']]
Emits : []


Name : merge_rfam_result
Inputs : [[0, 'rfam_scan_outputs']]
Outputs : [[0, 'rfam_merged_outputs']]
Emits : []


Name : dechunk_rfam_result
Inputs : [[0, 'rfam_merged_outputs']]
Outputs : [[0, 'rfam_annotations']]
Emits : []


