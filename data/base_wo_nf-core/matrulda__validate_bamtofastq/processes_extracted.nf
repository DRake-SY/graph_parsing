Name : update_headers
Inputs : [[0, 'original_fastqs']]
Outputs : [[0, 'original_fastqs_updated_header']]
Emits : []


Name : sort_fastqs
Inputs : [[0, 'to_be_sorted_fastqs']]
Outputs : [[0, 'sorted_fastqs']]
Emits : []


Name : calculate_checksums
Inputs : [[0, 'sorted_fastqs']]
Outputs : []
Emits : []


