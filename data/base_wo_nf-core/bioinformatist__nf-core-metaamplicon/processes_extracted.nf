Name : fastp_single
Inputs : [[0, 'read_files']]
Outputs : [[1, 'for_mothur0'], [2, 'for_mothur1'], [3, 'for_group']]
Emits : []


Name : fastp_paired
Inputs : [[0, 'read_files']]
Outputs : [[1, 'for_mothur0'], [2, 'done']]
Emits : []


Name : mothur_in_box_single
Inputs : [[0, 'for_group'], [1, 'reference'], [2, 'taxonomy']]
Outputs : []
Emits : []


Name : mothur_in_box_paired
Inputs : [[0, 'done'], [1, 'reference'], [2, 'taxonomy']]
Outputs : []
Emits : []


