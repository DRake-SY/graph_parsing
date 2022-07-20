Name : predictByMiranda
Inputs : [[0, 'inputfasta'], [1, 'microRNA_fasta_db']]
Outputs : [[1, 'miranda_overlap']]
Emits : []


Name : predictByTargetScan
Inputs : [[0, 'inputfasta'], [1, 'targetscan_lib']]
Outputs : [[1, 'targetScan_overlap']]
Emits : []


Name : predictByRNA22
Inputs : [[0, 'inputfasta'], [1, 'microRNA_fasta_db']]
Outputs : [[1, 'RNA22_overlap']]
Emits : []


Name : get_overlap_result
Inputs : [[0, 'miranda_overlap'], [1, 'targetScan_overlap'], [2, 'RNA22_overlap']]
Outputs : []
Emits : []


